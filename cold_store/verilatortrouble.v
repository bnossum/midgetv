/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
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
 * Parameters:
 * HIGHLEVEL      1 : Understandable code
 *                0 : Primitives used. Smaller
 * LAZY_DECODE    0 : Full decode of the riscv instruction. Any unknown instruction leads to a trap
 *                1 : Decode of most riscv instructions. No decode in some minor code spaces
 *                2 : My programs are perfect! I never present an illegal instruction to midgetv.
 */
module m_ucodepc
  # ( parameter HIGHLEVEL = 0, LAZY_DECODE = 0 )
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
   input        buserror, //            Accessing empty region
   output [7:0] minx, //                Microcode PC
   output       ucodepc_killwarnings
   );
   wire [7:0]   dinx;
   wire         maybranch;
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
      get_usedinx = 1'b0;
   endfunction
   function [5:0] get_ucodepcinfo;
      // verilator public
      get_ucodepcinfo = {buserror,1'b0,qualint,illegal,maybranch,1'b0};
   endfunction
   function [7:0] get_dinx;
      // verilator public
      get_dinx = dinx;
   endfunction
`endif

   generate
      if ( HIGHLEVEL ) begin 
         wire usedinx, takebranch;
         
         /* =============================================================================
          * HIGHLEVEL implementation
          * ============================================================================= */
         
         assign usedinx   = sa28 | !corerunning;
         assign maybranch = Adr0Mustbe0 | Adr1Mustbe0 | use_brcond | (sa32 & ~sa15);
                  
         // Slight mangling of INSTRUCTION to an index. 
         assign dinx[0]   = INSTR[2];
         assign dinx[1]   = ((~INSTR[6]&INSTR[5])&INSTR[30]) | ((~(~INSTR[6]&INSTR[5]))&INSTR[3]);
         assign dinx[4:2] = INSTR[6:4];

         /* assign dinx[7:5] = INSTR[14:12]; Need some more space, so index sligthly more elaborate */
         assign dinx[6:5] = INSTR[13:12];
         /* Candidates to compress:
          * INSTR[6:0]
          * 6543210
          *   xxx
          * 0110111 lui
          * 0010111 auipc
          * 1101111jal
          */
         assign dinx[7]   = INSTR[14] & (INSTR[4:2] != 3'b101);
         /* This frees 8 instances of lui and 4 instances of auipc for the cost of 1 LUT */


         if ( LAZY_DECODE == 0 ) begin

            // =======================================================
            // Full instruction decode. Costs around 16 luts more 
            // than LAZY_DECODE == 1.
            // =======================================================
            wire       illegal_funct7_or_illegal_rs1_rd;

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
// In full, but can be simplified:            
//            wire       checkfunct7 = 
//                       (opcode[6:2] == 5'b01100) ||
//                       (opcode[6:2] == 5'b00100 && funct3[1:0] == 2'b01 );
//            wire       funct7_5_dontcare =
//                       (opcode[6:2] == 5'b00100 && funct3 == 3'b101) ||
//                       (opcode[6:2] == 5'b01100 && (funct3 == 3'b101 || funct3 == 3'b000));
            wire       checkfunct7 = 
                       (opcode[5:2] == 4'b1100) ||
                       (opcode[5:2] == 4'b0100 && funct3[1:0] == 2'b01 );
            wire       funct7_5_dontcare =
                       (opcode[5:3] == 3'b010 && funct3 == 3'b101) ||
                       (opcode[5:3] == 3'b110 && (funct3 == 3'b101 || funct3 == 3'b000));
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
// In full, can be simplified
//            wire       check_rs1_rd = (opcode[6:2] == 5'b11100) && (funct3[1:0] == 2'b00);
            wire       check_rs1_rd = (opcode[5:4] == 2'b11) && (funct3[1:0] == 2'b00);
            wire       rs1_ne_zero = INSTR[19:15] != 5'h0;
            wire       rd_ne_zero  = INSTR[11:7] != 5'h0;
            wire       illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
            
            assign illegal_funct7_or_illegal_rs1_rd
              = (checkfunct7 & mostof_funct7_ne0) |
                (checkfunct7 & ~funct7_5_dontcare & funct7[5]) |
                illegal_rs1_rd;
            
            /* The Main illegal signal
             *
             * illegal_a = (16'b1100111011000010 >> INSTR[5:2]); opens up for prefix 0001011, custom-0
             * illegal_b = (16'b1110010011111111 >> INSTR[5:2]);
             * illegal = (~INSTR[6] & illegal_a) | (INSTR[6] & illegal_b ) | ~INSTR[1] | ~INSTR[0] |
             *           illegal_funct7_or_illegal_rs1_rd
             */

            reg        illegal_a, illegal_b;
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
            assign illegal = (~INSTR[6] & illegal_a) | 
                             (INSTR[6] & illegal_b ) | 
                             ~INSTR[1] |
                             ~INSTR[0] |
                             illegal_funct7_or_illegal_rs1_rd;
         
            
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
            wire       qualint_or_RST_I = qualint | RST_I;
            wire       illegal_or_qualint = (illegal | qualint) & corerunning;
            wire       illegal_or_qualint_or_RST_I = (illegal | qualint | RST_I) & corerunning;
            assign takebranch = 
                                (Adr0Mustbe0 & B[0]) |
                                (Adr1Mustbe0 & B[1]) |                
                                (use_brcond & is_brcond) |
                                (sa32 & ~sa15 & B[31] );
            wire       usedinx_or_RST_I = usedinx | RST_I;
            assign minx[7:2] = {6{corerunning}} & (usedinx_or_RST_I ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I}}) : rinx[7:2]);
            assign minx[1]   = corerunning & (usedinx_or_RST_I ? ( (dinx[1] | illegal_or_qualint) & ~RST_I)     : rinx[1]);
            assign minx[0]   = corerunning & (buserror | (usedinx_or_RST_I ? (illegal_or_qualint_or_RST_I ? qualint_or_RST_I : dinx[0]) : (maybranch ? takebranch : rinx[0])));
            
            assign ucodepc_killwarnings = INSTR[31] | &INSTR[29:15] | &INSTR[11:7] |  &B;
            
         end                 
         
      end else begin

         /* =============================================================================
          * LOWLEVEL implementation
          * ============================================================================= */
         
         /* verilator lint_off UNUSED */
         wire illegal_a, illegal_b;
         /* verilator lint_on UNUSED */

         
         // Slight mangling of INSTRUCTION to an index. 
         assign dinx[0]   = INSTR[2];
         SB_LUT4 #(.LUT_INIT(16'haea2)) cmb_dinx1( .O(dinx[1]), .I3(INSTR[30]), .I2(INSTR[6]), .I1(INSTR[5]), .I0(INSTR[3]));
         assign dinx[4:2] = INSTR[6:4];
         assign dinx[6:5] = INSTR[13:12];
         SB_LUT4 #(.LUT_INIT(16'hdf00)) cmb_dinx7( .O(dinx[7]), .I3(INSTR[14]), .I2(INSTR[4]), .I1(INSTR[3]), .I0(INSTR[2]));
           
                  
         if ( LAZY_DECODE == 0 ) begin
            

            // =======================================================
            // LOWLEVEL: Full decode
            // =======================================================
//            SB_LUT4 #(.LUT_INIT(16'h)) ( .O(), .I3(), .I2(), .I1(), .I0());
            wire       illegal_funct7;
            wire [6:0] funct7 = INSTR[31:25];
            wire [2:0] funct3 = INSTR[14:12];
            /* verilator lint_off UNUSED */
            wire [6:0] opcode = INSTR[6:0];
            /* verilator lint_on UNUSED */
            // wire       checkfunct7 = (opcode[5:2] == 4'b1100) || (opcode[5:2] == 4'b0100 && funct3[1:0] == 2'b01 );
            // checkfunct7h = (opcode[5:4] == 4'b11) | (opcode[5:4] == 4'b01 && funct3[1:0] == 2'b01);
            wire       checkfunct7h, checkfunct7;
            SB_LUT4 #(.LUT_INIT(16'hf020)) checkfunct7h_cmb( .O(checkfunct7h), .I3(opcode[5]), .I2(opcode[4]), .I1(funct3[1]), .I0(funct3[0]));
            // checkfunct7 = checkfunct7h & ~opcode[3] & ~opcode[2];
            SB_LUT4 #(.LUT_INIT(16'h1010)) checkfunct7_cmb( .O(checkfunct7), .I3(1'b0), .I2(checkfunct7h), .I1(opcode[3]), .I0(opcode[2]));

//          wire       funct7_5_dontcare = (opcode[5:3] == 3'b010 && funct3 == 3'b101) || (opcode[5:3] == 3'b110 && (funct3 == 3'b101 || funct3 == 3'b000));            
            wire       funct3_is_101_or_000,funct7_5_dontcare_a;
            // funct3_is_101_or_000 = (funct3 == 3'b101 || funct3 == 3'b000));
            SB_LUT4 #(.LUT_INIT(16'h2121)) funct3_is_101_or_000_cmb( .O(funct3_is_101_or_000), .I3(1'b0), .I2(funct3[2]), .I1(funct3[1]), .I0(funct3[0]));
            // funct7_5_dontcare_a = (opcode[5:3] == 3'b110) & funct3_is_101_or_000;
            SB_LUT4 #(.LUT_INIT(16'h4000)) funct7_5_dontcare_a_cmb( .O(funct7_5_dontcare_a), .I3(funct3_is_101_or_000), .I2(opcode[5]), .I1(opcode[4]), .I0(opcode[3]));
            wire       funct7_5_dontcare_b;
            // funct7_5_dontcare_b = (opcode[5:3] == 3'b010) & funct3_is_101_or_000;
            SB_LUT4 #(.LUT_INIT(16'h0400)) funct7_5_dontcare_b_cmb( .O(funct7_5_dontcare_b), .I3(funct3_is_101_or_000), .I2(opcode[5]), .I1(opcode[4]), .I0(opcode[3]));
            // funct7_5_dontcare = funct7_5_dontcare_a | ( funct7_5_dontcare_b & funct3[0]);
            wire       funct7_5_dontcare;
            SB_LUT4 #(.LUT_INIT(16'hf8f8)) funct7_5_dontcare_cmb( .O(funct7_5_dontcare), .I3(1'b0), .I2(funct7_5_dontcare_a), .I1(funct7_5_dontcare_b), .I0(funct3[0]));
            // wire mostof_funct7_ne0 = {funct7[6],funct7[4:0]} != 6'h0;
            wire       mostof_funct7_ne0,funct7h;
            SB_LUT4 #(.LUT_INIT(16'hfefe)) funct7h_cmb( .O(funct7h), .I3(1'b0), .I2(funct7[2]), .I1(funct7[1]), .I0(funct7[0]));
            SB_LUT4 #(.LUT_INIT(16'hfffe)) mostof_funct7_ne0_cmb( .O(mostof_funct7_ne0), .I3(funct7h), .I2(funct7[6]), .I1(funct7[4]), .I0(funct7[3]));
            
            //wire       check_rs1_rd = (opcode[5:4] == 2'b11) && (funct3[1:0] == 2'b00);
            wire       check_rs1_rd;
            SB_LUT4 #(.LUT_INIT(16'h1000)) check_rs1_rd_cmb( .O(check_rs1_rd), .I3(opcode[5]), .I2(opcode[4]), .I1(funct3[1]), .I0(funct3[0]));

            //wire       rs1_ne_zero = INSTR[19:15] != 5'h0;
            //wire       rd_ne_zero  = INSTR[11:7] != 5'h0;
            //wire       illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
            wire       rs1_ne_x0000, rd_ne_x0000, illegal_rs1_rd;
            wire       instr_11_or_instr_19;
            
            SB_LUT4 #(.LUT_INIT(16'hfffe)) rs1_ne_x0000_cmb( .O(rs1_ne_x0000), .I3(INSTR[18]), .I2(INSTR[17]), .I1(INSTR[16]), .I0(INSTR[15]));
            SB_LUT4 #(.LUT_INIT(16'hfffe)) rd_ne_x0000_cmb(  .O(rd_ne_x0000),  .I3(INSTR[10]), .I2(INSTR[9]),  .I1(INSTR[8]),  .I0(INSTR[7]));
            SB_LUT4 #(.LUT_INIT(16'heeee)) instr_11_or_instr_19_cmb( .O(instr_11_or_instr_19), .I3(1'b0), .I2(1'b0), .I1(INSTR[11]), .I0(INSTR[19]));
            SB_LUT4 #(.LUT_INIT(16'hfe00)) illegal_rs1_rd_cmb( .O(illegal_rs1_rd), .I3(check_rs1_rd), .I2(instr_11_or_instr_19), .I1(rs1_ne_x0000), .I0(rd_ne_x0000));
           
            
            //assign illegal_funct7 = (checkfunct7 & mostof_funct7_ne0) | (checkfunct7 & ~funct7_5_dontcare & funct7[5]);
            SB_LUT4 #(.LUT_INIT(16'hf200)) illegal_funct7_cmb( .O(illegal_funct7), .I3(checkfunct7), .I2(mostof_funct7_ne0), .I1(funct7_5_dontcare), .I0(funct7[5]));
            
            SB_LUT4 #(.LUT_INIT(16'hcec2)) illegal_a_cmb( .O(illegal_a), .I3(INSTR[5]), .I2(INSTR[4]), .I1(INSTR[3]), .I0(INSTR[2]));
            SB_LUT4 #(.LUT_INIT(16'he4ff)) illegal_b_cmb( .O(illegal_b), .I3(INSTR[5]), .I2(INSTR[4]), .I1(INSTR[3]), .I0(INSTR[2]));
            wire illegal_c;
            SB_LUT4 #(.LUT_INIT(16'hfff7)) illegal_c_cmb( .O(illegal_c), .I3(illegal_rs1_rd), .I2(illegal_funct7), .I1(INSTR[1]), .I0(INSTR[0]));
            SB_LUT4 #(.LUT_INIT(16'hffca)) illegal_cmb(.O(illegal), .I3(illegal_c), .I2(INSTR[6]), .I1(illegal_b), .I0(illegal_a));

            wire         illegal_or_qualint_or_RST_I_AND_corerunning;
            SB_LUT4 #(.LUT_INIT(16'hfe00)) cmb_bbb(.O(illegal_or_qualint_or_RST_I_AND_corerunning), .I3(corerunning), .I2(qualint), .I1(illegal), .I0(RST_I));
            wire         sa32_nsa15;
            wire         takebranch_a, takebranch_b;
            SB_LUT4 #(.LUT_INIT(16'h4444)) l_sa32_nsa15(.O(sa32_nsa15), .I3(1'b0), .I2(1'b0), .I1(sa32), .I0(sa15));
            SB_LUT4 #(.LUT_INIT(16'hf888)) takebranch_a_cmb( .O(takebranch_a), .I3(Adr0Mustbe0), .I2(B[0]), .I1(Adr1Mustbe0), .I0(B[1]));
            SB_LUT4 #(.LUT_INIT(16'hf888)) takebranch_b_cmb( .O(takebranch_b), .I3(use_brcond), .I2(is_brcond), .I1(sa32_nsa15), .I0(B[31]));

            wire         usedinx_or_RST_I;
            SB_LUT4 #(.LUT_INIT(16'hfdfd)) usedinx_or_RST_I_cmb( .O(usedinx_or_RST_I), .I3(1'b0), .I2(RST_I), .I1(sa28), .I0(corerunning));
            SB_LUT4 #(.LUT_INIT(16'hfffe)) maybranch_cmb( .O(maybranch), .I3(Adr0Mustbe0), .I2(Adr1Mustbe0), .I1(use_brcond), .I0(sa32_nsa15));
            wire         minx0a, minx0b;
            wire         dinx0_and_legal;
            SB_LUT4 #(.LUT_INIT(16'h0f00)) dinx0_and_legal_cmb( .O(dinx0_and_legal), .I3(dinx[0]), .I2(illegal), .I1(1'b0), .I0(1'b0));
            SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx0b_cmb( .O(minx0b), .I3(maybranch), .I2(takebranch_a), .I1(takebranch_b), .I0(rinx[0]));
            SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx0a_cmb( .O(minx0a), .I3(usedinx_or_RST_I), .I2(qualint), .I1(dinx0_and_legal), .I0(minx0b));
            SB_LUT4 #(.LUT_INIT(16'hfe00)) minx_cmb0( .O(minx[0]), .I3(corerunning), .I2(RST_I), .I1(buserror), .I0(minx0a));

            wire         minx1h;
            wire         dinx1_and_corerunning = dinx[1] & corerunning;
            SB_LUT4 #(.LUT_INIT(16'h0e00)) minx_cmb1h(.O(minx1h), .I3(usedinx_or_RST_I), .I2(RST_I), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(dinx1_and_corerunning));
            SB_LUT4 #(.LUT_INIT(16'hccca)) minx_cmb1(.O(minx[1]), .I3(usedinx_or_RST_I), .I2(RST_I), .I1(minx1h), .I0(rinx[1]));

            //assign minx[7:2] = usedinx_or_RST_I ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I_AND_corerunning}}) : rinx[7:2];

            always @(/*AS*/dinx
                     or illegal_or_qualint_or_RST_I_AND_corerunning
                     or rinx or usedinx_or_RST_I)
              minx[7:2] = usedinx_or_RST_I ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I_AND_corerunning}}) : {rinx[7:4],2'b00};

            

            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb2( .O(minx[2]), .I3(usedinx_or_RST_I), .I2(dinx[2]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[2]));
            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb3( .O(minx[3]), .I3(usedinx_or_RST_I), .I2(dinx[3]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[3]));
            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb4( .O(minx[4]), .I3(usedinx_or_RST_I), .I2(dinx[4]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[4]));
            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb5( .O(minx[5]), .I3(usedinx_or_RST_I), .I2(dinx[5]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[5]));
            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb6( .O(minx[6]), .I3(usedinx_or_RST_I), .I2(dinx[6]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[6]));
            //SB_LUT4 #(.LUT_INIT(16'hfcaa)) minx_cmb7( .O(minx[7]), .I3(usedinx_or_RST_I), .I2(dinx[7]), .I1(illegal_or_qualint_or_RST_I_AND_corerunning), .I0(rinx[7]));
                        
            assign ucodepc_killwarnings = INSTR[31] | &INSTR[29:15] | &INSTR[11:7] | &B | &INSTR | &rinx;

         end

         // Dummies in lowlevel, only for Verilator function in outer scope
         //assign usedinx   = sa28 | !corerunning;
         //assign takebranch = (Adr0Mustbe0 & B[0]) | (Adr1Mustbe0 & B[1]) | (use_brcond & is_brcond) | ((sa32 & ~sa15) & B[31] ); 
      end // if HIGLEVEL
         
   endgenerate
endmodule


