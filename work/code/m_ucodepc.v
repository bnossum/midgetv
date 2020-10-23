/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Instruction decode is preformed in this module. 
 * Experiments with a lowlevel version did not give any gain in size.
 * However:
 *  - There is a lut or two to pinch by better analysis of startup
 *    conditions.
 *  - If we do not use a lazy decoding, the test of rd == 0  and
 *    rs1 == 0 can be multiplexed with the zero-detector just before
 *    the holding register ADR_O[31:0]. This will save a few luts.
 * 
 * All in all there is little to gain by manipulating this module,
 * that also will need to be flexible if we are to implement 
 * standard extension -M and/or -C.
 * 
 * 
 * Microcode program counter
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                                ____      |
 * dinx[7:2] --------------------| or |     |
 * illegal_or_qualint_or_RST_I --|____|----|1\
 *                                         |  |--- minx[7:2]
 * rinx[7:2] ------------------------------|0/
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                       ____               |
 * dinx[1] -------------| or |   ___        |
 * illegal_or_qualint_--|____|--| & |------|1\
 * RST_I-----------------------o|___|      |  |--- minx[1]
 * rinx[1] --------------------------------|0/
 * 
 * usedinx_or_RST_I_notcorerunning ---------+
 *                                          |
 * illegal_or_qualint_or_RST_I --+          |
 * qualint_or_RST_I ------------|1\         |
 *                              |  |-------|1\
 * dinx[0] ---------------------|0/        |  |--- minx[0]
 *                                       +-|0/
 * maybranch -----------+                |
 * takebranch ---------|1\   ____        |
 *                     |  |-|    |-------+
 * rinx[0] ------------|0/  | or |
 * buserror-----------------|____|
 * 
 * When power-on, dinx is used, so a "lb x0,0(x0)" is executed.
 * 
 * Parameter:
 * LAZY_DECODE    0 : Full decode of the riscv instruction. Any unknown instruction leads to a trap
 *                1 : Decode of most riscv instructions. No decode in some minor code spaces
 *                2 : Near minimal decode of riscv instructions. Not recommended
 */
module m_ucodepc
  # ( parameter LAZY_DECODE = 0, MULDIV = 1, RVC = 0 )
  (
   input        corerunning, //         Control startup
   input [7:0]  rinx, //                From ucode
   input        sa28,sa29,sa30,sa37, // From ucode
   input        sa32,sa15, //           == 2'b10 triggers ucode jmp to alternate operand fetch from SRAM
   input        qualint, //             Qualified interrupt
   input        is_brcond, //           Branch condition
   input [31:0] INSTR, //               Instruction to decode at OpCode fetch
   input [31:0] B, //                   B[1:0] to find alignment errors. B[31] to distinguish EBR/SRAM
   input [31:0] DAT_O, //               DAT_O[31] to find sign of variable
   input        RST_I, //               NMI
   input        buserror, //            Accessing empty region if high
   input        ceM, //                 Uses shift-loop or loads or clears bidirectional shift register
   input        rlastshift, //          Together with ceM, last shift in shift-loop
   input        potentialMODbranch, //  Distinguish between DIV[U] and MOD[U]. Together with ceM, branch on sign DAT_O[31]
/* verilator lint_off UNUSED */
   input        pc1, //           For RVC
   input        was_rvc_instr,
/* verilator lint_on UNUSED */
   output [7:0] minx, //                Microcode PC
   output       ucodepc_killwarnings
   );
   wire [7:0]   dinx;
   wire         usedinx, maybranch, takebranch;
   wire         Adr0Mustbe0;
   wire         Adr1Mustbe0;
   wire         use_brcond  = sa37;
   /* verilator lint_off UNUSED */
   wire         illegal;
   wire         RVC_or_aligned;
   /* verilator lint_on UNUSED */

   /*AUTOWIRE*/                
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 m_illegalop_killwarning;// From inst_illegalop of m_illegalop.v
   // End of automatics
