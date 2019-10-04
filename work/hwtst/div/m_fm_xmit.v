/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 */

/* FM modulation. Lots of noise. For ice40hx only. 
 *
 * The phase accumulator is a CLA variant. Each clock cycle the phase
 * accumulator holds a 13 bit number, but the exact representation 
 * depends on intermediate carry bits. The real msb *could* be found 
 * after pipelining, but the error is negligible compared with other 
 * errors in this code.
 * 
 * ( (309000000+75000)/309000000 - 1)*2^13 ~= 1.5, so we need 
 * a 13 bit accumulator to represent sidebands in a correct way.
 */
module m_fm_xmit
  (
   input        CLK_I, //        System clock
   input [14:0] DAT_I, //        Data from core, see below.
   input        STB_I, //        Module is accessed
   input        WE_I, //         Write cycle
   output       ACK_O, //        Acknowledge after write
   output [0:0] DAT_O, //        Can readback antennae (to examine timing)
   output       antennae //      FM output to antennae
   );
   reg [14:0]   sysreg;
   wire         antennaebuf;
   reg          meta_DAT_O;
   reg [0:0]    rDAT_O;
   wire         fclk;
   
   /* We may write to this module
    */
   always @(posedge CLK_I )
     if ( STB_I & WE_I )
       sysreg <= DAT_I;
   assign ACK_O = STB_I;
   
   /* SYSREG
    * 11111
    * 432109876543210
    * ||+++++++++++++ addend[12:0]  What to add in phase accumulator
    * |+------------- fclken        Enable fast clock
    * +-------------- en            Enable output
    */

   reg [12:0]   acc;
   reg [0:0]    cy;
   always @(posedge fclk) begin
      {cy[0],acc[ 6:0]} <= acc[ 6:0] + sysreg[ 6:0];
      acc[12:7]         <= acc[12:7] + sysreg[12:7] + cy[0];
   end

   // I tried to get this module to work for the iCE40UP parts. But:
   // Even with the following construction I could not get higher than 208 MHz with standard
   // placement. With highest effort: 228 MHz. It is perhaps possible
   // to reach 312 MHz with high placement, but I doubt it.
   //
   //    ** Hence I abandon.  **
   //   reg [12:0]   acc;
   //   reg [12:0]   cy;
   //   wire [12:0]  cmbacc,cmbcy;
   //   
   //   assign cmbcy[0] = 0;
   //   assign cmbcy[12:1]  = (acc[11:0]&cy[11:0]) | (sysreg[11:0]&cy[11:0]) | (acc[11:0]&sysreg[11:0]);
   //   assign cmbacc[11:0] = cy[11:0] ^ acc[11:0] ^ sysreg[11:0];
   //   assign cmbacc[12]   = cy[12]   ^ acc[12]   ^ sysreg[12];
   //   always @(posedge fclk) begin
   //      acc <= cmbacc;
   //      cy  <= cmbcy;
   //   end
   
   wire         antennaebufcmb;
   SB_LUT4 #(.LUT_INIT(16'h8888)) i_antennaebuf(.O(antennaebufcmb),.I3(1'b0),.I2(1'b0),.I1(acc[12]),.I0(sysreg[14]));
   SB_DFF r_antennaebuf( .Q(antennaebuf), .C(fclk), .D(antennaebufcmb));
   
   always @(posedge CLK_I ) begin
      meta_DAT_O <= antennaebuf;
      rDAT_O[0]  <= meta_DAT_O;
   end
   assign DAT_O[0] = rDAT_O[0];
   
   m_fclk i_fclk( .fclken(sysreg[13]), .fclk(fclk));
   
   assign antennae = antennaebuf;
endmodule

/*                     +--------------+
 *                     |         ___  |
 *                     +--|>o--|D Q|--+-- fclk
 * +--|>o--+-- vfclk ---------->C  |
 * |       |                   |___|
 * +-------+
 */
module m_fclk
  (
   input  fclken,
   output fclk
   );
   wire   vfclk,negfclk;
   SB_LUT4 #(.LUT_INIT(16'h0f00)) cmb_tap0(.O(vfclk),.I3(fclken),.I2(vfclk ),.I1(1'b0),.I0(1'b0));
   SB_LUT4 #(.LUT_INIT(16'h00ff)) cmb_negfclk(.O(negfclk),.I3(fclk),.I2(1'b0),.I1(1'b0),.I0(1'b0));
   SB_DFF div2( .Q(fclk), .C(vfclk), .D(negfclk));
endmodule
