/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K on an icebreaker board.
 * 
 */

/*
 *  I do not stomach to list all these files in a Makefile
 */

`include "../../code/m_ice_shortcuts.v"
`include "../../code/m_inputmux.v"
`include "../../code/m_mimux.v"
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
`include "../../code/m_RVC.v"
`include "../../code/m_midgetv_core.v"


module top
  # ( parameter
      SRAMADRWIDTH       = 16,
      FORCEEBRADRWIDTH   = 9, 
      IWIDTH             = 32, 
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 0,//16, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 0,
      DISREGARD_WB4_3_55 = 0
      )
   (
    input  CLK,
    input  RX,
    output TX,
    output LED1,
    output LED2,
    output LED3,
    output LED4 
    );
   
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
   wire                 killwarnings_m_LEDs;    // From i_LEDs of m_LEDs.v
   wire                 led_ACK_O;              // From i_LEDs of m_LEDs.v
   wire                 meta_usartRX;           // From i_BBUART of m_BBUART.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   wire                 uart_ACK_O;             // From i_BBUART of m_BBUART.v
   // End of automatics
   
   wire        start = 1'b1;       
   wire        CLK_I = CLK;
   
   
   /* IO adr map of icebreaker. Write
    *     3322 2222 2222 1111 1111 11
    *     1098 7654 3210 9876 5432 1098 7654 3210
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx xxx1  Free
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx xx1x  Free
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx x1xx  LED
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx 1xxx  UART
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxx1 xxxx  Free
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xx1x xxxx  Free
    * :::
    * 32'b0110_0xx1_xxxx_xxxx_xxxx xxxx xxxx xxxx  Free
    * 32'b0110_0x1x_xxxx_xxxx_xxxx xxxx xxxx xxxx  Free
    * 32'b0110_01xx_xxxx_xxxx_xxxx xxxx xxxx xxxx  Free
    * 
    * IO adr map of icebreaker. Read
    *     3322 2222 2222 1111 1111 11
    *     1098 7654 3210 9876 5432 1098 7654 3210
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx 1xxx  UART
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx 0xxx  Free
    */


   /* -----------------------------------------------------------------------------
    * Wishbone interconnect.
    */
   wire        led_STB_I     = STB_O & ADR_O[2];
   wire        uart_STB_I    = STB_O & ADR_O[3];
   wire        ACK_I = led_ACK_O | uart_ACK_O; 
   wire [31:0] DAT_I;
   assign DAT_I[31:9] = 0;
   assign DAT_I[8] = (uart_ACK_O & meta_usartRX);
   assign DAT_I[7:0] = 0;

   /* -----------------------------------------------------------------------------
    * Interface to bitbang UART 
    */
   m_BBUART i_BBUART
     (
      // Outputs
      .DAT_O                            (meta_usartRX),
      .ACK_O                            (uart_ACK_O),
      .usartTX                          (TX),
      // Inputs
      .usartRX                          (RX),
      .STB_I                            (uart_STB_I),
      .WE_I                             (WE_O),
      .DAT_I                            (DAT_O[0]),
      /*AUTOINST*/
      // Inputs
      .CLK_I                            (CLK_I));

   /* -----------------------------------------------------------------------------
    */
   m_LEDs i_LEDs
     (// Outputs
      .ACK_O                            (led_ACK_O),
      // Inputs
      .STB_I                            (led_STB_I),
      .WE_I                             (WE_O),
      .SEL_I                            (SEL_O[3:0]),
      .DAT_I                            (DAT_O[31:0]),
      /*AUTOINST*/
      // Outputs
      .LED1                             (LED1),
      .LED2                             (LED2),
      .LED3                             (LED3),
      .LED4                             (LED4),
      .killwarnings_m_LEDs              (killwarnings_m_LEDs),
      // Inputs
      .CLK_I                            (CLK_I),
      .meta_usartRX                     (meta_usartRX));

   
   /* The program to include will usually be specified in a Makefile. 
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
      .ACK_I                            (ACK_I),
      .DAT_I                            (DAT_I[IWIDTH-1:0]),
      .start                            (start));
     
endmodule   

      
/* -----------------------------------------------------------------------------
 * Bitbang UART
 */
module m_BBUART
  (
   input            CLK_I,
   input            STB_I,
   input            WE_I,
   input [0:0]      DAT_I,
   output reg [0:0] DAT_O,
   output           ACK_O,
   input            usartRX,
   output reg       usartTX
   );

   always @(posedge CLK_I) begin
      DAT_O[0] <= usartRX;
      if ( STB_I & WE_I) 
        usartTX  <= DAT_I[0];
   end
   assign ACK_O = STB_I;
endmodule


/* -----------------------------------------------------------------------------
 * LEDs
 * Primary debug output is 3 LEDs. It should come as no
 * surprise that it is contention on their use!
 * 
 */
module m_LEDs
  (
   input        CLK_I,
   input        STB_I,
   input        WE_I,
   input [3:0]  SEL_I,
   input [31:0] DAT_I,
   input        meta_usartRX,
   output       ACK_O,
   output reg   LED1,
   output reg   LED2,
   output reg   LED3,
   output reg   LED4,
   output       killwarnings_m_LEDs
   );
   
   reg bluesource_is_uart;
   always @(posedge CLK_I) 
     if ( STB_I & WE_I ) begin
        LED1 <= DAT_I[0];
        LED2 <= DAT_I[1];
        LED4 <= DAT_I[3];
        if ( SEL_I[3] ) 
          bluesource_is_uart  <= DAT_I[31];
     end
   
   always @(posedge CLK_I)
     if ( bluesource_is_uart )
       LED3 <= ~meta_usartRX;
     else if ( STB_I & WE_I ) 
       LED3 <= DAT_I[2];

   assign ACK_O = STB_I;
   assign killwarnings_m_LEDs = &DAT_I | &SEL_I;
endmodule
      
/* 
 * In general, this should be enough to load an image:
 *     python ../../../../apio/apio clean
 *     python ../../../../apio/apio build
 *     sudo iceprog hardware.bin
 * 
 * Other useful commands:
 * arachne-pnr -d 1k -P vq100 -p iceblink40-hx1k.pcf -o hardware.asc hardware.blif
 * icetime -d hx1k hardware.asc 
 */
// Local Variables:
// verilog-library-directories:("." "../../code" "../../obj_dir"  )
// verilog-library-extensions:(".v" )
// End:
