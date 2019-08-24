/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40HX1K on a iceblink40-hx1k board.
 * At least for me, the clock of iceblink40-hx1k is not stable at startup
 * when set to run at 33 MHz. Hence I always use a 64 cycle startup timer,
 * parameter NO_CYCLECNT == 0.
 */

/*
 *  During synthesis I do not stomach to list all these files in the Makefile
 */
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
`include "../../code/m_midgetv_core.v"


module top
  # ( parameter
      SRAMADRWIDTH       = 0,
      FORCEEBRADRWIDTH   = 8, 
      IWIDTH             = 32, 
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 0, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 2,
      DISREGARD_WB4_3_55 = 0
      )
   (
    input            CLK_I,
    output reg [3:0] led,
//    inout [3:0]      btn, 
    output           SS_B,

    input            nADDRSTB, // Address strobe, active low
    input            nDATASTB, // Data strobe, active low
    input            nWRITE, //   PC Write, active low
    inout [7:0]      padDB, //    8-bit bidirectional address/data.
    output           nWAIT //    Handshake signal, see below
    );
   assign SS_B = 1'b1; // Disable SPI Flash after configuration
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          ADR_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 CYC_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          DAT_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [3:0]           SEL_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 STB_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 WE_O;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 corerunning;            // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 digilent_ACK_O;         // From inst_digilent of m_digilent.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
   
   
   
   /* -----------------------------------------------------------------------------
    * Wishbone interconnect.
    */
   wire                 led_ACK_O;
   wire led_STB_I      = STB_O & ADR_O[2];
   wire digilent_STB_I = STB_O & ADR_O[3];
   wire ACK_I = led_ACK_O | digilent_ACK_O;

   
   /* -----------------------------------------------------------------------------
    * Interface to LEDs, so small that we do the code here
    */
   always @(posedge CLK_I)  begin
      if ( led_STB_I & WE_O  ) begin
         led[2:0]  <= DAT_O[2:0];
      end
      led[3] <= corerunning;
   end
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
        .nWAIT                          (nWAIT),
        // Inouts
        .padDB                          (padDB[7:0]),
        // Inputs
        .CLK_I                          (CLK_I),
        .nADDRSTB                       (nADDRSTB),
        .nDATASTB                       (nDATASTB),
        .nWRITE                         (nWRITE));
   
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
      .DAT_I                            ({24'h0,digilent_DAT_O}),
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
