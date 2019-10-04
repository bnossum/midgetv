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
 *  I do not stomach to list all these files in a Makefile
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


module top
  # ( parameter
      SRAMADRWIDTH       = 0,
      FORCEEBRADRWIDTH   = 8, 
      IWIDTH             = 1, 
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 0, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 2,
      DISREGARD_WB4_3_55 = 1
      )
   (
    input      CLK_I,
    output reg led1,
    output reg led2,
    output reg led3,
    output reg led4 
    );
   wire        ACK_I;
   

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
   
   
   /* Asynchronous data input is first registered in the IO FF,
    * it then follows one path, with a fanout of 1, to the
    * rDee register in m_inputmux. These two consequtive
    * registers constitutes my guard for metastability on the
    * inputs.
    *
    */
   always @(posedge CLK_I)  begin
      if ( STB_O & WE_O & ADR_O[2] ) begin
         led1  <= DAT_O[0];
         led2  <= DAT_O[1];
         led3  <= DAT_O[2];
      end
      led4 <= corerunning;
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
      .DAT_I                            (1'b0),
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
// verilog-library-directories:("." "../../code" "../../obj_dir"  )
// verilog-library-extensions:(".v" )
// End:
