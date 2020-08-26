/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2020-2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
 * This is a testbench of the input mux.
 * It is instantiated several times, with different parameters
 */

module m_tb_inputmux
  (
   input         clk, //         Toggled from verilator
   input         corerunning, // Not simulated
   input         STB_O, //       Selecte between SRAM and IO, must also lead to  ack when systemregisters written
   input         clrM, //        To determine if MULDIVREG is to be read
   input         ceM, //         To determine if MULDIVREG is to be read
   input [31:0]  DAT_I, //       External input
   input [31:0]  MULDIVREG, //   MUL/DIV result register
   input [31:0]  Dsram, //       SRAM input
   
   input [31:0]  ADR_O, //       For select between system registers
   input         mie, //         Machine Interrupt enable in MSTATUS
   input         mpie, //        Machine Previous Interrupt enable in MSTATUS
   input         meie, //        Machine External Interrupt Enable in MIE
   input         mrinstretie, // Machine Retired Instructions Retired Interrupt Enable in MIE. RENAME
   input         msie, //        Machine Software Interrupt Enable in MIE
   input         mtie, //        Machine Timer Interrupt Enable in MIE
   input         mtimeincie, //  Machine Time Increment Interrupt Enable in MIE
   input         mrinstretip, // Machine Retired Instructions Retired Interrupt Pending in MIP. RENAME
   input         msip, //        Machine Software Interrupt Pending in MIP
   input         mtip,//         Machine Timer Interrupt Pending in MIP
   input         mtimeincip, //  Machine Time Increment Interrupt Pending in MIP
   input         meip, //        Machine External Interrupt Pending in MIP
   
   output [31:0] ty0000_rDee, //  Presented to the rest of the core the following cycle
   output [31:0] ty0001_rDee, //  Presented to the rest of the core the following cycle
   output [31:0] ty0010_rDee, //  Presented to the rest of the core the following cycle
   output [31:0] ty0011_rDee, //  Presented to the rest of the core the following cycle
   output [31:0] ty1011_rDee, //  Presented to the rest of the core the following cycle
   output [31:0] ty0100_rDee //   Presented to the rest of the core the following cycle
   );

   /* verilator lint_off UNUSED */
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 sysregack;              // From inst_0000 of m_inputmux.v, ...
   wire [31:0]          theio;                  // From inst_0000 of m_inputmux.v, ...
   // End of automatics
   /* verilator lint_on UNUSED */ 
   
   m_inputmux #( .MTIMETAP(0), .SRAMADRWIDTH(0), .MULDIV(0) ) inst_0000
     (// Outputs
      .rDee                             (ty0000_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_inputmux #( .MTIMETAP(0), .SRAMADRWIDTH(0), .MULDIV(1) ) inst_0001
     (// Outputs
      .rDee                             (ty0001_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_inputmux #( .MTIMETAP(0), .SRAMADRWIDTH(16), .MULDIV(0) ) inst_0010
     (// Outputs
      .rDee                             (ty0010_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_inputmux #( .MTIMETAP(0), .SRAMADRWIDTH(16), .MULDIV(1), .DAT_I_ZERO_WHEN_INACTIVE(0) ) inst_0011
     (// Outputs
      .rDee                             (ty0011_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_inputmux #( .MTIMETAP(0), .SRAMADRWIDTH(16), .MULDIV(1), .DAT_I_ZERO_WHEN_INACTIVE(1)  ) inst_1011
     (// Outputs
      .rDee                             (ty1011_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_inputmux #( .MTIMETAP(32), .SRAMADRWIDTH(0), .MULDIV(0) ) inst_0100
     (// Outputs
      .rDee                             (ty0100_rDee[31:0]),
      // Inputs
      .DAT_I                            (DAT_I[31:0]),
      /*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .theio                            (theio[31:0]),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .STB_O                            (STB_O),
      .MULDIVREG                        (MULDIVREG[31:0]),
      .Dsram                            (Dsram[31:0]),
      .clrM                             (clrM),
      .ceM                              (ceM),
      .ADR_O                            (ADR_O[31:0]),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));


endmodule


      
// Local Variables:
// verilog-library-directories:("." ".."  )
// verilog-library-extensions:(".v" )
// End:
