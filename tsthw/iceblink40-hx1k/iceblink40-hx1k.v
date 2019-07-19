/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Risc-v in a iCE40HX1K on a iceblink40-hx1k board.
 * At least for me, the clock of iceblink40-hx1k is not stable at startup
 * when set to run at 33 MHz. Hence I always use a 64 cycle startup timer,
 * parameter NO_CYCLECNT == 0.
 * 
 * In general, this should be enough to load an image:
 *     python ../../../apio/apio clean
 *     python ../../../apio/apio build
 *     sudo python3 ../../../iceBurn/iCEburn.py -v -ew hardware.bin 
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


module top
  # ( parameter
      SRAMADRWIDTH       = 0,
      SIMEBRADRWIDTH     = 8, 
      IWIDTH             = 32, 
      NO_CYCLECNT        = 1, 
      MTIMETAP           = 0, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 2,
      DISREGARD_WB4_3_55 = 1
      )
   (
    input      CLK_I,
    input      usartRX,
    output reg led1,
    output reg led2,
    output reg led3,
    output reg led4 
    );
   wire        ACK_I;
   reg         meta_usartRX;
   

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
    * registers constitutes my guard for metastability on the
    * inputs.
    *
    */
   always @(posedge CLK_I) begin
      if ( CYC_O & STB_O & WE_O ) begin
         led1 <= DAT_O[0];
         led2 <= DAT_O[1];
         led3 <= DAT_O[2];
      end      
      led4 <= corerunning;
   end
   
   assign ACK_I = STB_O;


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
       .SRAMADRWIDTH       ( SRAMADRWIDTH       ),
       .EBRADRWIDTH        ( SIMEBRADRWIDTH     ),
       .IWIDTH             ( IWIDTH             ),
       .NO_CYCLECNT        ( NO_CYCLECNT        ),
       .MTIMETAP           ( MTIMETAP           ),
       .HIGHLEVEL          ( HIGHLEVEL          ),
       .LAZY_DECODE        ( LAZY_DECODE        ),
       .DISREGARD_WB4_3_55 ( DISREGARD_WB4_3_55 ),
       .DBGA               ( 1'b0               ),
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
      .start                            (1'b1),
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
      .ACK_I                            (ACK_I));
     
endmodule   
      
// Local Variables:
// verilog-library-directories:("." "../../code"  )
// verilog-library-extensions:(".v" )
// End:
