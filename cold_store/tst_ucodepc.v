/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Just a wrapper to instantiate m_ucodepc both as high and low level.
 * For use with tst_ucodepc.cpp
 */

// Have tested OK with LAZY_DECODE == 1
module tst_ucodepc 
  # ( parameter LAZY_DECODE = 0 )   
   (
    input        corerunning, //         Control startup
    input [7:0]  rinx, //                From ucode
    input        sa28,sa29,sa30,sa37, // From ucode
    input        sa32,sa15, //           == 2'b10 triggers ucode jmp to alternate operand fetch from SRAM
    input        qualint, //             Qualified interrupt
    input        is_brcond, //           Branch condition
    input [31:0] INSTR, //               Instruction to decode at OpCode fetch
    input [31:0] B, //                   B[1:0] to find alignment errors. B[31] to distinguish EBR/SRAM
    input        RST_I, //               NMI
    input        buserror, //            Accessing empty region
    output [31:0] minxlowlevel, //        Microcode PC low level implementation
    output [31:0] minxhighlevel, //       Microcode PC high level implementation
    output       ucodepc_killwarnings
    );
   
   /*AUTOWIRE*/
   assign minxlowlevel[31:8] = 24'h0;
   assign minxhighlevel[31:8] = 24'h0;
   
   m_ucodepc # ( .HIGHLEVEL(0), 
                 .LAZY_DECODE(LAZY_DECODE))
   inst_l
     (// Outputs
      .minx                             (minxlowlevel[7:0]),
      /*AUTOINST*/
      // Outputs
      .ucodepc_killwarnings             (ucodepc_killwarnings),
      // Inputs
      .corerunning                      (corerunning),
      .rinx                             (rinx[7:0]),
      .sa28                             (sa28),
      .sa29                             (sa29),
      .sa30                             (sa30),
      .sa37                             (sa37),
      .sa32                             (sa32),
      .sa15                             (sa15),
      .qualint                          (qualint),
      .is_brcond                        (is_brcond),
      .INSTR                            (INSTR[31:0]),
      .B                                (B[31:0]),
      .RST_I                            (RST_I),
      .buserror                         (buserror));

   m_ucodepc # ( .HIGHLEVEL(1), 
                 .LAZY_DECODE(LAZY_DECODE))
   inst_h
     (// Outputs
      .minx                             (minxhighlevel[7:0]),
      /*AUTOINST*/
      // Outputs
      .ucodepc_killwarnings             (ucodepc_killwarnings),
      // Inputs
      .corerunning                      (corerunning),
      .rinx                             (rinx[7:0]),
      .sa28                             (sa28),
      .sa29                             (sa29),
      .sa30                             (sa30),
      .sa37                             (sa37),
      .sa32                             (sa32),
      .sa15                             (sa15),
      .qualint                          (qualint),
      .is_brcond                        (is_brcond),
      .INSTR                            (INSTR[31:0]),
      .B                                (B[31:0]),
      .RST_I                            (RST_I),
      .buserror                         (buserror));

endmodule
