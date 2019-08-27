/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K. Max size midgetv.
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
   (input      usartRX,
    output     SPI_SSn,
    output     led_red,
    output     led_green,
    output     led_blue, 
    output reg usartTX
    );
   reg         meta_usartRX;
   reg         redled,greenled,blueled;
   wire        start = 1'b1;
   wire        ACK_I;
   wire        CLK_I;   


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
   wire                 midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
   
   
   always @(posedge CLK_I ) begin
      meta_usartRX <= usartRX;
   end

   /* IO adr map of max_upduino2. Write
    *     3322 2222 2222 1111 1111 11
    *     1098 7654 3210 9876 5432 1098 7654 3210
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx xxx1  Free
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx xx1x  Free
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx x1xx  LED
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx 1xxx  UART
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxx1 xxxx  Free
    * :::
    * 32'b0110_0xx1_xxxx_xxxx_xxxx xxxx xxxx xxxx  Free
    * 32'b0110_0x1x_xxxx_xxxx_xxxx xxxx xxxx xxxx  
    * 32'b0110_01xx_xxxx_xxxx_xxxx xxxx xxxx xxxx  
    * 
    * IO adr map of max_upduino2. Read
    *     3322 2222 2222 1111 1111 11
    *     1098 7654 3210 9876 5432 1098 7654 3210
    * 32'b0110_0xxx_xxxx_xxxx_xxxx xxxx xxxx xxxx  UART
    */
   /* Asynchronous data input is first registered in the IO FF,
    * it then follows one path, with a fanout of 1, to the
    * rDee register in m_inputmux. These two consequtive
    * registers constitutes my guard for metastability on the
    * inputs.
    *
    */
   always @(posedge CLK_I) 
     if ( STB_O & WE_O & ADR_O[2] ) begin
        redled   <= DAT_O[0];
        greenled <= DAT_O[1];
        blueled  <= DAT_O[2];
     end
   
   always @(posedge CLK_I) 
     if ( STB_O & WE_O & ADR_O[3] ) begin
        usartTX  <= DAT_O[0];
     end
   
   reg rACK_I;
   always @(posedge CLK_I) begin
      rACK_I <= STB_O;
   end
   assign ACK_I = rACK_I;


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
      .DAT_I                            ({24'h0,meta_usartRX,7'h0}),
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
      .start                            (start));
     
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
// verilog-library-directories:("." "../../code"  )
// verilog-library-extensions:(".v" )
// End:
