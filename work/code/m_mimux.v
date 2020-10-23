/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------ehdr
 * This is the fundamental input multiplexer, which is the last part of the 
 * inputmux
 * 
 * sa00mod ---------+
 * DAT_O ----+-----|0\
 * rDee ----|0\    |  |-- Di
 *          |  |---|1/
 * shADR_O--|1/               
 * 
 */
module m_mimux
  # ( parameter HIGHLEVEL = 1 )
   (
    input         clk, //
    input         sra_msb, //     Msb to use when rightshifing ADR_O
    input         sa00, //        Main select signal, pipelined
    input         sram_ack, //    Used to select data from SRAM/input devices
    input         qACK, //        Qualified acknowledge, usually (ACK_I | sysregack)
    input         corerunning, // Needed at startup
    /* verilator lint_off UNUSED */
    input [31:0]  ADR_O, //       For right-shift
    /* verilator lint_on UNUSED */
    input [31:0]  DAT_O, //       Output from EBR is input to mux
    input [31:0]  rDee, //        External input, SRAM, Multipler register
    output [31:0] Di, //          Data out of mux
    output        m_mimux_killwarnings
    );
   assign m_mimux_killwarnings = ADR_O[0];
   
   generate
      wire [31:0] shADR_O = {sra_msb,ADR_O[31:1]};
      if ( HIGHLEVEL ) begin
         reg sa00mod;
         always @(posedge clk)
           sa00mod <=  ~(qACK | sram_ack | sa00 | ~corerunning);
         assign Di = sa00mod ? DAT_O : (DAT_O & rDee | ~DAT_O & shADR_O);
      end else begin
         wire cmb_sa00mod;
         wire sa00mod;
         SB_LUT4 #(.LUT_INIT(16'h0100)) inst_presa00mod( .O(cmb_sa00mod), .I3(corerunning), .I2(sram_ack), .I1(qACK), .I0(sa00)); 
         SB_DFF sa00mod_r( .Q(sa00mod), .C(clk), .D(cmb_sa00mod));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) cmb [31:0] (.O(Di),.I3(sa00mod),.I2(DAT_O),.I1(rDee),.I0(shADR_O));
      end
   endgenerate
endmodule
