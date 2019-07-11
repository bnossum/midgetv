/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40UP5K.
 * 
 * In general, the fillowing should suffice for image generation and uploading:
 *     python ../../../apio/apio clean
 *     python ../../../apio/apio build
 *     sudo python ../../../apio/apio upload
 *
 * Another useful command:
 * /usr/local/bin/arachne-pnr -r -d 5k -P sg48 -o hardware.asc -p up5k.pcf hardware.blif
 */



/*
 *  During synthesis I do not stomach to list all these files in the Makefile
 */
`include "../../code/m_inputmux.v"
`include "../../code/m_alu_carryin.v"
`include "../../code/m_alu.v"
`include "../../code/m_immexp_zfind_q.v"
`include "../../code/m_ram.v"
`include "../../code/m_ebr.v"
`include "../../code/m_rai.v"
`include "../../code/m_wai.v"
`include "../../code/m_opreg.v"
`include "../../code/m_cyclecnt.v"
`include "../../code/m_condcode.v"
`include "../../code/m_shiftcounter.v"
`include "../../code/m_status_and_interrupts.v"
`include "../../code/m_ucode.v" 
`include "../../code/m_3ebr.v"
`include "../../code/m_ucodepc.v"
`include "../../code/m_progressctrl.v"
`include "../../code/m_midgetv_core.v"
//`include "m_2ebr.v" reintroduce

module mytop
  # ( parameter
      SRAMADRWIDTH    = 16,
      SIMEBRADRWIDTH  = 8, 
      IWIDTH          = 32, 
      NO_CYCLECNT     = 0, 
      MTIMETAP        = 16, 
      HIGHLEVEL       = 0
      )
   (input      usartRX,
    output     led_red,
    output     led_green,
    output     led_blue, 
    output reg usartTX
    );
   wire        start = 1'b1;
   wire        ACK_I;
   reg         meta_usartRX;
   
   reg         redled,greenled,blueled;
   wire        CLK_I;   


   /* We want a 24 MHz (+/- 10%)  clock. It must be stable
    * before we apply it to midgetv. According to 
    * SBT_ICE_Technology_Library.pdf it must be held off for 100 us, 
    * this is 2400 cycles at 24 MHz. 
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
      ) /* synthesis ROUTE_THROUGH_FABRIC= 1 */;
   /* The horrible directive is needed to avoid using a clock-net
    */
   reg [3:0]   hfen;
   always @(posedge clklf) 
     hfen <= (hfen + 4'h1) | {hfen[3],3'h0};

   SB_HFOSC 
     # ( .CLKHF_DIV( "0b01" )        
         )
   inthosc(.CLKHFPU(1'b1),    // Power on
           .CLKHFEN(hfen[3]), // Enable output
           .CLKHF(CLK_I));

   /* In this test program we use the LEDs directly
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

   /* Asynchronous data input is first registered in the IO FF,
    * it then follows one path, with a fanout of 1, to the
    * rDee register in m_inputmux. These two consequtive
    * registers constitutes my guard for metastabiliti on the
    * inputs.
    *
    */
   always @(posedge CLK_I) 
     if ( CYC_O & STB_O & WE_O ) begin
        usartTX <= DAT_O[0];
        redled <= DAT_O[1];
        greenled <= DAT_O[2];
        blueled <= DAT_O[3];
     end
   
   reg rACK_I;
   always @(posedge CLK_I) begin
      rACK_I <= STB_O;
   end
   assign ACK_I = rACK_I;


   /* The program to include is usually specified in a Makefile. It is 
      irrelevant during simulation, because then the simulator write 
      the program to simulate.
    */
`ifndef defaulticeprog 
 `define defaulticeprog "ice40loaderprog.hv" 
`endif 
`include `defaulticeprog
   
   m_midgetv_core
     #(
      .SRAMADRWIDTH (   SRAMADRWIDTH),
      .EBRADRWIDTH  (SIMEBRADRWIDTH ),
      .IWIDTH       (   IWIDTH      ),
      .NO_CYCLECNT  (   NO_CYCLECNT ),
      .MTIMETAP     (   MTIMETAP    ),
      .HIGHLEVEL    (   HIGHLEVEL   ),
       .program0(program0),
       .program1(program1),
       .program2(program2),
       .program3(program3),
       .program4(program4),
       .program5(program5),
       .program6(program6),
       .program7(program7),
       .program8(program8),
       .program9(program9),
       .programA(programA),
       .programB(programB),
       .programC(programC),
       .programD(programD),
       .programE(programE),
       .programF(programF)
       )
   inst_midgetv_core
     (// Inputs
      .RST_I                            (1'b0),
      .meip                             (1'b0),
      .DAT_I                            ({31'h0,meta_usartRX}),
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
      
// Local Variables:
// verilog-library-directories:("." "../../code"  )
// verilog-library-extensions:(".v" )
// End:
