/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This plays the role of a testbench together with verilator.
 */
module m_ice40sim_EBRonly
  # ( parameter
      SRAMADRWIDTH       = 0,  
      SIMEBRADRWIDTH     = 11,  // MUST match corresponding macro in m_ice4sim_EBRonly.cpp
      IWIDTH             = 32, 
      NO_CYCLECNT        = 1, 
      MTIMETAP           = 14, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 0,
      DISREGARD_WB4_3_55 = 1
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
   wire                 ACK_I;                  // From inst_wishbonereg of m_wishbonereg.v
   wire [31:0]          DAT_I;                  // From inst_wishbonereg of m_wishbonereg.v
   wire [31:0]          DAT_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire [3:0]           SEL_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 STB_O;                  // From inst_midgetv_core of m_midgetv_core.v
   wire                 WE_O;                   // From inst_midgetv_core of m_midgetv_core.v
   // End of automatics
   
   /* The program to include is usually specified in a Makefile. It is 
    * irrelevant during simulation, because then the simulator write 
    * the program to simulate into EBR. 
    */
//localparam [4095:0] program0 = 4096'h0;
//localparam [4095:0] program1 = 4096'h0;
//localparam [4095:0] program2 = 4096'h0;
//localparam [4095:0] program3 = 4096'h0;
//localparam [4095:0] program4 = 4096'h0;
//localparam [4095:0] program5 = 4096'h0;
//localparam [4095:0] program6 = 4096'h0;
//localparam [4095:0] program7 = 4096'h0;
//localparam [4095:0] program8 = 4096'h0;
//localparam [4095:0] program9 = 4096'h0;
//localparam [4095:0] programA = 4096'h0;
//localparam [4095:0] programB = 4096'h0;
//localparam [4095:0] programC = 4096'h0;
//localparam [4095:0] programD = 4096'h0;
//localparam [4095:0] programE = 4096'h0;
//localparam [4095:0] programF = 4096'h0;
`ifndef defaulticeprog 
 `define defaulticeprog "../../hwtst/iceblink40-hx1k/ice40loaderprog.hv" 
`endif 
`include `defaulticeprog

   m_midgetv_core
     #(
       .SRAMADRWIDTH      ( SRAMADRWIDTH       ),
       .EBRADRWIDTH       ( SIMEBRADRWIDTH     ),
       .IWIDTH            ( IWIDTH             ),
       .NO_CYCLECNT       ( NO_CYCLECNT        ),
       .MTIMETAP          ( MTIMETAP           ),
       .HIGHLEVEL         ( HIGHLEVEL          ),
       .LAZY_DECODE       ( LAZY_DECODE        ),
       .DISREGARD_WB4_3_55( DISREGARD_WB4_3_55 ),
       .prg00(prg00),       .prg01(prg01),       .prg02(prg02),       .prg03(prg03),
       .prg04(prg04),       .prg05(prg05),       .prg06(prg06),       .prg07(prg07),
       .prg08(prg08),       .prg09(prg09),       .prg0A(prg0A),       .prg0B(prg0B),
       .prg0C(prg0C),       .prg0D(prg0D),       .prg0E(prg0E),       .prg0F(prg0F)
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

   // Address decode of wishbone register: 0b01100xxx_xxxxxxxx_xxxxxxxx_xxxxx1xx
   // Because we have STB_O I do not have to decode ADR_O[31:30]
   wire                 STB_I = STB_O & ADR_O[29] & ~ADR_O[28] & ~ADR_O[27] & ADR_O[2];
   m_wishbonereg inst_wishbonereg
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
// verilog-library-directories:("." ".."  )
// verilog-library-extensions:(".v" )
// End:
