/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Instruction decode is preformed in this module. 
 * Experiments with a lowlevel version did not give any gain in size.
 * However:
 *  - There is a lut or two to pinch by better analysis of startup
 *    conditions.
 *  - If we do not use a lazy decoding, the test of rd == 0  and
 *    rs1 == 0 can be multiplexed with the zero-detector just before
 *    the holding register ADR_O[31:0]. This will save a few luts.
 * 
 * All in all there is little to gain by manipulating this module,
 * that also will need to be flexible if we are to implement 
 * standard extension -M and/or -C.
 * 
 * 
 * Microcode program counter
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                                ____      |
 * dinx[7:2] --------------------| or |     |
 * illegal_or_qualint_or_RST_I --|____|----|1\
 *                                         |  |--- minx[7:2]
 * rinx[7:2] ------------------------------|0/
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                       ____               |
 * dinx[1] -------------| or |   ___        |
 * illegal_or_qualint_--|____|--| & |------|1\
 * RST_I-----------------------o|___|      |  |--- minx[1]
 * rinx[1] --------------------------------|0/
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                                          |
 * illegal_or_qualint_or_RST_I --+          |
 * qualint_or_RST_I ------------|1\         |
 *                              |  |-------|1\
 * dinx[0] ---------------------|0/        |  |--- minx[0]
 *                                       +-|0/
 * maybranch -----------+                |
 * takebranch ---------|1\   ____        |
 *                     |  |-|    |-------+
 * rinx[0] ------------|0/  | or |
 * buserror-----------------|____|
 * 
 * When power-on, dinx is used, so a "lb x0,0(x0)" is executed.
 * 
 * Parameter:
 * LAZY_DECODE    0 : Full decode of the riscv instruction. Any unknown instruction leads to a trap
 *                1 : Decode of most riscv instructions. No decode in some minor code spaces
 *                2 : Near minimal decode of riscv instructions. Not recommended
 */
module m_ucodepc
  # ( parameter LAZY_DECODE = 0, MULDIV = 1 )
  (
   input        corerunning, //         Control startup
   input [7:0]  rinx, //                From ucode
   input        sa28,sa29,sa30,sa37, // From ucode
   input        sa32,sa15, //           == 2'b10 triggers ucode jmp to alternate operand fetch from SRAM
   input        qualint, //             Qualified interrupt
   input        is_brcond, //           Branch condition
   input [31:0] INSTR, //               Instruction to decode at OpCode fetch
   input [31:0] B, //                   B[1:0] to find alignment errors. B[31] to distinguish EBR/SRAM
   input [31:0] DAT_O, //               DAT_O[31] to find sign of variable
   input        RST_I, //               NMI
   input        buserror, //            Accessing empty region if high
   input        ceM, //                 Uses shift-loop or loads or clears bidirectional shift register
   input        rlastshift, //          Together with ceM, last shift in shift-loop
   input        potentialMODbranch, //  Distinguish between DIV[U] and MOD[U]. Together with ceM, branch on sign DAT_O[31]
   
   output [7:0] minx, //                Microcode PC
   output       ucodepc_killwarnings
   );
   wire [7:0]   dinx;
   wire         usedinx, maybranch, takebranch;
   wire         Adr0Mustbe0 = sa29;
   wire         Adr1Mustbe0 = sa30;
   wire         use_brcond  = sa37;
   /* verilator lint_off UNUSED */
   wire         illegal;
   /* verilator lint_on UNUSED */
                
