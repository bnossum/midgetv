/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The operation register is simply 32 flip-flops with clock enable.
 * If we play our cards right, these registers are co-located with
 * the input mux LUTs. A requirement is then that chained LUTs are
 * used for the A-part of the ALU. This is surprisingly difficult
 * to arrange.
 * 
 * When corerunning == 0, OpC == 0, but it is not so easy to see why.
 * During the very first cycle, sa12 is unknown, it comes from EBR.
 * If sa12 is low, no problem, OpC will stay low.
 * If sa12 is high, we get INSTR <= Di.
 * 
 * Di comes from the input mux,          
 *   assign Di = sa00mod ? DAT_O : (DAT_O & rDee | ~DAT_O & shADR_O);
 * the select signal sa00mod is 0 the first cycle, and when 
 * corerunning == 0, so we have:
 *   Di = DAT_O & rDee | ~DAT_O & shADR_O) 
 * 
 * The very first cycle DAT_O is unknowm, it comes from EBR. However,
 * rDee == 0 and shADR_0 == 0, so Di is indeed 0.
 * 
 * The above is slightly different now that RVC is implemented.
 * Insead of sa12, we have is_valid_instrlow and is_valid_instrhigh.
 * If RVC is not included, these are infact sa12. If RVC is included,
 * these are a result of (sa12 & something), so at startup sa12 will
 * never "as low as ever", and the above argumentation holds.
 */
module m_opreg
  # ( parameter HIGHLEVEL = 0, RVC = 1)
  ( 
    input         clk,
//    input         sa12,
    /* verilator lint_off UNUSED */
    input         is_valid_instrlow,
    input         is_valid_instrhigh,
    /* verilator lint_on UNUSED */
    input [31:0]  Dii,
    output [31:0] INSTR,
    output [4:0]  TRG,SRC1,SRC2,
    output [2:0]  FUNC3,
    output [6:0]  FUNC7
    );
   
   generate
      if ( HIGHLEVEL ) begin

         reg [31:0]     rINSTRUCTION;
         always @(posedge clk) begin
            if ( is_valid_instrlow )
              rINSTRUCTION[15:0] <= Dii[15:0];
            if ( is_valid_instrhigh )
              rINSTRUCTION[31:16] <= Dii[31:16];               
         end
         assign INSTR = rINSTRUCTION;
         
      end else begin

         SB_DFFE OpC15_0  [15:0]  (.Q(INSTR[15:0]), .E(is_valid_instrlow), .C(clk),.D(Dii[15:0]));
         SB_DFFE OpC31_16 [31:16] (.Q(INSTR[31:16]),.E(is_valid_instrhigh),.C(clk),.D(Dii[31:16]));
         
      end
   endgenerate
   
   assign TRG     = INSTR[11:7];
   assign FUNC3   = INSTR[14:12];
   assign SRC1    = INSTR[19:15];
   assign SRC2    = INSTR[24:20];
   assign FUNC7   = INSTR[31:25];
endmodule
