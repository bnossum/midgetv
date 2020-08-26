/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K or ICE40HX1K. 
 * This file only to get an estimate of the size of the core.
 */

`include "../../code/m_ice_shortcuts.v"
`include "../../code/m_inputmux.v"
`include "../../code/m_alu_carryin.v"
`include "../../code/m_alu.v"
`include "../../code/m_immexp_zfind_q.v"
`include "../../code/m_ram.v"
`include "../../code/m_ram_a16.v"
`include "../../code/m_ram_a17.v"
`include "../../code/m_ebr.v"
`include "../../code/m_ebr_w16.v"
`include "../../code/m_ebr_w8.v"
`include "../../code/m_ebr_w4.v"
`include "../../code/m_ebr_w2.v"
`include "../../code/m_rai.v"
`include "../../code/m_wai.v"
`include "../../code/m_opreg.v"
`include "../../code/m_cyclecnt.v"
`include "../../code/m_condcode.v"
`include "../../code/m_shiftcounter.v"
`include "../../code/m_status_and_interrupts.v"
`include "../../code/m_ucode.v" 
`include "../../code/m_3ebr.v"
`include "../../generated/m_2ebr.v"
`include "../../code/m_ucodepc.v"
`include "../../code/m_progressctrl.v"
`include "../../code/m_shlr.v"
`include "../../code/m_midgetv_core.v"

/* Only define one of these:
 */
//`define INVESTIGATE_SMALLEST 1
`define INVESTIGATE_LARGEST 1
//`define GET_NICE_SYMBOL 1

module mytop
  # ( parameter
      HIGHLEVEL = 0
      )
   (
    input         CLK_I,
    input         ACK_I,
    output [3:0]  SEL_O,
    output        CYC_O,
    output        STB_O,
    output        WE_O,
`ifdef INVESTIGATE_SMALLEST
    input [7:0]   DAT_I,
    output [31:0] ADR_O,
    output [31:0] DAT_O,
`endif
`ifdef INVESTIGATE_LARGEST
    output        fake_ADR_O,
    output        fake_DAT_O,
    input         fake_DAT_I,
    input         RST_I,
    input         start,
    input         meip,
`endif
`ifdef GET_NICE_SYMBOL    
    input [31:0]  DAT_I,
    output [31:0] ADR_O,
    output [31:0] DAT_O,
    input         RST_I,
    input         start,
    input         meip,
`endif    
    output        corerunning
    );

   
   // This firmware can not execute, but a program is needed for correct compilation
`include "ice40loaderprog.hv"

`ifdef INVESTIGATE_SMALLEST
   localparam IWIDTH             = 1;
   localparam SRAMADRWIDTH       = 0;
   localparam FORCEEBRADRWIDTH   = 8;
   localparam NO_CYCLECNT        = 1;
   localparam MTIMETAP           = 0;
   localparam LAZY_DECODE        = 2;
   localparam DISREGARD_WB4_3_55 = 1;
   wire                RST_I = 1'b0;
   wire                start = 1'b1;
   wire                meip  = 1'b0;                
`endif

`ifdef INVESTIGATE_LARGEST
   localparam IWIDTH             = 32;
   localparam SRAMADRWIDTH       = 17;
   localparam FORCEEBRADRWIDTH   = 11;
   localparam NO_CYCLECNT        = 0;
   localparam MTIMETAP           = 16;
   localparam LAZY_DECODE        = 0;
   localparam DISREGARD_WB4_3_55 = 0;

   /* To get this into a package I must reduce the number of IOs.
    * This leads to some SB_LUT4 that are to be subtracted from
    * the place/route result:
    * 
    * Shift logic/register for DAT_I     32
    * XOR-tree for ADR_O                 11
    * XOR-tree for DAT_O                 11
    * =======================================
    * Total to subtract:                 54
    * 
    * My result : 465 - 54 = 411
    * 
    * The registers in this fake code was needed for iCECube2
    * to swallow the cascade placements. This was due to optimalizations
    * by LSE that crashed the placer.
    */
   reg [31:0]          DAT_I;
   wire [31:0]         cmb_DAT_I;

   wire [31:0]         ADR_O;
   wire [7:0]          cmbaADR_O;
   wire [1:0]          cmbbADR_O;
   wire [31:0]         DAT_O;
   wire [7:0]          cmbaDAT_O;
   wire [1:0]          cmbbDAT_O;
   
   reg [7:0]           aADR_O;
   reg [1:0]           bADR_O;
   reg [7:0]           aDAT_O;
   reg [1:0]           bDAT_O;
   
   assign cmb_DAT_I = {DAT_I[30:0],fake_DAT_I} & {32{fake_ADR_O}};
   always @(posedge CLK_I)
     DAT_I <= cmb_DAT_I;

   assign cmbaADR_O = ADR_O[31:24] ^ ADR_O[23:16] ^ ADR_O[15:8] ^ ADR_O[7:0];   
   assign cmbbADR_O = aADR_O[7:6] ^ aADR_O[5:4] ^ aADR_O[3:2] ^ aADR_O[1:0];
   assign fake_ADR_O = &bADR_O;
   always @(posedge CLK_I) begin
      aADR_O <= cmbaADR_O;
      bADR_O <= cmbbADR_O;
   end

   assign cmbaDAT_O = DAT_O[31:24] ^ DAT_O[23:16] ^ DAT_O[15:8] ^ DAT_O[7:0];
   assign cmbbDAT_O = aDAT_O[7:6] ^ aDAT_O[5:4] ^ aDAT_O[3:2] ^ aDAT_O[1:0];
   assign fake_DAT_O = &bDAT_O;
   always @(posedge CLK_I) begin
      aDAT_O <= cmbaDAT_O;
      bDAT_O <= cmbbDAT_O;
   end  
   
