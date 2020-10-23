/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 */

module m_condcode # ( parameter HIGHLEVEL = 0, MULDIV = 0 )
   (
    input        clk, //          System clock
    input        alu_carryout, // Out of the ALU carry chain
    input [31:0] INSTR, //        from INSTRUCTION register
    input        A31,
    input        QQ31, //
    /* Verilator lint_off UNUSED */
    input        use_dinx,
    input        cond_holdq, // fitte, is this needed
    input        ceM, //          Enable bidirectional shiftreg used to distinguish mult/div add/shift cycles
    input [2:0]  s_alu, // fitte,
//    input        Di31, // fitte
    input        sa14, // When rM is loaded, rF is cleared
    /* Verilator lint_on UNUSED */
    input        rzcy32, //       Registered zero-detect from m_immexp_zfind_q
    output       raluF, //        Registered aluF for use by SLT(I)/SLTU(I)
    output       is_brcond, //    Combinatorical for BEQ/BNE/BLT(U)/BGE(U)
    /* Verilator lint_off UNDRIVEN */
    output       cmb_rF2,
    /* Verilator lint_on UNDRIVEN */
    output       m_condcode_killwarnings
    );
   
   generate
      if ( MULDIV == 0 ) begin
         reg       cmb_aluF,tmp_raluF,tmp_is_brcond;
         
         always @(*)
           case (INSTR[14:12])
             3'b010 : cmb_aluF = ((A31^QQ31)&(~alu_carryout)) | (A31&QQ31);
             3'b011 : cmb_aluF = ~alu_carryout; 
             3'b100 : cmb_aluF = ((A31^QQ31)&(~alu_carryout)) | (A31&QQ31);
             3'b101 : cmb_aluF = ((A31^QQ31)&(~alu_carryout)) | (A31&QQ31);
             3'b110 : cmb_aluF = ~alu_carryout;
             3'b111 : cmb_aluF = ~alu_carryout;
             default: cmb_aluF = 1'b0;  
           endcase
         
         always @(posedge clk) 
           tmp_raluF <= cmb_aluF;
         assign raluF = tmp_raluF;
         
         always @(*)
           case (INSTR[14:12])
             3'b000 : tmp_is_brcond = ~rzcy32;
             3'b001 : tmp_is_brcond = rzcy32;
             3'b100 : tmp_is_brcond = raluF ;
             3'b101 : tmp_is_brcond = ~raluF;
             3'b110 : tmp_is_brcond = raluF ;
             3'b111 : tmp_is_brcond = ~raluF;
             default :tmp_is_brcond = 1'b0;
           endcase   
         assign is_brcond = tmp_is_brcond;
         assign m_condcode_killwarnings = &INSTR[31:15] | &INSTR[11:0];

         assign cmb_rF2 = 0;
         
      end else begin
         
