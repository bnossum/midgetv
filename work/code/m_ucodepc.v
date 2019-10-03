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
 * usedinx_or_RST_I-------------------------+
 *                                ____      |
 * dinx[7:2] --------------------| or |     |
 * illegal_or_qualint_or_RST_I --|____|----|1\
 *                                         |  |--- minx[7:2]
 * rinx[7:2] ------------------------------|0/
 * 
 * usedinx_or_RST_I-------------------------+
 *                       ____               |
 * dinx[1] -------------| or |   ___        |
 * illegal_or_qualint_--|____|--| & |------|1\
 * RST_I-----------------------o|___|      |  |--- minx[1]
 * rinx[1] --------------------------------|0/
 * 
 * usedinx_or_RST_I ------------------------+
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
  # ( parameter LAZY_DECODE = 0 )
  (
   input        corerunning, //         Control startup
   input [7:0]  rinx, //                From ucode
   input        sa28,sa29,sa30,sa37, // From ucode
   input        sa32,sa15, //           == 2'b10 triggers ucode jmp to alternate operand fetch from SRAM
   input        qualint, //             Qualified interrupt
   input        is_brcond, //           Branch condition
   input [31:0] INSTR, //               Instruction to decode at OpCode fetch
   input [31:0] B, //                   B[1:0] to find alignment errors. B[31] to distinguish EBR/SRAM
   input        RST_I, //               NMI
   input        nobuserror, //          Accessing empty region if low
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
      get_ucodepcinfo = {~nobuserror,usedinx,qualint,illegal,maybranch,takebranch};
   endfunction
   function [7:0] get_dinx;
      // verilator public
      get_dinx = dinx;
   endfunction
`endif

   wire         illegal_funct7_or_illegal_rs1_rd;
   wire         main_illegal;
   
   assign usedinx   = sa28;
   assign maybranch = Adr0Mustbe0 | Adr1Mustbe0 | use_brcond | (sa32 & ~sa15);
   
   // Slight mangling of INSTRUCTION to an index. 
   assign dinx[0]   = INSTR[2];
   assign dinx[1]   = ((~INSTR[6]&INSTR[5])&INSTR[30]) | ((~(~INSTR[6]&INSTR[5]))&INSTR[3]);
   assign dinx[4:2] = INSTR[6:4];
   
   /* assign dinx[7:5] = INSTR[14:12]; Need some more space, so index sligthly more elaborate */
   assign dinx[5] = INSTR[12];
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
         
         // =======================================================
         // Full instruction decode. Costs around 16 luts more 
         // than LAZY_DECODE == 1.
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
         
         wire [6:0] funct7 = INSTR[31:25];
         wire [2:0] funct3 = INSTR[14:12];
         /* verilator lint_off UNUSED */
         wire [6:0] opcode = INSTR[6:0];
         /* verilator lint_on UNUSED */
         wire       checkfunct7 = 
                    (opcode[6:2] == 5'b01100) ||
                    (opcode[6:2] == 5'b00100 && funct3[1:0] == 2'b01 );
         wire       funct7_5_dontcare =
                    (opcode[6:2] == 5'b00100 && funct3 == 3'b101) ||
                    (opcode[6:2] == 5'b01100 && (funct3 == 3'b101 || funct3 == 3'b000));
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
         wire       check_rs1_rd = (opcode[6:2] == 5'b11100) && (funct3[1:0] == 2'b00);
         wire       rs1_ne_zero = INSTR[19:15] != 5'h0;
         wire       rd_ne_zero  = INSTR[11:7] != 5'h0;
         wire       illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
         
         assign illegal_funct7_or_illegal_rs1_rd
           = (checkfunct7 & mostof_funct7_ne0) |
             (checkfunct7 & ~funct7_5_dontcare & funct7[5]) |
             illegal_rs1_rd;
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
    * a taken branch, or an opcode fetch when we read from SRAM
    *                     _              ____
    * Adr0Mustbe0 -------|&|------------|    |--- takebranch
    * B[0] --------------|_|  +---------| or |
    *                     _   | +-------|    |
    * Adr1Mustbe0 -------|&|--+ | +-----|____|
    * B[1] --------------|_|    | |
    *                     _     | |
    * use_brcond --------|&|----+ |
    * is_brcond ---------|_|      |
    *                     _       |
    * read_instr --------|&|------+
    * B[31] -------------|_|
    */
   wire             qualint_or_RST_I = qualint | RST_I;
   wire             illegal_or_qualint = (illegal | qualint);
   wire             illegal_or_qualint_or_RST_I = (illegal | qualint | RST_I);
   assign takebranch = 
                       (Adr0Mustbe0 & B[0]) |
                       (Adr1Mustbe0 & B[1]) |                
                       (use_brcond & is_brcond) |
                       (sa32 & ~sa15 & B[31] );
   wire             usedinx_or_RST_I = usedinx | RST_I | ~corerunning;

   assign minx[7:2] = (usedinx_or_RST_I ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I}}) : rinx[7:2]);
   assign minx[1]   = (usedinx_or_RST_I ? ( (dinx[1] | illegal_or_qualint) & ~RST_I) : rinx[1]);
   assign minx[0]   = (~nobuserror | (usedinx_or_RST_I ? (illegal_or_qualint_or_RST_I ? qualint_or_RST_I : dinx[0]) : (maybranch ? takebranch : rinx[0])));   

   assign ucodepc_killwarnings = INSTR[31] | &INSTR[29:15] | &INSTR[11:7] | &B | INSTR[1];
   
endmodule