`endif

`ifdef GET_NICE_SYMBOL
   localparam IWIDTH             = 32;
   localparam SRAMADRWIDTH       = 17;
   localparam FORCEEBRADRWIDTH   = 11;
   localparam NO_CYCLECNT        = 0;
   localparam MTIMETAP           = 16;
   localparam LAZY_DECODE        = 0;
   localparam DISREGARD_WB4_3_55 = 0;
`endif

   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
m_midgetv_core
     #(
       .SRAMADRWIDTH       ( SRAMADRWIDTH       ),
       .EBRADRWIDTH        ( FORCEEBRADRWIDTH   ),
       .IWIDTH             ( IWIDTH             ),
       .NO_CYCLECNT        ( NO_CYCLECNT        ),
       .MTIMETAP           ( MTIMETAP           ),
       .HIGHLEVEL          ( HIGHLEVEL          ),
       .LAZY_DECODE        ( LAZY_DECODE        ),
       .DISREGARD_WB4_3_55 ( DISREGARD_WB4_3_55 ),
       .prg00(prg00),       .prg01(prg01),       .prg02(prg02),       .prg03(prg03),
       .prg04(prg04),       .prg05(prg05),       .prg06(prg06),       .prg07(prg07),
       .prg08(prg08),       .prg09(prg09),       .prg0A(prg0A),       .prg0B(prg0B),
       .prg0C(prg0C),       .prg0D(prg0D),       .prg0E(prg0E),       .prg0F(prg0F)
       )
   inst_midgetv_core
     (// Inputs
      /*AUTOINST*/
      // Outputs
      .CYC_O                            (CYC_O),
      .STB_O                            (STB_O),
      .WE_O                             (WE_O),
      .ADR_O                            (ADR_O[31:0]),
      .DAT_O                            (DAT_O[31:0]),
      .SEL_O                            (SEL_O[3:0]),
      .corerunning                      (corerunning),
      .dbga                             (dbga[31:0]),
      .midgetv_core_killwarnings        (midgetv_core_killwarnings),
      // Inputs
      .CLK_I                            (CLK_I),
      .RST_I                            (RST_I),
      .ACK_I                            (ACK_I),
      .DAT_I                            (DAT_I[IWIDTH-1:0]),
      .meip                             (meip),
      .start                            (start));
endmodule


    // `ifdef FOR_SYMBOL
    //    input              RST_I,
    //    input              start,
    //    input              meip,
    // `endif
    //`else
    //    input              fakeDAT_I,
    //    output             fake,
    //`endif    
   //`ifndef FOR_SYMBOL
//`endif

   
//
//  # ( parameter
//`ifdef SMALLEST      
//      SRAMADRWIDTH       = 0, 
//      FORCEEBRADRWIDTH   = 8,
//`ifdef FOR_SYMBOL      
//      IWIDTH             = 32,
//`else
//      IWIDTH             = 8,
//`endif
//      NO_CYCLECNT        = 1, 
//      MTIMETAP           = 0, 
//      HIGHLEVEL          = 0, 
//      LAZY_DECODE        = 2, 
//      DISREGARD_WB4_3_55 = 1  
//`else
//      SRAMADRWIDTH       = 17,
//      FORCEEBRADRWIDTH   = 11,
//      IWIDTH             = 32, 
//      NO_CYCLECNT        = 0, 
//      MTIMETAP           = 16, 
//      HIGHLEVEL          = 0,
//      LAZY_DECODE        = 0,
//      DISREGARD_WB4_3_55 = 0
//`endif
//      )
//   
//`ifndef SMALLEST
//   /* To compile reduce pincount
//    * So here we add artificial logic on output to keep results,
//    * and also expands a 1-bit input to a DAT_I[31:0] input
//    * All this to give an estimate of the size of the core.
//    * From the number output from syntesis we must subtract:
//    * 32   Shift register
//    *  8   XOR on ADR_O
//    *  8   XOR on DAT_O
//    *  1   XOR on SEL_O
//    *  4   XORs on the XOR of ADR_O and DAT_O
//    *  1   XOR of line above
//    *  1   XOR of line above and (XOR on SEL_O)
//    * -----------
//    * 55 luts in total
//    * 
//    * With ICECube2, we seem to have the result 466-55 = 411.
//    * Obviously, midgetv does not live alone, but this is
//    * the size of m_midgetv_core in the design.
//    */
//   
//   reg [IWIDTH-1:0]    DAT_I;   
//   wire [31:0]         ADR_O;
//   wire [31:0]         DAT_O;
//   wire [3:0]          SEL_O;
//   wire [7:0]          xoradr;
//   wire [7:0]          xordat;
//   wire                xorsel;
//   wire [1:0]          l2xoradr;
//   wire [1:0]          l2xordat;
//   wire                keep64;
//
//   always @(posedge CLK_I)
//     DAT_I <= {DAT_I[IWIDTH-2:0],fakeDAT_I };
//   
//   assign xoradr = 
//   assign xordat = DAT_O[31:24] ^ DAT_O[23:16] ^ DAT_O[15:8] ^ DAT_O[7:0];
//   assign xorsel = ^SEL_O;
//
//
//   assign l2xoradr[0] = &xoradr[3:0];
//   assign l2xoradr[1] = &xoradr[7:4];
//   assign l2xordat[0] = &xordat[7:4];
//   assign l2xordat[1] = &xordat[7:4];
//   
//   assign keep64 = &l2xoradr | &l2xordat;
//   assign fake = keep64 ^ xorsel;
//`endif

      
// Local Variables:
// verilog-library-directories:("." "../../code" "../div"  )
// verilog-library-extensions:(".v" )
// End:
