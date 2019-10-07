/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40HX1K on a iceblink40-hx1k board.
 * This implementation is to use as many resouces as possible.
 */

/*
 *  During synthesis I do not stomach to list all these files in the Makefile
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
`include "../../obj_dir/m_2ebr.v"
`include "../../code/m_ucodepc.v"
`include "../../code/m_progressctrl.v"
`include "../div/m_digilent.v"
`include "../div/m_fm_xmit.v"
`include "../../code/m_midgetv_core.v"


module top
  # ( parameter                // ucode  2 EBRs
      SRAMADRWIDTH       = 12, // Hence  8 EBRs 
      FORCEEBRADRWIDTH   = 9,  // Hence  4 EBRS
      IWIDTH             = 32, // Total 14 of 16 EBRs
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 16, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 0,
      DISREGARD_WB4_3_55 = 0
      )
   (
    input        padCLK_I, //    33 MHz system clock
    output [3:0] padled, //      Observables
//    inout [3:0]      btn, 
    output       padSS_B, //     To disable SPI Flash after configuration
    
    input        padnADDRSTB, // Address strobe, active low
    input        padnDATASTB, // Data strobe, active low
    input        padnWRITE, //   PC Write, active low
    inout [7:0]  padDB, //       8-bit bidirectional address/data.
    output       padnWAIT, //    Handshake signal, see below

    output       padantennae //  FM XMIT
    );
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          ADR_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 CYC_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          DAT_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [3:0]           SEL_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 STB_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 WE_O;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 antennae;               // From i_fm_xmit of m_fm_xmit.v
   wire                 corerunning;            // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 digilent_ACK_O;         // From inst_digilent of m_digilent.v
   wire [0:0]           fm_xmit_DAT_O;          // From i_fm_xmit of m_fm_xmit.v
   wire                 fm_xmt_ACK_O;           // From i_fm_xmit of m_fm_xmit.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
   
   
   
   /* -----------------------------------------------------------------------------
    * Wishbone interconnect.
    */
   wire          led_ACK_O;
   wire          led_STB_I      = STB_O & ADR_O[2];
   wire          digilent_STB_I = STB_O & ADR_O[3];
   wire          fm_xmit_STB_I  = STB_O & ADR_O[4];
   wire          ACK_I = led_ACK_O | digilent_ACK_O | fm_xmt_ACK_O;
   
   wire          CLK_I;
   //assign SS_B = 1'b1; // Disable SPI Flash after configuration
   SB_IO #(.PIN_TYPE( 6'b 0110_01)) theSS_B(.PACKAGE_PIN(padSS_B), .D_OUT_0(1'b1));
   SB_GB_IO #(.PIN_TYPE( 6'b0000_01)) theCLK_I(.PACKAGE_PIN(padCLK_I),.GLOBAL_BUFFER_OUTPUT(CLK_I));
   
   /* -----------------------------------------------------------------------------
    * Interface to LEDs, so small that we do the code here.
    */
   reg [3:0] rled;
   always @(posedge CLK_I)  begin
      if ( led_STB_I & WE_O  ) begin
         rled[3:0]  <= DAT_O[3:0];
      end
   end
   //assign led = {antennae,rled};
   SB_IO #(.PIN_TYPE( 6'b 0110_01)) theled [3:0] (.PACKAGE_PIN(padled), .D_OUT_0(rled));
   assign led_ACK_O = led_STB_I;
   
   /* -----------------------------------------------------------------------------
    * Interface to PC
    */
   wire [7:0] digilent_DAT_O;
   m_digilent 
     inst_digilent
       (// Outputs
        .ACK_O(       digilent_ACK_O ),
        .DAT_O(       digilent_DAT_O ),
        // Inputs
        .STB_I(       digilent_STB_I ),
        .DAT_I(       DAT_O[7:0]     ),
        .ADR_I(       ADR_O[2:2]     ),
        .WE_I(        WE_O           ),
        /*AUTOINST*/
        // Outputs
        .padnWAIT                       (padnWAIT),
        // Inouts
        .padDB                          (padDB[7:0]),
        // Inputs
        .CLK_I                          (CLK_I),
        .padnADDRSTB                    (padnADDRSTB),
        .padnDATASTB                    (padnDATASTB),
        .padnWRITE                      (padnWRITE));
   
   /* -----------------------------------------------------------------------------
    * Interface to FM transmitter
    */
   m_fm_xmit i_fm_xmit
     (// Outputs
      .ACK_O                            (fm_xmt_ACK_O),
      .DAT_O                            (fm_xmit_DAT_O[0:0]),
      .antennae                         (antennae),
      // Inputs
      .DAT_I                            (DAT_O[14:0]),
      .STB_I                            (fm_xmit_STB_I),
      .WE_I                             (WE_O),
      /*AUTOINST*/
      // Inputs
      .CLK_I                            (CLK_I));
   SB_IO #(.PIN_TYPE( 6'b 0110_01)) theantennae (.PACKAGE_PIN(padantennae), .D_OUT_0(antennae));

   
   /* -----------------------------------------------------------------------------
    * Core
    */
`ifndef defaulticeprog 
 `define defaulticeprog "ice40loaderprog.hv" 
`endif 
`include `defaulticeprog
   
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
      .RST_I                            (1'b0),
      .meip                             (1'b0),
      .start                            (1'b1),
      .DAT_I                            ({23'h0,fm_xmit_DAT_O,digilent_DAT_O}),
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
      .ACK_I                            (ACK_I));
     
endmodule   
      
/* 
 * In general, this should be enough to load an image:
 *     python ../../../apio/apio clean
 *     python ../../../apio/apio build
 *     sudo python3 ../../../iceBurn/iCEburn.py -v -ew hardware.bin 
 * 
 * Other useful commands:
 * arachne-pnr -d 1k -P vq100 -p iceblink40-hx1k.pcf -o hardware.asc hardware.blif
 * icetime -d hx1k hardware.asc 
 */
// Local Variables:
// verilog-library-directories:("." "../../code" "../div" "../../obj_dir"  )
// verilog-library-extensions:(".v" )
// End:
