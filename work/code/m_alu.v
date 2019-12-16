/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The alu. Operations:
 * 
 * s_alu[2:0]
 * 000 : nearXOR  B = D^(~Q)   
 * 001 : PASSD    B = D
 * 010 : INVQ     B = ~Q       
 * 011 : nearAND  B = D&(~Q)   
 * 100 : ADD      B = D+Q+cin  
 * 101 : SHLQ     B = (Q<<1)|cin (with D=0xffffffff) 
 * 110 : PASSQ    B = Q+cin
 * 111 : nearIOR  B = (~D)|Q     (with cin==0)     
 * 
 * The ALU is constructed out of two columns of LUTs. 
 *      
 *                                | co               s_alu[1] 
 *                               /y\                 |s_alu[0]        s_alu[2]  
 *             ___               |||     ___         ||  A            |   B       
 * Q        --|I0 | A s_alu[2] --(((----|I0 | B      --  -            -   -       
 * s_alu[0] --|I1 |--------------+((----|I1 |--      00  Di           0   ~(A^QQ)  
 * Di       --|I2 |        QQ  ---(+----|I2 |        01  ~(Di^Q)      1   A^QQ^cin 
 * s_alu[1] --|I3_|               +-----|I3_|        10  0         
 *                                |                  11  (~Di)&(~Q)    
 *                                cin       
 *   
 *  luta=0x01b4 lutb=0xc369
 * 
 * 
 * MTIMETAP_LOWLIM
 * ---------------
 * A constant, but I propagate as a parameter because it is likely to be
 * changed once I know the maximum number of cycles needed to do *any*
 * CSR instruction.
 * 
 * MTIMETAP
 * --------
 * Parameter MTIMETAP determines the frequency of an increment of mtime. If CSR
 * is implemented the value should be between MTIMETAP_LOWLIM and 31 inclusive, 
 * because CSR instructions can take many cycles, and we don't want to skip any 
 * update of mtime.
 * 
 * HIGHLEVEL
 * ---------
 * To get the INSTRUCTION registers packed with the luts of the input mux, and 
 * using the combinatorical output of the input mux to the A-part of the alu, 
 * hand-placement is needed. Easiest done with the  low level implementation. 
 * The low level implementation is the tested one.
 * 
 * ALUWIDTH
 * --------
 * The ALU is always 32 bits in programs, but to ease standalone simulation 
 * it can be instantiated in a slimmer version. To avoid to have to make
 * a wrapper program for simulation the default value of ALUWIDTH is set to 8,
 * while as instantiated from m_midgetv_core ALUWIDTH is always 32.
 * 
 * 
 * A note on the size of the module. 
 * I compiled this module as in a scratch project to assess the size.
 *                          
 * HIGHLEVEL Lattice LSE :  97 SB_LUT4s
 * HIGHLEVEL Synplify Pro:  66 SB_LUT4s
 * LOWLEVEL:                65 SB_LUT4s       
 */

/* verilator lint_off DECLFILENAME */

module m_alu
  # ( parameter HIGHLEVEL = 0,
      ucodeopt_HAS_MINSTRET = 0,
      ucodeopt_HAS_EBR_MINSTRET = 0,
      MTIMETAP = 0,
`ifdef verilator      
      ALUWIDTH = 8,
`else
      ALUWIDTH = 32,
`endif
      MTIMETAP_LOWLIM = 32
      )
   (
    input [ALUWIDTH-1:0]  Di, //                  First operand to the ALU
    input [ALUWIDTH-1:0]  ADR_O, //               Normally second operand to ALU
    input [ALUWIDTH-1:0]  QQ, //                  Alternate second operand to ALU
    input                 alu_carryin, //         Carry in to ALU
    input [2:0]           s_alu,//                Determines ALU operation
    input                 sa27,sa26,sa25,sa24, // To decode Wttime and Wrinst
    output [ALUWIDTH-1:0] B, //                   ALU result
    output                A31, //                 A[31] == Di[31] during ADD, used in m_condcode.
    output                alu_carryout, //        ALU carry out
    output                alu_tapout, //          Used to trigger interrupt for mtime increment/mcycle update
    output                alu_minstretofl //      Used to trigger interrupt for retired instructions
    );

   if ( HIGHLEVEL ) begin
      m_alu_highlevel #
        (.ALUWIDTH(                  ALUWIDTH        ),
         .ucodeopt_HAS_MINSTRET(     ucodeopt_HAS_MINSTRET     ),
         .ucodeopt_HAS_EBR_MINSTRET( ucodeopt_HAS_EBR_MINSTRET ),
         .MTIMETAP(                  MTIMETAP        ),
         .MTIMETAP_LOWLIM(           MTIMETAP_LOWLIM )
         )
      inst
        (/*AUTOINST*/
         // Outputs
         .B                             (B[ALUWIDTH-1:0]),
         .A31                           (A31),
         .alu_carryout                  (alu_carryout),
         .alu_tapout                    (alu_tapout),
         .alu_minstretofl               (alu_minstretofl),
         // Inputs
         .Di                            (Di[ALUWIDTH-1:0]),
         .ADR_O                         (ADR_O[ALUWIDTH-1:0]),
         .QQ                            (QQ[ALUWIDTH-1:0]),
         .alu_carryin                   (alu_carryin),
         .s_alu                         (s_alu[2:0]),
         .sa27                          (sa27),
         .sa26                          (sa26),
         .sa25                          (sa25),
         .sa24                          (sa24));
   end else begin
      m_alu_lowlevel #
        (.ALUWIDTH(        ALUWIDTH        ),
         .ucodeopt_HAS_MINSTRET(     ucodeopt_HAS_MINSTRET     ),
         .ucodeopt_HAS_EBR_MINSTRET( ucodeopt_HAS_EBR_MINSTRET ),
         .MTIMETAP(        MTIMETAP        ),
         .MTIMETAP_LOWLIM( MTIMETAP_LOWLIM )
         )
      inst
        (/*AUTOINST*/
         // Outputs
         .B                             (B[ALUWIDTH-1:0]),
         .A31                           (A31),
         .alu_carryout                  (alu_carryout),
         .alu_tapout                    (alu_tapout),
         .alu_minstretofl               (alu_minstretofl),
         // Inputs
         .Di                            (Di[ALUWIDTH-1:0]),
         .ADR_O                         (ADR_O[ALUWIDTH-1:0]),
         .QQ                            (QQ[ALUWIDTH-1:0]),
         .alu_carryin                   (alu_carryin),
         .s_alu                         (s_alu[2:0]),
         .sa27                          (sa27),
         .sa26                          (sa26),
         .sa25                          (sa25),
         .sa24                          (sa24));
   end
endmodule



/* =============================================================================
 */
module m_alu_highlevel
  # ( parameter MTIMETAP = 0,
      ucodeopt_HAS_MINSTRET = 0,
      ucodeopt_HAS_EBR_MINSTRET = 0,
      ALUWIDTH = 8,
      MTIMETAP_LOWLIM = 32
      )
   (
    input [ALUWIDTH-1:0]  Di,
    input [ALUWIDTH-1:0]  ADR_O,
    input [ALUWIDTH-1:0]  QQ, 
    input                 alu_carryin,
    input [2:0]           s_alu,
/* verilator lint_off UNUSED */
    input                 sa27,sa26,sa25,sa24, 
/* verilator lint_on UNUSED */ 
    output [ALUWIDTH-1:0] B,
    output                A31,
    output                alu_carryout,
    output                alu_tapout,
    output                alu_minstretofl
    );   
   reg [ALUWIDTH-1:0]     A;
   
   /* Model of the first row of LUTs. Also set A31 used instead of Di[31] 
    * in m_condcode so a chained LUT can be used. See m_condcode.
    */
   always @(/*AS*/ADR_O or Di or s_alu) 
     case ({s_alu[1],s_alu[0]})
       2'b00 : A = Di;
       2'b01 : A = ~(Di^ADR_O);
       2'b10 : A = 0;
       2'b11 : A = (~Di)&(~ADR_O);
     endcase
   assign A31 = A[ALUWIDTH-1];
   
   /* Model second row of LUTs. The carry out is different in the highlevel
    * and the low-level code, but is equal when it counts - during ADD.
    */
   assign {alu_carryout,B} = s_alu[2] ? A+QQ+{{ALUWIDTH{1'b0}},alu_carryin} : {1'b0,~(A^QQ)};

   /* For mtimeinc interrupts, only defined when we tap out
    * a bit of mtime.
    */
   if ( MTIMETAP < MTIMETAP_LOWLIM || MTIMETAP >= ALUWIDTH ) begin
      assign alu_tapout = 1'b0;
   end else begin
      wire isWttime;
      assign isWttime = {sa27,sa26,sa25,sa24} == 4'b1011;      
      assign alu_tapout = (A[MTIMETAP]^B[MTIMETAP]) & isWttime;
   end
   
   /* For retired instructions interrupt
    */
   if ( (MTIMETAP < MTIMETAP_LOWLIM) ||
        (ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 0)        
        )  begin
      assign alu_minstretofl = 1'b0; 
   end else begin
      wire isWrinst = {sa27,sa26,sa25,sa24} == 4'b1001;
      assign alu_minstretofl = alu_carryout & isWrinst;
   end
endmodule

/* =============================================================================
 */
module m_alu_lowlevel
  # ( parameter MTIMETAP = 0,
      ucodeopt_HAS_MINSTRET = 0,
      ucodeopt_HAS_EBR_MINSTRET = 0,
      ALUWIDTH = 8,
      MTIMETAP_LOWLIM = 32
      )
   (
    input [ALUWIDTH-1:0]  Di,
    input [ALUWIDTH-1:0]  ADR_O,
    input [ALUWIDTH-1:0]  QQ, 
    input                 alu_carryin, 
    input [2:0]           s_alu,
/* verilator lint_off UNUSED */
    input                 sa27,sa26,sa25,sa24,
/* verilator lint_on UNUSED */ 
    output [ALUWIDTH-1:0] B,
    output                A31,
    output                alu_carryout,
    output                alu_tapout,
    output                alu_minstretofl
    );
   
   wire [ALUWIDTH-1:0]    A;
   
   /* verilator lint_off UNOPTFLAT */
   wire [ALUWIDTH:0]      alucy; 
   /* verilator lint_on UNOPTFLAT */

   /* This is the alu proper
    */
   assign alucy[0] = alu_carryin;
   bn_l4 #(.I(16'h04b4)) a [ALUWIDTH-1:0] (.o(A), .i3(s_alu[1]), .i2(Di), .i1(s_alu[0]), .i0(ADR_O));
   bn_lcy4 #(.I(16'hc369)) b [ALUWIDTH-1:0] (.o(B), .co(alucy[ALUWIDTH:1]), .i3(alucy[ALUWIDTH-1:0]), .i2(QQ), .i1(A),.i0(s_alu[2]));
   assign A31 = A[ALUWIDTH-1];

   /* When we increment the low 32-bit of mtime, we have a carry into bit MTIMETAP only
    * when the output bit B[MTIMETAP] is set, bit the input bit A[MTIMETAP] was clear. 
    */
   if ( MTIMETAP < MTIMETAP_LOWLIM || MTIMETAP > ALUWIDTH ) begin
      assign alu_tapout = 1'b0;
   end else begin
      wire isWttime;
      bn_l4v #(.I(16'h0800)) l_isWttime( .o(isWttime), .i({sa27,sa26,sa25,sa24}));
      bn_l4v #(.I(16'h4040)) l_alu_tapout( .o(alu_tapout), .i({1'b0,isWttime,B[MTIMETAP],A[MTIMETAP]}));
   end 

   /* If we have interrupts I assume we also have an instruction counter.
    * This is not neccesarely true, but due to dependencies in the microcode,
    * I presently always make this logic.
    * To replicate the carry out of the ALU, I add one more element to the column.
    * See issue #13.
    */
   wire propcy;
   if ( (MTIMETAP < MTIMETAP_LOWLIM) ||
        (ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 0) 
        ) begin
      assign propcy = alucy[ALUWIDTH];
      assign alu_minstretofl = 1'b0; // Keep Verilator happy
   end else begin
      wire isWrinst;
      bn_l4v #(.I(16'h0200)) l_isWrinst( .o(isWrinst), .i({sa27,sa26,sa25,sa24}));
      bn_lcy4v #(.I(16'haa00)) l_alu_minstretofl( .o(alu_minstretofl), .co(propcy), .i({alucy[ALUWIDTH],2'b01,isWrinst}));
   end
   assign alu_carryout = propcy;
   
endmodule