`ifdef verilator
   function [1:0] get_branchvariables;
      // verilator public
      get_branchvariables = {is_brcond,use_brcond};
   endfunction
   function [0:0] get_usedinx;
      // verilator public
      get_usedinx = usedinx;
   endfunction
   function [5:0] get_ucodepcinfo;
      // verilator public
      get_ucodepcinfo = {buserror,usedinx,qualint,illegal,maybranch,takebranch};
   endfunction
   function [7:0] get_dinx;
      // verilator public
      get_dinx = dinx;
   endfunction
`endif

   generate
      if ( RVC == 0 ) begin
         assign usedinx     = sa28;
         assign Adr0Mustbe0 = sa29;
         assign Adr1Mustbe0 = sa30;
         assign RVC_or_aligned = 1'b0; // Prevent warning in Synplify Pro
      end else begin
         assign RVC_or_aligned = ~pc1 | was_rvc_instr; 
         assign usedinx     = sa28 & RVC_or_aligned;
         assign Adr0Mustbe0 = sa29 & RVC_or_aligned;
         assign Adr1Mustbe0 = sa30 & RVC_or_aligned;         
      end
   endgenerate

   assign maybranch = Adr0Mustbe0 | Adr1Mustbe0 | use_brcond | (sa32 & ~sa15) | ceM;

   /* Slight mangling of INSTRUCTION to an index. The following bits are used:
    * 30,14,13,12,6,5,4,3,2, or in case MUL/DIV is included:
    * 30,25,14,13,12,6,5,4,3,2
    */
   generate
      if ( MULDIV ) begin
         assign dinx[0] = (INSTR[6:4] == 3'b011 & INSTR[2] == 1'b0) ? INSTR[25] : INSTR[2];
      end else begin
         assign dinx[0] = INSTR[2];
      end
   endgenerate
   //wire is_lui = INSTR[6:2] == 5'b01101; Simplified because main_illegal covers 
   wire is_lui = INSTR[5:4] == 2'b11 & INSTR[2] == 1'b1;

   assign dinx[1] = is_lui ? 1'b1 : ((~INSTR[6]&INSTR[5])&INSTR[30]) | ((~(~INSTR[6]&INSTR[5]))&INSTR[3]);
   assign dinx[2] = INSTR[4];
   assign dinx[3] = INSTR[5];
   assign dinx[4] = INSTR[6];

   
   /* assign dinx[7:5] = INSTR[14:12]; Need some more space, so index sligthly more elaborate */
   assign dinx[5] = INSTR[12]; // is_lui ? 1 : INSTR[12];
   /* Candidates to compress:
    * INSTR[6:0]
    * 6543210
    *   xxx
    * 0110111 lui
    * 0010111 auipc
    * 1101111jal
    */
   assign dinx[7]   = INSTR[14] & (INSTR[4:2] != 3'b101) & (INSTR[5:2] != 4'b1011);
   assign dinx[6]   = INSTR[13] & (INSTR[4:2] != 3'b101);

   m_illegalop #(.LAZY_DECODE(LAZY_DECODE), .MULDIV(MULDIV))
   inst_illegalop
     (/*AUTOINST*/
      // Outputs
      .illegal                          (illegal),
      .m_illegalop_killwarning          (m_illegalop_killwarning),
      // Inputs
      .INSTR                            (INSTR[31:0]),
      .corerunning                      (corerunning));
   
   
   
   /* takebranch. Microcode must diverge when we have an alignment error,
    * a taken branch, or an opcode fetch when we read from SRAM, or the
    * last shift in a MUL/DIV shift loop.
    *                     _              ____
    * Adr0Mustbe0 -------|&|------------|    |--- takebranch
    * B[0] --------------|_|  +---------| or |
    *                     _   | +-------|    |
    * Adr1Mustbe0 -------|&|--+ | +-----|    |
    * B[1] --------------|_|    | | +---|____|
    *                     _     | | |
    * use_brcond --------|&|----+ | |
    * is_brcond ---------|_|      | |
    *                     _       | |
    * read_instr --------|&|------+ |
    * B[31] -------------|_|        |
    *                     _         |
    * ceM ---------------|&|--------+
    *               __  +|_|
    * rlastshift --|or|-+
    * isDIVbr  ----|__|
    * 
    * #define CH13 (( OI << 34) | sr_h) // ceM==0 clrM==1 conditional hlod, and branch on INSTR[15]. Last inch?
    */
   wire             qualint_or_RST_I = qualint | RST_I;
   wire             illegal_or_qualint = (illegal | qualint);
   wire             illegal_or_qualint_or_RST_I = (illegal | qualint | RST_I);
   assign takebranch = 
                       (Adr0Mustbe0 & B[0]) |
                       (Adr1Mustbe0 & B[1]) |                
                       (use_brcond & is_brcond) |
                       (sa32 & ~sa15 & B[31] ) |
                       (ceM & rlastshift );                       
   wire             usedinx_or_RST_I_notcorerunning = usedinx | RST_I | ~corerunning;

   assign minx[7:2] = (usedinx_or_RST_I_notcorerunning ? (dinx[7:2] | {6{illegal_or_qualint_or_RST_I}}) : rinx[7:2]);
   assign minx[1]   = (usedinx_or_RST_I_notcorerunning ? ( (dinx[1] | illegal_or_qualint) & ~RST_I) : rinx[1]);
   wire mostofminx0 = (buserror | (usedinx_or_RST_I_notcorerunning ? (illegal_or_qualint_or_RST_I ? qualint_or_RST_I : dinx[0]) : (maybranch ? takebranch : rinx[0])));   
   wire doMODbranch_or_signbranch = potentialMODbranch & ( (INSTR[13] & ~ceM) | (DAT_O[31] & ceM) );
   assign minx[0]   = mostofminx0 | doMODbranch_or_signbranch;

   assign ucodepc_killwarnings = INSTR[31] | &INSTR[29:15] | &INSTR[11:7] | &B | INSTR[1] | &DAT_O[31:0] | m_illegalop_killwarning;
   
endmodule
