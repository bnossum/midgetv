/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Bit to write to register due to SLI/SLTI/SLTU/SLTIU instruction
 * Condition code for BEQ/BNE/BLT/BGE/BLTU/BGEU. Logical requirements:
 * FUNC3 Opcodes       cmb_aluF (register in raluF)       is_brcond
 * 000   BEQ           x                                  Di == ~QQ ? 1 : 0
 * 001   BNE           x                                  Di != ~QQ ? 1 : 0
 * 010    SLT   SLTI   (int32_t)Di < (int32_t)~QQ ? 1 : 0 x
 * 011    SLTU  SLTUI  Di < ~QQ ? 1 : 0                   x
 * 100   BLT           x                                  (int32_t)Di <  (int32_t)~QQ ? 1 : 0
 * 101   BGE           x                                  (int32_t)Di >= (int32_t)~QQ ? 1 : 0
 * 110   BLTU          x                                  Di < ~QQ  ? 1 : 0
 * 111   BGEU          x                                  Di >= ~QQ ? 1 : 0
 * 
 * cmb_aluF is registered in raluF, and is_brcond is used the cycle after it
 * is computed, so the solution is:
 * FUNC3 Opcodes       cmb_aluF (register in raluF)       is_brcond
 * 000   BEQ           x                                  ~rzcy32
 * 001   BNE           x                                  rzcy32
 * 010    SLT   SLTI   (int32_t)Di < (int32_t)~QQ ? 1 : 0 x
 * 011    SLTU  SLTUI  Di < ~QQ ? 1 : 0                   x
 * 100   BLT           (int32_t)Di < (int32_t)~QQ ? 1 : 0 raluF
 * 101   BGE           (int32_t)Di < (int32_t)~QQ ? 1 : 0 ~raluF
 * 110   BLTU          Di < ~QQ ? 1 : 0                   raluF
 * 111   BGEU          Di < ~QQ ? 1 : 0                   ~raluF
 * 
 * When comparing unsigned Di < ~QQ, we do alu = Di + QQ + 1. If Di<~QQ we have no alu_carryout
 * When comparing signed Di < ~QQ, if Di[31] == QQ[31], the answer to Di < ~QQ is D[31]. If
 * Di[31] != QQ[31], the answer comes from  alu = Di + QQ + 1. The above can be recast:
 * 
 * FUNC3 Opcodes       cmb_aluF (register in raluF)                      is_brcond
 * 000   BEQ           x                                                 ~rzcy32
 * 001   BNE           x                                                 rzcy32
 * 010    SLT   SLTI   (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout  x
 * 011    SLTU  SLTUI  ~alu_carryout                                     x
 * 100   BLT           (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout  raluF
 * 101   BGE           (Di[31]&QQ[31]) | ((Di[31]^QQ[31])&~alu_carryout  ~raluF
 * 110   BLTU          ~alu_carryout                                     raluF
 * 111   BGEU          ~alu_carryout                                     ~raluF
 * 
 * For most comparisons the msb of Di[31:0] is used. But for all of these cases
 * we have A[31:0] == Di[31:0] (the ALU perform operation ADD for all these cases). 
 * A[31] is located in the middle of the ALU. We use A[31] instead of Di[31] 
 * because Di[31] is used chained, and it would cost a REP LUT to actually use 
 * Di[31]. 
 */
module m_condcode # ( parameter HIGHLEVEL = 0 )
   (
    input        clk, //          System clock
    input        alu_carryout, // Out of the ALU carry chain
    input [2:0]  FUNC3, //        from INSTRUCTION register
    input        A31,
    input [31:0] QQ, //           To get QQ[31]
    input        rzcy32, //       Registered zero-detect from m_immexp_zfind_q
    output       raluF, //        Registered aluF for use by SLT(I)/SLTU(I)
    output       is_brcond, //    Combinatorical for BEQ/BNE/BLT(U)/BGE(U)
    output       m_condcode_killwarnings
    );

   assign m_condcode_killwarnings = &QQ;
   generate      
      if ( HIGHLEVEL ) begin
         reg            cmb_aluF,tmp_raluF,tmp_is_brcond;
         
         always @(/*AS*/A31 or FUNC3 or QQ or alu_carryout)
           case (FUNC3)
             3'b010 : cmb_aluF = ((A31^QQ[31])&(~alu_carryout)) | (A31&QQ[31]);
             3'b011 : cmb_aluF = ~alu_carryout; 
             3'b100 : cmb_aluF = ((A31^QQ[31])&(~alu_carryout)) | (A31&QQ[31]);
             3'b101 : cmb_aluF = ((A31^QQ[31])&(~alu_carryout)) | (A31&QQ[31]);
             3'b110 : cmb_aluF = ~alu_carryout;
             3'b111 : cmb_aluF = ~alu_carryout;
//             default: cmb_aluF = 1'b?;  Strange, with this line, Verilator fails
             default: cmb_aluF = 1'b0;  
           endcase
         
         // Lowlevel code variant require is_brcond to be declared as
         // an output, so when syntesizing we need a temporary reg.
         always @(/*AS*/FUNC3 or raluF or rzcy32)
           case (FUNC3)
             3'b000 : tmp_is_brcond = ~rzcy32;
             3'b001 : tmp_is_brcond = rzcy32;
             3'b100 : tmp_is_brcond = raluF ;
             3'b101 : tmp_is_brcond = ~raluF;
             3'b110 : tmp_is_brcond = raluF ;
             3'b111 : tmp_is_brcond = ~raluF;
             // default :tmp_is_brcond = 1'b?; Strange, this makes Verilator fail.
             default :tmp_is_brcond = 1'b0;
           endcase   
         assign is_brcond = tmp_is_brcond;

         // As above: Lowlevel code variant require raluF be declared
         // as an output, so when we synthesize the register it must
         // have a different name
         always @(posedge clk) 
           tmp_raluF <= cmb_aluF;
         assign raluF = tmp_raluF;

      end else begin
         /*              ___    0 : use (~alu_carryout&(A31^QQ[31])) | (A31&QQ[31])
          *   FUNC3[0] -|I0 |-+ 1 : use ~alu_carryout
          *   FUNC3[1] -|I1 | |
          *   FUNC3[2] -|I2_| |   ___                   +----------------------- raluF
          *                   +--|I0 |               _  |           ___
          *   QQ[31] ------------|I1 |-- cmb_aluF --| |-+----------|I0 |-------- is_brcond
          *   A31--- ------------|I2 |              >_|  rzcy32 ---|I1 |
          *                 +----|I3_|                   FUNC3[0] -|I2 |
          *                 |                            FUNC3[2] -|I3_|
          *                 | alu_carryout
          *                 :
          *             (alu carry)
          *             (chain here)
          *                 :
          */
         wire pre_cmb_aluF;
         wire wcmb_aluF;
         SB_LUT4 #(.LUT_INIT(16'hc8c8)) pre_cmb_aluF_l(.O(pre_cmb_aluF),.I3(1'b0),  .I2(FUNC3[2]),.I1(FUNC3[1]),.I0(FUNC3[0]));
         SB_LUT4 #(.LUT_INIT(16'h40fe)) cmb_aluF_l(.O(wcmb_aluF),.I3(alu_carryout), .I2(A31), .I1(QQ[31]),.I0(pre_cmb_aluF));
         SB_DFF raluF_r(.Q(raluF),.C(clk),.D(wcmb_aluF));
         SB_LUT4 #(.LUT_INIT(16'h5ac3)) is_brcond_l(.O(is_brcond),.I3(FUNC3[2]),.I2(FUNC3[0]),.I1(rzcy32),.I0(raluF));
      end
   endgenerate
endmodule