`ifdef verilator
   function [1:0] get_branchvariables;
      // verilator public
      get_branchvariables = {is_brcond,use_brcond};
   endfunction
   function [0:0] get_usedinx;
      // verilator public
      get_usedinx = usedinx;
   endfunction
   function [5:0] get_ucodepcinfo;
      // verilator public
      get_ucodepcinfo = {buserror,usedinx,qualint,illegal,maybranch,takebranch};
   endfunction
   function [7:0] get_dinx;
      // verilator public
      get_dinx = dinx;
   endfunction
`endif

   wire         illegal_funct7_or_illegal_rs1_rd;
   wire         main_illegal;
   
   assign usedinx   = sa28;
   assign maybranch = Adr0Mustbe0 | Adr1Mustbe0 | use_brcond | (sa32 & ~sa15) | ceM;

   /* Slight mangling of INSTRUCTION to an index.

    This is main_illegal
    5'b00000 : 0
    5'b00001 : 1
    5'b00010 : 0
    5'b00011 : 0
    5'b00100 : 0
    5'b00101 : 0
    5'b00110 : 1
    5'b00111 : 1
    5'b01000 : 0
    5'b01001 : 1
    5'b01010 : 1
    5'b01011 : 1
    5'b01100 : 0
    5'b01101 : 0
    5'b01110 : 1
    5'b01111 : 1
    5'b10000 : 1
    5'b10001 : 1
    5'b10010 : 1
    5'b10011 : 1
    5'b10100 : 1
    5'b10101 : 1
    5'b10110 : 1
    5'b10111 : 1
    5'b11000 : 0
    5'b11001 : 0
    5'b11010 : 1
    5'b11011 : 0
    5'b11100 : 0
    5'b11101 : 1
    5'b11110 : 1
    5'b11111 : 1
    */
   generate
      if ( MULDIV ) begin
         assign dinx[0] = (INSTR[6:4] == 3'b011 & INSTR[2] == 1'b0) ? INSTR[25] : INSTR[2];
      end else begin
         assign dinx[0] = INSTR[2];
      end
   endgenerate
   //wire is_lui = INSTR[6:2] == 5'b01101; Simplified because main_illegal covers 
   wire is_lui = INSTR[5:4] == 2'b11 & INSTR[2] == 1'b1;

   assign dinx[1] = is_lui ? 1 : ((~INSTR[6]&INSTR[5])&INSTR[30]) | ((~(~INSTR[6]&INSTR[5]))&INSTR[3]);
   assign dinx[2] = INSTR[4];
   assign dinx[3] = INSTR[5];
   assign dinx[4] = INSTR[6];

   
   /* assign dinx[7:5] = INSTR[14:12]; Need some more space, so index sligthly more elaborate */
   assign dinx[5] = INSTR[12]; // is_lui ? 1 : INSTR[12];
   /* Candidates to compress:
    * INSTR[6:0]
    * 6543210
    *   xxx
    * 0110111 lui
    * 0010111 auipc
    * 1101111jal
    */
   assign dinx[7]   = INSTR[14] & (INSTR[4:2] != 3'b101) & (INSTR[5:2] != 4'b1011);
   assign dinx[6]   = INSTR[13] & (INSTR[4:2] != 3'b101);

   generate
      if ( LAZY_DECODE != 0 ) begin
         // =======================================================
         // Nearly full instruction decode. Does not
         // check some minor code spaces.
         // =======================================================
         assign illegal_funct7_or_illegal_rs1_rd = 1'b0;

      end else begin
         
         /* verilator lint_off UNUSED */
         wire [2:0] funct3 = INSTR[14:12];
         wire [6:0] funct7 = INSTR[31:25];
         wire [6:0] opcode = INSTR[6:0];
         /* verilator lint_on UNUSED */

         if ( MULDIV == 0 ) begin
            // =======================================================
            // Full instruction decode. Costs around 16 luts more 
            // than LAZY_DECODE == 1. Without multiplication
            // =======================================================
            /*  
             Instructions and, or, slli, srli, add, sll, slt, sltu, xor and srl
             should only be valid when funct7 == 7'b00000000. 
             Likewise, srai, sub, and sra should only be valid when 
             funct7 == 7'b0100000. 
                                                               checkfunct7
                                                               | funct7_5_dontcare
             funct7  rs2   rs1 funct3 rd opcode   Instruction  | |
             0000000 shamt rs1 001,   rd 00100xx  slli         1 0
             0x00000 shamt rs1 101,   rd 00100xx  srli/srai    1 1
             0x00000 rs2   rs1 000,   rd 01100xx  add/sub      1 1
             0000000 rs2   rs1 001,   rd 01100xx  sll          1 0
             0000000 rs2   rs1 010,   rd 01100xx  slt          1 0
             0000000 rs2   rs1 011,   rd 01100xx  sltu         1 0
             0000000 rs2   rs1 100,   rd 01100xx  xor          1 0
             0x00000 rs2   rs1 101,   rd 01100xx  srl/sra      1 1
             0000000 rs2   rs1 110,   rd 01100xx  or           1 0
             0000000 rs2   rs1 111,   rd 01100xx  and          1 0
             */
            
            wire       checkfunct7 = 
                       (opcode[6:4] == 3'b011 && opcode[2] == 0 ) ||
                       (opcode[6:4] == 3'b001 && opcode[2] == 0 && funct3[1:0] == 2'b01 );
            wire       funct7_5_dontcare =
                       (opcode[6:4] == 3'b001 && opcode[2] == 0 && funct3 == 3'b101) ||
                       (opcode[6:4] == 3'b011 && opcode[2] == 0 && (funct3 == 3'b101 || funct3 == 3'b000));
            wire       mostof_funct7_ne0 = {funct7[6],funct7[4:0]} != 6'h0;
            
            /* 
             Issue 3:
             
             ecall should only be decoded when field rs1 and rd are 5'b00000, and
             imm12 == 12'h0. imm12 is used in the decode in ucode.h
             
             Likewise, ebreak should only be decoded when field rs1 and rd are
             5'b00000, and imm12 == 12'h1. The whole of imm12 is used in
             this decode in ucode.h.
             
             Also, decode of instruction wfi is to relaxed. Here also fields rs1
             and rd are not checked. The whole of imm12 is checked in the decode
             in ucode.h.
             
             Also, decode of instruction mret is to relaxed. Here also fields rs1
             and rd are not checked. The whole of imm12 is checked.
             
             |__imm12______|
             funct7   rs2    rs1    funct3 rd      opcode
             0000000, 00000, 00000, 000,   00000,  1110011, ecall
             0000000, 00001, 00000, 000,   00000,  1110011, ebreak
             0001000, 00101, 00000, 000,   00000,  1110011, wfi 
             0011000, 00010, 00000, 000,   00000,  1110011, mret
             00            11100xx         
             */
            wire       check_rs1_rd = (opcode[6:4] == 3'b111 && opcode[2] == 0) && (funct3[1:0] == 2'b00);
            wire       rs1_ne_zero = INSTR[19:15] != 5'h0;
            wire       rd_ne_zero  = INSTR[11:7] != 5'h0;
            wire       illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
            
            assign illegal_funct7_or_illegal_rs1_rd
              = (checkfunct7 & mostof_funct7_ne0) |
                (checkfunct7 & ~funct7_5_dontcare & funct7[5]) |
                illegal_rs1_rd;
         end else begin
            /* verilator lint_off UNUSED */
            // =======================================================
            // Full instruction decode. 
            // With multiplication and division
            // =======================================================
            /*  
                                                              Check funct[31],[29:26]
                                                              | i30dontcare
                                                              | | i25dontcare
             funct7  rs2   rs1 funct3 rd opcode   Instruction | | |
             0000000 shamt rs1 001,   rd 00100xx  slli        1 0 0
             0000000 shamt rs1 101,   rd 00100xx  srli        1 1 0
             0100000 shamt rs1 101,   rd 00100xx  srai        1 1 0
                                                                      
             0000000 rs2   rs1 000,   rd 01100xx  add         1 1 1
             0000001 rs2   rs1 000,   rd 01100xx  mul         1 1 1
             0100000 rs2   rs1 000,   rd 01100xx  sub         1 1 1
             0000000 rs2   rs1 001,   rd 01100xx  sll         1 0 1
             0000001 rs2   rs1 001,   rd 01100xx  mulh        1 0 1
             0000000 rs2   rs1 010,   rd 01100xx  slt         1 0 1
             0000001 rs2   rs1 010,   rd 01100xx  mulhsu      1 0 1
             0000000 rs2   rs1 011,   rd 01100xx  sltu        1 0 1
             0000001 rs2   rs1 011,   rd 01100xx  mulhu       1 0 1
             0000000 rs2   rs1 100,   rd 01100xx  xor         1 0 1
             0000001 rs2   rs1 100,   rd 01100xx  div         1 0 1
             0000000 rs2   rs1 101,   rd 01100xx  srl         1 1 1
             0100000 rs2   rs1 101,   rd 01100xx  sra         1 1 1
             0000001 rs2   rs1 101,   rd 01100xx  divu        1 1 1
             0000000 rs2   rs1 110,   rd 01100xx  or          1 0 1
             0000001 rs2   rs1 110,   rd 01100xx  rem         1 0 1
             0000000 rs2   rs1 111,   rd 01100xx  and         1 0 1
             0000001 rs2   rs1 111,   rd 01100xx  remu        1 0 1
             
             In addition comes Issue 3 as described aboce
             */
            wire two_funct3_cases = (funct3 == 3'b000 | funct3 == 3'b101);
            wire checkfunct7 = (opcode[6:4] == 3'b001&& opcode[2] == 0 && funct3[1:0] == 2'b01 ) || (opcode[6:2] == 5'b01100); 
            wire i30dontcare = (opcode[6:4] == 3'b001&& opcode[2] == 0 && funct3 == 3'b101 ) | (opcode[6:2] == 5'b01100) & two_funct3_cases;
            wire i25dontcare = (opcode[6:4] == 3'b011&& opcode[2] == 0);

            wire check_rs1_rd = (opcode[6:4] == 3'b111 && opcode[2] == 0) && (funct3[1:0] == 2'b00);
            wire rs1_ne_zero = INSTR[19:15] != 5'h0;
            wire rd_ne_zero  = INSTR[11:7] != 5'h0;
            wire illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
            

            wire muchof_funct7_ne0 = {funct7[6],funct7[4:1]} != 5'h0;
            assign illegal_funct7_or_illegal_rs1_rd  
              =  (checkfunct7 & (
                                 muchof_funct7_ne0 |
                                 (~i30dontcare & INSTR[30] ) |
                                 (~i25dontcare & INSTR[25] ) |
                                 (i30dontcare & i25dontcare & INSTR[30] & INSTR[25] ) ))
                  | illegal_rs1_rd;
            /* verilator lint_on UNUSED */
         end
      end

      if ( LAZY_DECODE == 2 ) begin
         assign main_illegal = ~INSTR[0];
      end else begin
         
          
         /* The Main illegal signal
          *
          * illegal_a = (16'b1100111011000010 >> INSTR[5:2]); opens up for prefix 0001011, custom-0
          * illegal_b = (16'b1110010011111111 >> INSTR[5:2]);
          * illegal = (~INSTR[6] & illegal_a) | (INSTR[6] & illegal_b ) | ~INSTR[1] | ~INSTR[0] |
          *           illegal_funct7_or_illegal_rs1_rd
          */
         
         reg              illegal_a, illegal_b;
         always @(/*AS*/INSTR)
           case ( INSTR[5:2] )
             4'b0000 : {illegal_b,illegal_a} = 2'b10;
             4'b0001 : {illegal_b,illegal_a} = 2'b11;
             4'b0010 : {illegal_b,illegal_a} = 2'b10;
             4'b0011 : {illegal_b,illegal_a} = 2'b10;
             4'b0100 : {illegal_b,illegal_a} = 2'b10;
             4'b0101 : {illegal_b,illegal_a} = 2'b10;
             4'b0110 : {illegal_b,illegal_a} = 2'b11;
             4'b0111 : {illegal_b,illegal_a} = 2'b11;
             4'b1000 : {illegal_b,illegal_a} = 2'b00;
             4'b1001 : {illegal_b,illegal_a} = 2'b01;
             4'b1010 : {illegal_b,illegal_a} = 2'b11;
             4'b1011 : {illegal_b,illegal_a} = 2'b01;
             4'b1100 : {illegal_b,illegal_a} = 2'b00;
             4'b1101 : {illegal_b,illegal_a} = 2'b10;
             4'b1110 : {illegal_b,illegal_a} = 2'b11;
             4'b1111 : {illegal_b,illegal_a} = 2'b11;
           endcase
         assign main_illegal = (~INSTR[6] & illegal_a) | 
                               (INSTR[6] & illegal_b ) | 
                               ~INSTR[1] |
                               ~INSTR[0];
      end
   endgenerate

   assign  illegal = (main_illegal | illegal_funct7_or_illegal_rs1_rd) & corerunning;
   
   
   /* takebranch. Microcode must diverge when we have an alignment error,
    * a taken branch, or an opcode fetch when we read from SRAM, or the
    * last shift in a MUL/DIV shift loop.
    *                     _              ____
    * Adr0Mustbe0 -------|&|------------|    |--- takebranch
    * B[0] --------------|_|  +---------| or |
    *                     _   | +-------|    |
    * Adr1Mustbe0 -------|&|--+ | +-----|    |
    * B[1] --------------|_|    | | +---|____|
    *                     _     | | |
    * use_brcond --------|&|----+ | |
    * is_brcond ---------|_|      | |
    *                     _       | |
    * read_instr --------|&|------+ |
    * B[31] -------------|_|        |
    *                     _         |
    * ceM ---------------|&|--------+
    *               __  +|_|
    * rlastshift --|or|-+
    * isDIVbr  ----|__|
    * 
    * #define CH13 (( OI << 34) | sr_h) // ceM==0 clrM==1 conditional hlod, and branch on INSTR[15]. Last inch?
    */
   wire             qualint_or_RST_I = qualint | RST_I;
   wire             illegal_or_qualint = (illegal | qualint);
   wire             illegal_or_qualint_or_RST_I = (illegal | qualint | RST_I);
   assign takebranch = 
                       (Adr0Mustbe0 & B[0]) |
                       (Adr1Mustbe0 & B[1]) |                
                       (use_brcond & is_brcond) |
                       (sa32 & ~sa15 & B[31] ) |
                       (ceM & rlastshift );                       
   wire             usedinx_or_RST_I_notcorerunning = usedinx | RST_I | ~corerunning;

   assign minx[7:2] = (usedinx_or_RST_I_notcorerunning ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I}}) : rinx[7:2]);
   assign minx[1]   = (usedinx_or_RST_I_notcorerunning ? ( (dinx[1] | illegal_or_qualint) & ~RST_I) : rinx[1]);
   wire mostofminx0 = (buserror | (usedinx_or_RST_I_notcorerunning ? (illegal_or_qualint_or_RST_I ? qualint_or_RST_I : dinx[0]) : (maybranch ? takebranch : rinx[0])));   
   wire doMODbranch_or_signbranch = potentialMODbranch & ( (INSTR[13] & ~ceM) | (DAT_O[31] & ceM) );
   assign minx[0]   = mostofminx0 | doMODbranch_or_signbranch;

   assign ucodepc_killwarnings = INSTR[31] | &INSTR[29:15] | &INSTR[11:7] | &B | INSTR[1] | &DAT_O[31:0];
   
endmodule