/*
 *   When MULDIV == 0
 *                     0 : use (~alu_carryout&(A31^QQ[31])) | (A31&QQ[31])
 *              ___    1 : use ~alu_carryout                               
 *   FUNC3[0] -|I0 |-+ pre_cmb_aluF
 *   FUNC3[1] -|I1 | |
 *   FUNC3[2] -|I2 | |   ___                    +----------------------- raluF
 *            -|I3_| +--|I0 |                _  |           ___
 *   QQ31   ------------|I1 |--  cmb_aluF --| |-+----------|I0 |-------- is_brcond
 *   A31    ------------|I2 |               >_|  rzcy32 ---|I1 |
 *                 +----|I3_|                    FUNC3[0] -|I2 |
 *                 |                             FUNC3[2] -|I3_|
 *                 | alu_carryout
 *                 :
 *             (alu carry)
 *             (chain here)
 *                 :
 * 
 * 
 *   When MULDIV == 1
 *    
 *                       ___                    +----------------------- raluF
 *    feed[0] ----------|I0 |                _  |           ___
 *    feed[1] ----------|I1 |--  cmb_aluF --| |-+----------|I0 |-------- is_brcond
 *    feed[2] ----------|I2 |               >_|  rzcy32 ---|I1 |
 *                 +----|I3_|                             -|I2 |
 *                 |                                      -|I3_|
 *                /y\    ___
 *    addtype[1] -(((---|I0 |
 *             1 -+||   |I1 |--  cond_holdq = ~alu_carryout & addtype[1];
 *             0 --(+   |I2 |
 *                 +----|I3_|
 *                 | alu_carryout
 *                 :
 *             (alu carry)
 *             (chain here)
 *                 :
 * 
 * 
 * Recall:
 * ========
 * INSTR[25]
 * |INSTR[6:0]
 * x1100011    branches
 * x0010011    slti/sltui
 * 00110011    slt/sltu
 * 10110011    mul/div
 * 
 * 
 * To cover branches and slt[u][i] and MUL/MULH/MULHSU/MULHU, DIV/DIVU/REM/REMU
 * ============================================================================
 * 
 * use_dinx
 * | enm (in this column 'o' mean it will be low, but should be treated as dont' care)
 * | | INSTR[25]           
 * | | |INSTR[6:5]         
 * | | ||| FUNC3 Opcodes       cmb_aluF                                           
 * 0 x 101 000   MUL           x
 * 0 0 101 001   MULH          alu_carryout^rF^Di[31]                               During ADD. If the Add chg to PASSQ, alu_carryout == 0, Di[31] == 0: rF correct
 * 0 1 101 001   MULH          rF                                                   During SRA.
 * 0 o 001 010   SLT  SLTI     (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout)  
 * 0 o x00 011   SLTU SLTUI    ~alu_carryout                                      
 * 0 0 101 010   MULHSU        alu_carryout^rF^Di[31]                               During ADD. If the Add chg to PASSQ, alu_carryout == 0, Di[31] == 0: rF correct
 * 0 1 101 010   MULHSU        rF                                                   During SRA.
 * 0 0 101 011   MULHU         alu_carryout                                         During ADD. If the ADD chg to PASSQ, alu_carryout == 0: 0 correct
 * 0 1 101 011   MULHU         0                                                    During SLR
 * 0 0 101 1xx   DIV[U]/REM[U] alu_carryout^rF^1                                    During ADD
 * 0 1 101 1xx   DIV[U]/REM[U] QQ[31]                                               During SLL
 * 0 o x11 000   BEQ           x                                                  
 * 0 o x11 001   BNE           x                                                  
 * 0 o x11 100   BLT           (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout)  
 * 0 o x11 101   BGE           (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout)  
 * 0 o x11 110   BLTU          ~alu_carryout                                      
 * 0 o x11 111   BGEU          ~alu_carryout                                      
 * 1 x xxx xxx                 Cleared at start of each instruction
 * - - --- ---   All others are dontcare.
 * 
 * I want to make
 * feed[2:0]  cmb_aluF
 * 00a        a
 * 01a        alu_carryout^a
 * 1ba        b | (a&~alu_carryout)
 * 
 * use_dinx
 * | enm
 * | | INSTR[25]           
 * | | |INSTR[6:5]         
 * | | ||| FUNC3 Opcodes       cmb_aluF                                   cmb_aluF        
 * | 1 101 001   MULH          rF                                         a         
 * | 1 101 010   MULHSU        rF                                         a         
 * | 1 101 011   MULHU         0                                          a         
 * | 1 101 1xx   DIV[U]/REM[U] QQ31                                       a         
 * 1 x xxx xxx                 0                                          a
 * 
 * 0 x x00 011   SLTU SLTUI    ~alu_carryout                              alu_carryout^a
 * 0 x x11 110   BLTU          ~alu_carryout                              alu_carryout^a
 * 0 x x11 111   BGEU          ~alu_carryout                              alu_carryout^a
 * 0 0 101 011   MULHU         alu_carryout                               alu_carryout^a
 * 0 0 101 001   MULH          alu_carryout^rF^A31                        alu_carryout^a
 * 0 0 101 010   MULHSU        alu_carryout^rF^A31                        alu_carryout^a
 * 0 0 101 1xx   DIV[U]/REM[U] alu_carryout^rF^1                          alu_carryout^a
 * 
 * 0 x 001 010   SLT  SLTI     (A31&QQ31) | ((A31^QQ31)&~alu_carryout)  b | (a&~alu_carryout)
 * 0 x x11 100   BLT           (A31&QQ31) | ((A31^QQ31)&~alu_carryout)  b | (a&~alu_carryout)
 * 0 x x11 101   BGE           (A31&QQ31) | ((A31^QQ31)&~alu_carryout)  b | (a&~alu_carryout)
 * 
 */

         reg [2:0] feed;
         reg       tmp_rF;
         wire      rF;
         reg       cmb_aluF;
         reg       tmp_is_brcond;
         
         always @(*)                                  
           casez ({use_dinx,ceM,INSTR[25],INSTR[6:5],INSTR[14:12]})
             //  use_dinx
             //  | ceM
             //  | | INSTR[25]          feed[2]
             //  | | |INSTR[6:5]        |      feed[1]
             //  | | ||| FUNC3          |      |          feed[0]
             //  | | ||| |||            |      |          |               Opcpdes
             8'b 0_1_101_011 : feed = { 1'b0,  1'b0     , 1'b0     }; //  MULHU              Shift right logical
             8'b 0_1_101_001 : feed = { 1'b0,  1'b0     , rF       }; //  MULH               Shift right arithmetic  
             8'b 0_1_101_010 : feed = { 1'b0,  1'b0     , rF       }; //  MULHSU             Shift right arithmetic
             8'b 0_1_101_1?? : feed = { 1'b0,  1'b0     , QQ31     }; //  DIV[U]/REM[U]      Shift left
             8'b 1_?_???_??? : feed = { 1'b0,  1'b0     , 1'b0     }; //  clear at dinx
                                                 
             8'b 0_?_?00_011 : feed = { 1'b0,  1'b1     , 1'b1     }; //  SLTIU            
             8'b 0_?_001_011 : feed = { 1'b0,  1'b1     , 1'b1     }; //  SLTU             
             8'b 0_?_?11_11? : feed = { 1'b0,  1'b1     , 1'b1     }; //  BLTU/BGEU        

             8'b 0_0_101_011 : feed = { 1'b0,  1'b1     , 1'b0     }; //  MULHU              unsigned addition
             8'b 0_0_101_001 : feed = { 1'b0,  1'b1     , rF^A31   }; //  MULH               signed addition
             8'b 0_0_101_010 : feed = { 1'b0,  1'b1     , rF^A31   }; //  MULHSU             signed addition
             8'b 0_0_101_1?? : feed = { 1'b0,  1'b1     , rF^1'b1  }; //  DIV[U]/REM[U]      unsigned subtraction
                                             
             8'b 0_?_?00_010 : feed = { 1'b1,  A31&QQ31 , A31^QQ31}; //  SLTI           
             8'b 0_?_001_010 : feed = { 1'b1,  A31&QQ31 , A31^QQ31}; //  SLT  
             8'b 0_?_?11_100 : feed = { 1'b1,  A31&QQ31 , A31^QQ31}; //  BLT                 
             8'b 0_?_?11_101 : feed = { 1'b1,  A31&QQ31 , A31^QQ31}; //  BGE
             default :       feed = 3'b000; // Think I see a bug in Verilator. This fails if I say feed = 3'b???
           endcase
         reg       basic;
         always @(*)
           casez (feed)
             3'b000 : basic = 1'b0;
             3'b001 : basic = 1'b1;
             3'b010 : basic = alu_carryout;
             3'b011 : basic = ~alu_carryout;
             3'b100 : basic = 1'b0;
             3'b101 : basic = ~alu_carryout;
             3'b11? : basic = 1'b1;
           endcase                             
         
         always @(*)
           casez ({sa14,s_alu})
             4'b1000 : cmb_aluF = rF;    // A_nearXOR
             4'b00?? : cmb_aluF = 0;     // Q clear.
             4'b0100 : cmb_aluF = basic; // Q clear, used by SLTxx
             4'b0101 : cmb_aluF = 0;     // Q clear.
             4'b011? : cmb_aluF = 0;
             default : cmb_aluF = basic;
           endcase
         
         always @(posedge clk)
           if ( ~cond_holdq )
             tmp_rF <= cmb_aluF;
         assign rF = tmp_rF;
         assign cmb_rF2 = cmb_aluF;

         always @(*)
           casez ({INSTR[6],INSTR[14],INSTR[12]})
             3'b0?? : tmp_is_brcond = ~rzcy32;
             3'b100 : tmp_is_brcond = ~rzcy32;
             3'b101 : tmp_is_brcond = rzcy32;
             3'b110 : tmp_is_brcond = rF ;
             3'b111 : tmp_is_brcond = ~rF;
           endcase   
         assign is_brcond = tmp_is_brcond;
         assign raluF = rF;
         assign m_condcode_killwarnings = &INSTR[31:26] | &INSTR[24:7] | &INSTR[4:0];
      end
   endgenerate
endmodule
