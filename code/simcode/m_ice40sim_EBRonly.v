/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This plays the role of a testbench together with verilator.
 */
module m_ice40sim_EBRonly
  # ( parameter
      SRAMADRWIDTH    = 0,  
      SIMEBRADRWIDTH  = 11, 
      IWIDTH          = 32, 
      NO_CYCLECNT     = 1, 
      MTIMETAP        = 14, 
      HIGHLEVEL       = 0,
      LAZY_DECODE     = 0
      )
   (
    input CLK_I, // Toggled from verilator
    input RST_I, // NMI
    input meip //   External interrupt pending
    );
   wire   start = 1'b1; // Startup happens after 64 clock cycles. 
   
   /* verilator lint_off UNUSED */
   wire [31:0]          ADR_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire   midgetv_core_killwarnings;// From inst_midgetv_core of m_midgetv_core.v
   wire                 CYC_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [31:0]          dbga;                   // From inst_midgetv_core of m_midgetv_core.v
   wire                 corerunning;            // From inst_midgetv_core of m_midgetv_core.v
   /* verilator lint_on UNUSED */
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 ACK_I;                  // From inst_whishbonereg of m_whishbonereg.v
   wire [31:0]          DAT_I;                  // From inst_whishbonereg of m_whishbonereg.v
   wire [31:0]          DAT_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [3:0]           SEL_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 STB_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 WE_O;                   // From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
   
   /* The program to include is usually specified in a Makefile. It is 
    * irrelevant during simulation, because then the simulator write 
    * the program to simulate into EBR. 
    */
`ifndef defaulticeprog 
 `define defaulticeprog "ice40loaderprog.hv" 
`endif 
`include `defaulticeprog
   
   m_midgetv_core
     #(
       .SRAMADRWIDTH (   SRAMADRWIDTH   ),
       .EBRADRWIDTH  (   SIMEBRADRWIDTH ),
       .IWIDTH       (   IWIDTH         ),
       .NO_CYCLECNT  (   NO_CYCLECNT    ),
       .MTIMETAP     (   MTIMETAP       ),
       .HIGHLEVEL    (   HIGHLEVEL      ),
       .LAZY_DECODE  (   LAZY_DECODE    ),
       .program0(program0),       .program1(program1),       .program2(program2),       .program3(program3),
       .program4(program4),       .program5(program5),       .program6(program6),       .program7(program7),
       .program8(program8),       .program9(program9),       .programA(programA),       .programB(programB),
       .programC(programC),       .programD(programD),       .programE(programE),       .programF(programF)
       )
   inst_midgetv_core
     (/*AUTOINST*/
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

   // Address decode of whishbone register: 0b0100xxxx_xxxxxxxx_xxxxxxxx_xxxxx1xx
   wire                 STB_I = STB_O & ~ADR_O[29] & ~ADR_O[28] & ADR_O[2];
   m_whishbonereg inst_whishbonereg
     (// Outputs
      .ACK_O                            (ACK_I),
      .DAT_O                            (DAT_I[31:0]),
      // Inputs
      .WE_I                             (WE_O),
      .SEL_I                            (SEL_O[3:0]),
      .DAT_I                            (DAT_O[31:0]),
      /*AUTOINST*/
      // Inputs
      .CLK_I                            (CLK_I),
      .STB_I                            (STB_I));
endmodule   
      
// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-extensions:(".v" )
// End:
