/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K or ICE40HX1K. 
 * This file only to get an estimate of the size of the core.
 */

`include "../../midgetv.v"

/* Only define one of these:
 */
`define INVESTIGATE_SMALLEST 1
//`define INVESTIGATE_LARGEST 1
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
   localparam IWIDTH                   = 1;
   localparam SRAMADRWIDTH             = 0;
   localparam FORCEEBRAWIDTH           = 10;
   localparam NO_CYCLECNT              = 1;
   localparam MTIMETAP                 = 0;
   localparam DAT_I_ZERO_WHEN_INACTIVE = 1;  
   wire                RST_I = 1'b0;
   wire                start = 1'b1;
   wire                meip  = 1'b0;                
`endif

`ifdef INVESTIGATE_LARGEST
   localparam IWIDTH                   = 32;
   localparam SRAMADRWIDTH             = 17;
   localparam FORCEEBRAWIDTH           = 13;
   localparam NO_CYCLECNT              = 0;
   localparam MTIMETAP                 = 16;
   localparam DAT_I_ZERO_WHEN_INACTIVE = 0;  

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
   localparam FORCEEBRAWIDTH     = 13;
   localparam NO_CYCLECNT        = 0;
   localparam MTIMETAP           = 16;
`endif

   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
m_midgetv_core
     #(
       .SRAMADRWIDTH           ( SRAMADRWIDTH             ),
       .EBRAWIDTH              ( FORCEEBRAWIDTH           ),
       .IWIDTH                 ( IWIDTH                   ),
       .NO_CYCLECNT            ( NO_CYCLECNT              ),
       .MTIMETAP               ( MTIMETAP                 ),
       .HIGHLEVEL              ( HIGHLEVEL                ),
      .DAT_I_ZERO_WHEN_INACTIVE( DAT_I_ZERO_WHEN_INACTIVE ),
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


      
// Local Variables:
// verilog-library-directories:("." "../../code" "../div"  )
// verilog-library-extensions:(".v" )
// End:
