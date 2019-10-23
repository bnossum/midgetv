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
 * BUG. I must change polarity of sa00mod. It is 0 the very first cycle.
 * 
 * When corerunning == 0, OpC == 0, but it is not so easy to see why.
 * During the very first cycle, sa12 is unknown, it comes from EBR.
 * If sa12 is high, we get INSTR <= Di.
 * 
 * Di comes from the input mux,          
 *   assign Di = sa00mod ? (DAT_O & rDee[31:0] | ~DAT_O & shADR_O) : DAT_O;
 * the select signal sa00mod is 1 when corerunning == 0, so we have
 * Di = DAT_O & rDee[31:0] | ~DAT_O & shADR_O) 
 * 
 * The very first cycle DAT_O is unknowm, it comes from EBR. However,
 * rDee == 0 and shADR_0 == 0, so Di is indeed 0.
 */
module m_opreg
  # ( parameter HIGHLEVEL = 0 )
  ( 
    input         clk,
    input         sa12,
    input [31:0]  Di,
    output [31:0] INSTR,
    output [4:0]  TRG,SRC1,SRC2,
    output [2:0]  FUNC3,
    output        FUNC7_5
    );
   
   generate
      if ( HIGHLEVEL ) begin
         reg [31:0]     rINSTRUCTION;
         always @(posedge clk) 
           if ( sa12 ) 
             rINSTRUCTION <= Di;
         assign INSTR = rINSTRUCTION;
      end else begin
         SB_DFFE OpC [31:0] (.Q(INSTR),.E(sa12),.C(clk),.D(Di));
      end
   endgenerate
   
   assign TRG     = INSTR[11:7];
   assign FUNC3   = INSTR[14:12];
   assign SRC1    = INSTR[19:15];
   assign SRC2    = INSTR[24:20];
   assign FUNC7_5 = INSTR[30];
endmodule
