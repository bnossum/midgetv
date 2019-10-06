/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K. Max size midgetv.
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
//`include "../div/m_fm_xmit.v" can't work
`include "../../code/m_midgetv_core.v"


module mytop
  # ( parameter
      SRAMADRWIDTH       = 17,
      FORCEEBRADRWIDTH   = 11,
      IWIDTH             = 32, 
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 16, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 0,
      DISREGARD_WB4_3_55 = 0
      )
   (
    input  usartRX,
    output SPI_SSn,
    output led_red,
    output led_green,
    output led_blue, 
    output usartTX
    //output padantennae
    );
   wire    start = 1'b1;
   wire    CLK_I;   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          ADR_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 CYC_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          DAT_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [3:0]           SEL_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 STB_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 WE_O;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 blueled;                // From i_LEDs of m_LEDs.v
   wire                 corerunning;            // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 greenled;               // From i_LEDs of m_LEDs.v
   wire                 killwarnings_m_LEDs;    // From i_LEDs of m_LEDs.v
   wire                 led_ACK_O;              // From i_LEDs of m_LEDs.v
   wire                 meta_usartRX;           // From i_BBUART of m_BBUART.v
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   wire                 redled;                 // From i_LEDs of m_LEDs.v
   wire                 uart_ACK_O;             // From i_BBUART of m_BBUART.v
   // End of automatics


   assign SPI_SSn = 1'b1;
   
   /* We want a 12 MHz (+/- 10%)  clock. It must be stable
    * before we apply it to midgetv. According to 
    * SBT_ICE_Technology_Library.pdf it must be held off for 100 us, 
    * this is 4800 cycles at 48 MHz. 
    * 
    * So, how do we play this? We use the LFOSC to count a few
    * cycles, at 10 kHz each count is 100 us. (Incidentally 
    * SBT_ICE_Technology_Library.pdf statesthat LFOSC is stable after
    * 100 us, that is, after 1 clock period?)
    */
   wire        clklf;
   SB_LFOSC OSCInst1 
     (.CLKLFPU(1'b1), // Power on
      .CLKLFEN(1'b1), // Enable always
      .CLKLF(clklf)
      ) 
     /* synthesis syn_noprune = 1 */
     /* xsynthesis ROUTE_THROUGH_FABRIC= 1 */;

 
   /* The second horrible directive is needed to avoid using a clock-net
    * The first is needed to avoid deletion by Synplify Pro
    */
   reg [3:0]   hfen;
   always @(posedge clklf) 
     hfen <= (hfen + 4'h1) | {hfen[3],3'h0};

   // Changed clock from 24 to 12 MHz due to timing after arachne-pnr, we
   // are down to 22 MHz. (iCEcube stays at around 28).
   //
   // CLKHF_DIV "0b00"  48 MHz
   //           "0b01"  24 MHz
   //           "0b10"  12 MHz  <-- Our choice
   //           "0b11"   6 MHz
   SB_HFOSC 
     # ( .CLKHF_DIV( "0b10" )        
         )
   inthosc(.CLKHFPU(1'b1),    // Power on
           .CLKHFEN(hfen[3]), // Enable output
           .CLKHF(CLK_I));

   /* In this test program we use the LEDs directly, no PWM
    * We drive the pins at 4 mA.
    */
   SB_RGBA_DRV
     # ( .CURRENT_MODE("0b1"     ),
         .RGB0_CURRENT("0b000001"),
         .RGB1_CURRENT("0b000001"),
         .RGB2_CURRENT("0b000001")
         )
     rgb 
     (
      .RGBLEDEN (1'b1),
      .RGB0PWM  (greenled),  // Green
      .RGB1PWM  (blueled),  //  Blue
      .RGB2PWM  (redled),  //   Red
      .CURREN   (1'b1),
      .RGB0     (led_blue),     
      .RGB1     (led_green),    
      .RGB2     (led_red)       
      );


   /* IO adr map of max_upduino2. Write
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
    * IO adr map of max_upduino2. Read
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
   //wire        fm_xmit_STB_I = STB_O & ADR_O[4];
   wire        ACK_I = led_ACK_O | uart_ACK_O; // | fm_xmit_ACK_O;
   wire [31:0] DAT_I;
   assign DAT_I[31:9] = 0;
   assign DAT_I[8] = (uart_ACK_O & meta_usartRX); // | (fm_xmit_ACK_O & fm_xmit_DAT_O);
   assign DAT_I[7:0] = 0;

   /* -----------------------------------------------------------------------------
    * Interface to bitbang UART 
    */
   m_BBUART i_BBUART
     (
      // Outputs
      .DAT_O                            (meta_usartRX),
      .ACK_O                            (uart_ACK_O),
      .usartTX                          (usartTX),
      // Inputs
      .STB_I                            (uart_STB_I),
      .WE_I                             (WE_O),
      .DAT_I                            (DAT_O[0]),
      /*AUTOINST*/
      // Inputs
      .CLK_I                            (CLK_I),
      .usartRX                          (usartRX));
      
   

   

   /* -----------------------------------------------------------------------------
    * Interface to FM transmitter
    */
//   m_fm_xmit i_fm_xmit
//     (// Outputs
//      .ACK_O                            (fm_xmit_ACK_O),
//      .DAT_O                            (fm_xmit_DAT_O),
//      .antennae                         (antennae),
//      // Inputs
//      .DAT_I                            (DAT_O[14:0]),
//      .STB_I                            (fm_xmit_STB_I),
//      .WE_I                             (WE_O),
//      /*AUTOINST*/);
//   SB_IO #(.PIN_TYPE( 6'b 0110_01)) theantennae (.PACKAGE_PIN(padantennae), .D_OUT_0(antennae));
   
   
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
      .redled                           (redled),
      .greenled                         (greenled),
      .blueled                          (blueled),
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
   output reg   redled,
   output reg   greenled,
   output reg   blueled,
   output       killwarnings_m_LEDs
   );
   
   reg bluesource_is_uart;
   always @(posedge CLK_I) 
     if ( STB_I & WE_I ) begin
        redled   <= DAT_I[0];
        greenled <= DAT_I[1];
        if ( SEL_I[3] ) 
          bluesource_is_uart  <= DAT_I[31];
     end
   
   always @(posedge CLK_I)
     if ( bluesource_is_uart )
       blueled <= ~meta_usartRX;
     else if ( STB_I & WE_I ) 
       blueled <= DAT_I[2];

   assign ACK_O = STB_I;
   assign killwarnings_m_LEDs = &DAT_I | &SEL_I;
endmodule
      
/* 
 * In general, the fillowing should suffice for image generation and uploading:
 *     python ../../../apio/apio clean
 *     python ../../../apio/apio build
 *     sudo python ../../../apio/apio upload
 *
 * Another useful command:
 * /usr/local/bin/arachne-pnr -r -d 5k -P sg48 -o hardware.asc -p up5k.pcf hardware.blif
 */
// Local Variables:
// verilog-library-directories:("." "../../code" "../div"  )
// verilog-library-extensions:(".v" )
// End:
