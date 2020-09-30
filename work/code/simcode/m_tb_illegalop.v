module m_tb_illegalop
  (
   input [31:0] INSTR,
   input        corerunning,
   output       illegal_0_0,
   output       illegal_0_1,
   output       illegal_1_0,
   output       illegal_1_1,
   output       m_illegalop_killwarning
   );
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 m_illegalop_killwarning;// From inst_illegalop_0_0 of m_illegalop.v, ...
   // End of automatics
   
   m_illegalop #(.LAZY_DECODE(0), .MULDIV(0))
   inst_illegalop_0_0
     (// Outputs
      .illegal                          (illegal_0_0),
      /*AUTOINST*/
      // Outputs
      .m_illegalop_killwarning          (m_illegalop_killwarning),
      // Inputs
      .INSTR                            (INSTR[31:0]),
      .corerunning                      (corerunning));

   m_illegalop #(.LAZY_DECODE(0), .MULDIV(1))
   inst_illegalop_0_1
     (// Outputs
      .illegal                          (illegal_0_1),
      /*AUTOINST*/
      // Outputs
      .m_illegalop_killwarning          (m_illegalop_killwarning),
      // Inputs
      .INSTR                            (INSTR[31:0]),
      .corerunning                      (corerunning));

   m_illegalop #(.LAZY_DECODE(1), .MULDIV(0))
   inst_illegalop_1_0
     (// Outputs
      .illegal                          (illegal_1_0),
      /*AUTOINST*/
      // Outputs
      .m_illegalop_killwarning          (m_illegalop_killwarning),
      // Inputs
      .INSTR                            (INSTR[31:0]),
      .corerunning                      (corerunning));

   m_illegalop #(.LAZY_DECODE(1), .MULDIV(1))
   inst_illegalop_1_1
     (// Outputs
      .illegal                          (illegal_1_1),
      /*AUTOINST*/
      // Outputs
      .m_illegalop_killwarning          (m_illegalop_killwarning),
      // Inputs
      .INSTR                            (INSTR[31:0]),
      .corerunning                      (corerunning));

endmodule

// Local Variables:
// verilog-library-directories:("." ".."  )
// verilog-library-extensions:(".v" )
// End:
