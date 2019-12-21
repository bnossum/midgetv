/*
 * This is a multipier/divider that is "human sized" so I can get it 
 * right in midgetv later on.
 */
/* verilator lint_off DECLFILENAME */
/* verilator lint_off WIDTH */
module humansized_muldiv
  # ( parameter ALUWIDTH = 8,
      HIGHLEVEL = 0
      )
   (
    input                   clk,
    // These inputs occurs in midgetv even without MULDIV
    input [ALUWIDTH-1:0]    DAT_O, // From EBR
    input [ALUWIDTH-1:0]    DAT_I, // External input, not used here
    input [ALUWIDTH-1:0]    Dsram, // RAM input, not used here
    input [31:0]            INSTR,
    input                   STB_O_or_ReadM,
    input                   sa00mod,
    input [2:0]             s_alu,
    input [1:0]             s_alu_carryin,
    input                   use_dinx,
    input                   sa14, // loadMn

    input                   ceM, //   CE for M register. Also used by m_condcode
    input                   clrM, //  R for M register. Also used to flag unsigned subtraction in DIV/DIVU/REM/REMU
    
    output [ALUWIDTH-1:0]   ADR_O, 
    output reg              rF, 
    output [ALUWIDTH-1:0]   M,
    output [2*ALUWIDTH-1:0] QM,
    output [1:0]            divdbg
    );
   wire                     newop = clrM;
   
   wire                     cond_holdq;
   wire [ALUWIDTH-1:0]      B;
   
   /* verilator lint_off UNUSED */
   /* verilator lint_on UNUSED */
   reg [ ALUWIDTH-1:0]      rDee;
   wire [ALUWIDTH-1:0]      shrQ;
   wire [ALUWIDTH-1:0]      Di;
   wire [ALUWIDTH-1:0]      QQ;
   wire                     mod_s_alu_1;
   wire                     alu_carryout;
   wire                     alu_carryin;
   wire [1:0]               mod_s_alu_carryin;   
   wire                     raluF;

   /* verilator lint_off UNUSED */
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 A31;                    // From alu of m_alu.v
   wire                 alu_minstretofl;        // From alu of m_alu.v
   wire                 alu_tapout;             // From alu of m_alu.v
   wire                 is_brcond;              // From cnd of m_condcode.v
   wire                 m_condcode_killwarnings;// From cnd of m_condcode.v
   wire                 m_immexp_zfind_q_killwarnings;// From immexp_zfind_q of m_immexp_zfind_q.v
   wire                 rlastshift;             // From inst_alu_carryin of m_alu_carryin.v
   wire                 rzcy32;                 // From immexp_zfind_q of m_immexp_zfind_q.v
   wire                 sra_msb;                // From inst_alu_carryin of m_alu_carryin.v
   // End of automatics
   /* verilator lint_on UNUSED */
   
   /*
    * First some constructions that must be there, but that are
    * irrelevant to what I try to acheive.
    */
   
   assign QQ = ADR_O;
   always @(posedge clk)
     rDee <= STB_O_or_ReadM ? (DAT_I | M) : Dsram;
   assign Di = sa00mod ? DAT_O : (DAT_O & rDee) | (~DAT_O & shrQ);
   assign shrQ = {sra_msb, ADR_O[ALUWIDTH-1:1]};
   assign QM = {ADR_O,M};
   
   wire                 cmb_rF2;
   assign mod_s_alu_1 = (s_alu == 3'b100 && newop == 1'b0) ? ~M[0] : s_alu[1];
   
/* May replace modules with explicit code for investigation
 */

//`define WHAT_THE_CONDCODE_DOES              1
//`define WHAT_THE_ALU_CARRYIN_DOES           1
//`define WHAT_THE_IMMEXP_ZFIND_Q_DOES        1
//`define WHAT_THE_ALU_DOES                   1
//`define WHAT_THE_BIDIRECTIONAL_SHIFTER_DOES 1   


`ifdef WHAT_THE_CONDCODE_DOES
   wire                 cmb_rF;
   wire                 isadd;
   wire                 Pmsb;
   wire                 Dmsb;
   wire [1:0]           shifttype;
   
   assign shifttype  = op[2:1];
   assign isadd = {s_alu[2],mod_s_alu_1,s_alu[0]} == 3'b100;
   
   assign Pmsb  = addtype[1] ? rF   : (addtype[0] ? rF                : 1'b0);
   assign Dmsb  = addtype[1] ? 1'b1 : (addtype[0] ? DAT_O[ALUWIDTH-1] : 1'b0);
   
   
   assign cmb_rF = isadd ? (alu_carryout^Pmsb^Dmsb) : Pmsb;
   always @(/*AS*/ADR_O or cmb_rF or rF or shifttype)
     case ( shifttype )
       2'b00: cmb_rF2 = cmb_rF;            // Addition
       2'b01: cmb_rF2 = 1'b0;              // Shift right logical
       2'b10: cmb_rF2 = rF;                // Shift right arithmetic
       2'b11: cmb_rF2 = ADR_O[ALUWIDTH-1]; // Shift left logical
     endcase
   
   always @(posedge clk)
     if ( ~cond_holdq ) 
       rF <= use_dinx ?  1'b0 : cmb_rF2;

   assign divdbg = {rF,cmb_rF2};
`else
   m_condcode #(.HIGHLEVEL(1), .MULDIV(1)) cnd
     (// Inputs
      .QQ31                             (QQ[ALUWIDTH-1]),
      // Outputs
      .raluF                            (rF),
      /*AUTOINST*/
      // Outputs
      .is_brcond                        (is_brcond),
      .cmb_rF2                          (cmb_rF2),
      .m_condcode_killwarnings          (m_condcode_killwarnings),
      // Inputs
      .clk                              (clk),
      .alu_carryout                     (alu_carryout),
      .INSTR                            (INSTR[31:0]),
      .A31                              (A31),
      .use_dinx                         (use_dinx),
      .cond_holdq                       (cond_holdq),
      .ceM                              (ceM),
      .rzcy32                           (rzcy32));

   assign divdbg = {rF,cmb_rF2};
`endif
   
`ifdef WHAT_THE_ALU_CARRYIN_DOES
   // Alu op changed from ADD to PASSQ must kill carry in
   assign mod_s_alu_carryin = (mod_s_alu_1 ^ s_alu[1]) ? 0 : s_alu_carryin;
   assign raluF  = s_alu_carryin[1] ? M[ALUWIDTH-1] : rF;
   assign alu_carryin = mod_s_alu_carryin[1] ? (mod_s_alu_carryin[0] ? 1 : M[ALUWIDTH-1]) : (mod_s_alu_carryin[0] ? raluF : 0);
   assign sra_msb = rF;
`else
   wire                     lastshift=0,FUNC7_5=0,ADR_O_31=0,FUNC7_0 = 1;
   assign mod_s_alu_carryin = (mod_s_alu_1 ^ s_alu[1]) ? 0 : s_alu_carryin;
   assign raluF  = s_alu_carryin[1] ? M[ALUWIDTH-1] : rF;
   
   m_alu_carryin #(.HIGHLEVEL(1), .MULDIV(1)) inst_alu_carryin
     (// Inputs
      .s_alu_carryin                    (mod_s_alu_carryin[1:0]),
      /*AUTOINST*/
      // Outputs
      .alu_carryin                      (alu_carryin),
      .sra_msb                          (sra_msb),
      .rlastshift                       (rlastshift),
      // Inputs
      .clk                              (clk),
      .lastshift                        (lastshift),
      .raluF                            (raluF),
      .FUNC7_5                          (FUNC7_5),
      .FUNC7_0                          (FUNC7_0),
      .ADR_O_31                         (ADR_O_31));

   //assign new_sra_msb = FUNC7_5 ? ADR_O[ALUWIDTH-1] : FUNC7_0 ? raluF : 0;
`endif
   
   /*
    * First I had the signal conden:
    * assign cond_holdq = cmb_rF & addtype[1]; so
    * assign conden = (~addtype[1] | ~cmb_rF2) & en;
    * conden must be combined with the existing equation in m_progressctrl:
    * assign enaQ = (sa15 | sa32) & ~lastshift    & ~(STB_O | sram_stb);
    * From ucode.h we see that (sa15| sa32) is 0 only for Qhld and Qx.
    * So what I should do is to find out not when Q is to be enabled,
    * but when it is to be disabled. 
    * 
    * We have
    * cond_holdq = addtype[1] & cmb_rF
    * but can probably simplify. After all, it should only be
    * when we are dividing and have a carry out we must hold.
    * 
    * = addtype[1] & (isadd ? (alu_carryout^Pmsb^Dmsb) : Pmsb)
    * cond_holdq = addtype[1] &alu_carryout
    * 
    * ... and this showed to be correct. Chances for avoidance
    * of a critical path is improved. As luck will have it,
    * I can get a good indication with a trail run.
    * Assume the iceblink-40hx1k.v project, compiling
    * to 266 SB_LUTs and 71.36 MHz. I add a fake
    * equation in m_progressctrl.v:
    * //SB_LUT4 #(.LUT_INIT(16'h000e)) l_enaQ(.O(enaQ), .I3(STB_O), .I2(lastshift), .I1(sa15), .I0(sa32)); //correct
    * SB_LUT4 #(.LUT_INIT(16'h000e)) l_enaQ(.O(enaQ), .I3(STB_O), .I2(lastshift), .I1(sa15), .I0(alu_carryout)); // test
    * Compiles to 267 SB_LUTs and 69.96 MHz. So it has an impact, but is no show-stopper. At Medium placement effort
    * I still reach 74.96 MHz. Restoring Division is the algorithm we will pursue.
    */
   assign cond_holdq = ~alu_carryout & newop;
   
   /*
    * The rest is constructions that are unchanged - but
    * pay attention to control.
    */
   
`ifdef WHAT_THE_IMMEXP_ZFIND_Q_DOES
   reg [ALUWIDTH-1:0]       rADR_O;
   always @(posedge clk)
     if ( ~cond_holdq ) 
       rADR_O  <= sa14 ? B : 1'b0;
   assign ADR_O = rADR_O;
`else
   wire                     sa11 = 1'b0,corerunning = 1'b1;
   wire                     sa14,enaQ;
   assign enaQ = ~cond_holdq;
   // m_immexp_zfind_q must be HIGHLEVEL, ALUWIDTH is fixed to 32 bits in LOWLEVEL
   m_immexp_zfind_q #( .HIGHLEVEL(1), .ALUWIDTH(ALUWIDTH) ) immexp_zfind_q
     (/*AUTOINST*/
      // Outputs
      .rzcy32                           (rzcy32),
      .ADR_O                            (ADR_O[ALUWIDTH-1:0]),
      .m_immexp_zfind_q_killwarnings    (m_immexp_zfind_q_killwarnings),
      // Inputs
      .B                                (B[ALUWIDTH-1:0]),
      .clk                              (clk),
      .sa11                             (sa11),
      .sa14                             (sa14),
      .corerunning                      (corerunning),
      .enaQ                             (enaQ),
      .INSTR                            (INSTR[31:0]));
`endif
   
`ifdef WHAT_THE_ALU_DOES   
   /* verilator lint_off UNOPTFLAT */
   wire [ALUWIDTH:0]        acy;
   /* verilator lint_on UNOPTFLAT */
   wire [ALUWIDTH-1:0]      A;
   assign acy[0] = alu_carryin;
   m_lut #(.v(16'h04b4)) a [ALUWIDTH-1:0] (.O(A), .I3(mod_s_alu_1), .I2(Di), .I1(s_alu[0]), .I0(ADR_O)); 
   m_cylut #(.v(16'hc369)) b [ALUWIDTH-1:0] (.O(B),.CO(acy[ALUWIDTH:1]), .CI(acy[ALUWIDTH-1:0]), .I3(acy[ALUWIDTH-1:0]), .I2(QQ), .I1(A), .I0(s_alu[2]));
   assign alu_carryout = acy[ALUWIDTH];
`else
   wire                     sa24=0,sa25=0,sa26=0,sa27=0; 
   m_alu #( .HIGHLEVEL(HIGHLEVEL), .ALUWIDTH(ALUWIDTH) ) alu
     (// Inputs
      .s_alu                            ({s_alu[2],mod_s_alu_1,s_alu[0]}),
      /*AUTOINST*/
      // Outputs
      .B                                (B[ALUWIDTH-1:0]),
      .A31                              (A31),
      .alu_carryout                     (alu_carryout),
      .alu_tapout                       (alu_tapout),
      .alu_minstretofl                  (alu_minstretofl),
      // Inputs
      .Di                               (Di[ALUWIDTH-1:0]),
      .ADR_O                            (ADR_O[ALUWIDTH-1:0]),
      .QQ                               (QQ[ALUWIDTH-1:0]),
      .alu_carryin                      (alu_carryin),
      .sa27                             (sa27),
      .sa26                             (sa26),
      .sa25                             (sa25),
      .sa24                             (sa24));
`endif
   
   
`ifdef WHAT_THE_BIDIRECTIONAL_SHIFTER_DOES
   /* Keep a while for reference: */
   wire [ALUWIDTH-1:0]      shrM;
   wire [ALUWIDTH-1:0]      shlM;
   wire [ALUWIDTH-1:0]      cmbM;
   assign shrM = { ADR_O[0],M[ALUWIDTH-1:1]};
   assign shlM = { M[ALUWIDTH-2:0],1'b0};   
   assign cmbM = sa14 ? (DAT_O & shlM) | (~DAT_O & shrM ) : DAT_O;
   
   always @(posedge clk)
     if ( ceM )
       M[ALUWIDTH-1:1] <= clrM ? 0 : cmbM[ALUWIDTH-1:1];
   
   always @(posedge clk)
     if ( ceM | addtype[1]  )
       M[0] <= clrM ? 0 : ~addtype[1]&cmbM[0] | addtype[1]&~cmb_rF2;    
`else
   /* Bidirectional shift register
    */
   wire                     ADR_O0 = ADR_O[0];
   
   m_shlr #( .ALUWIDTH(ALUWIDTH) ) shlr
     (// Inputs
      .loadMn                           (sa14),
      /*AUTOINST*/
      // Outputs
      .M                                (M[ALUWIDTH-1:0]),
      // Inputs
      .clk                              (clk),
      .ceM                              (ceM),
      .clrM                             (clrM),
      .cmb_rF2                          (cmb_rF2),
      .ADR_O0                           (ADR_O0),
      .DAT_O                            (DAT_O[ALUWIDTH-1:0]));
`endif
   
endmodule

/*
 * 
 * 
 * STB_O_or_ReadM ---+                                         
 *         __        |              sa00mod ---------+          
 * DAT_I -|or|------|1\         __  DAT_O ----+-----|1\         
 * M -----|__|      |  |-------|  |-rDee ----|1\    |  |-- Di
 * Dsram -----------|0/        >  |          |  |---|0/         
 *                corerunning -E  | shADR_O--|0/                
 *                            -R__|  
 * 
 * add = rM[0] | addtype[1]
 * enable = !(addtype[1]&cmb_F)
 * 
 *                  addtype
 *                  ||shifttype
 *                  |||| 
 *                  ||||       
 *  OP_UNSIGNED_ADD 0000       
 *  OP_SRL          0001       
 *  OP_SRA          0010       
 *  OP_SLL          0011       
 *  OP_SIGNED_ADD   0100       
 *  OP_UNSIGNED_SUB 1000       
 
 * addtype[1:0]
 * || shifttype[1:0]
 * || || add
 * || || |                                msbs[1:0]
 * || || | Pmsb  Dimsb    cmb_F           | |         F2
 * 00 00 x 0     0        acy            {1,1}        cmb_F
 * 00 01 x 0     0        acy            {1,1}        0
 * 00 10 x 0     0        acy            {1,1}        rF
 * 00 11 x 0     0        acy            {1,1}        ADR_O[3]
 * 01 00 0 rF    A[3]     A[3]^rF^acy    {0,rF}       cmb_F
 * 01 00 1 rF    A[3]     A[3]^rF^acy    {0,rF}       cmb_F
 * 10 00 0 x     x        x
 * 10 00 1 rF    1        1^rF^acy       {1,rF}       cmb_F
 * 11 00 x x     x        x
 * 11 01 x x     x        x
 * 11 1x x x     x        x
 * 
 * 
 * 
 * 
 * 
 * 
 *   Scaled-down and simplified representation of midgetv main ALU datapath.
 * 
 * 
 *                                                                                                             __
 * (                              )                                                                addtype[1]-|& |o----------------- en  (critical path I believe)
 * (                              )                                                                   +-cmb_F-|__|                       
 * (                              )                                                        ___        |        ___           ___         
 * (                              )                                  Dimsb = A[3] --------|I0 |-------+-------|I0 |-- F2 ---|D Q|--- rF  
 * (                              )                                  msbs[0]      --------|I1 |              -|I1 |         >   |        
 * (                              )                                  msbs[1]      --------|I2 |       shty[0]-|I2 |   en   -E   |        
 * (                              )                                                 +-----|I3_|       shty[1]-|I3_|   load -R___|        
 * (                              )                                                 |acy                                                 
 * (                  ___    ___  )            ___               ___               /y\     ___                 ___           ___         
 * (       DAT_I[3] -|I0 |--|D  | )    srmsb -|I0 |  Q[3]     --|I0 |   s_alu[2] --(((----|I0 | B[3]         -|I0 |---------|D Q|        
 * (           M[3] -|I1 |  >   | ) DAT_O[3] -|I1 |  s_alu[0] --|I1 |--------------+((----|I1 |---------------|I1 |         >   |--- Q[3]
 * (       Dsram[3] -|I2 | -E  Q -)- rDee[3] -|I2 |- Di[3]    --|I2 |A[3]  QQ[3] ---(+----|I2 |              -|I2 |   en   -E   |        
 * ( STB_O_or_ReadM -|I3_| -R___| )  sa00mod -|I3_|  s_alu[1] --|I3_|               +-----|I3_|              -|I3_|   load -R___|        
 * (                              )                                                 |                                                    
 * (                  ___    ___  )            ___               ___               /y\     ___                 ___           ___         
 * (       DAT_I[2] -|I0 |--|D  | )     Q[3] -|I0 |  Q[2]     --|I0 |   s_alu[2] --(((----|I0 | B[2]         -|I0 |---------|D Q|        
 * (           M[2] -|I1 |  >   | ) DAT_O[2] -|I1 |  s_alu[0] --|I1 |--------------+((----|I1 |---------------|I1 |         >   |--- Q[2]
 * (       Dsram[2] -|I2 | -E  Q|-)- rDee[2] -|I2 |- Di[2]    --|I2 |A[2]  QQ[2] ---(+----|I2 |              -|I2 |   en   -E   |        
 * ( STB_O_or_ReadM -|I3_| -R___| )  sa00mod -|I3_|  s_alu[1] --|I3_|               +-----|I3_|              -|I3_|   load -R___|        
 * (                              )                                                 |                                                    
 * (                  ___    ___  )            ___               ___               /y\     ___                 ___           ___         
 * (       DAT_I[1] -|I0 |--|D  | )     Q[2] -|I0 |  Q[1]     --|I0 |   s_alu[2] --(((----|I0 | B[1]         -|I0 |---------|D Q|        
 * (           M[1] -|I1 |  >   | ) DAT_O[1] -|I1 |  s_alu[0] --|I1 |--------------+((----|I1 |---------------|I1 |         >   |--- Q[1]
 * (       Dsram[1] -|I2 | -E  Q|-)- rDee[1] -|I2 |- Di[1]    --|I2 |A[1]  QQ[1] ---(+----|I2 |              -|I2 |   en   -E   |        
 * ( STB_O_or_ReadM -|I3_| -R___| )  sa00mod -|I3_|  s_alu[1] --|I3_|               +-----|I3_|              -|I3_|   load -R___|        
 * (                              )                                                 |                                                    
 * (                  ___    ___  )            ___               ___               /y\     ___                 ___           ___         
 * (       DAT_I[0] -|I0 |--|D  | )     Q[1] -|I0 |  Q[0]     --|I0 |   s_alu[2] --(((----|I0 | B[0]         -|I0 |---------|D Q|        
 * (           M[0] -|I1 |  >   | ) DAT_O[0] -|I1 |  s_alu[0] --|I1 |--------------+((----|I1 |---------------|I1 |         >   |--- Q[0]
 * (       Dsram[0] -|I2 | -E  Q|-)- rDee[0] -|I2 |- Di[0]    --|I2 |A[0]  QQ[0] ---(+----|I2 |              -|I2 |   en   -E   |        
 * ( STB_O_or_ReadM -|I3_| -R___| )  sa00mod -|I3_|  s_alu[1] --|I3_|               +-----|I3_|              -|I3_|   load -R___|        
 * (                              )                                                 | alu_carryin                                        
 *                                                                                 /y\     ___                 ___           ___         
 *                                                                         --------(((----|I0 |        M[2]  -|I0 |---------|D Q|--- M[3]
 *                                                               s_alu_carryin[0] -+((----|I1 |        Q[0]  -|I1 |         >   |        
 *                                                               s_alu_carryin[1] --(+----|I2 |    DAT_O[3]  -|I2 |   enm  -E   |        
 *                                                                        ----------(-----|I3_|        load  -|I3_|   clrm -R___|        
 *                                                                                  | prealucyin                                         
 *                                                                                 /y\     ___                 ___           ___         
 *                                                                           ------(((----|I0 |        M[1]  -|I0 |---------|D Q|--- M[2]
 *                                                               raluF ------------+||    |I1 |        M[3]  -|I1 |         >   |        
 *                                                               GND ---------------(+    |I2 |    DAT_O[2]  -|I2 |   enm  -E   |        
 *                                                                                  |     |I3_|        load  -|I3_|   clrm -R___|        
 *                                                                                  VCC                                                  
 *                                                                                                             ___           ___         
 *                                                                                                     M[0]  -|I0 |---------|D Q|--- M[1]
 *                                                                                                     M[2]  -|I1 |         >   |        
 *                                                                                                 DAT_O[1]  -|I2 |   enm  -E   |        
 *                                                                                                     load  -|I3_|   clrm -R___|        
 *                                                                                                                                       
 *                                                                                                             ___           ___         
 *                                                                                               add_npassA  -|I0 |---------|D Q|--- M[0]
 *                                                                                                     M[1]  -|I1 |         >   |   
 *                                                                                                 DAT_O[0]  -|I2 |   enm  -E   |   
 *                                                                                                     load  -|I3_|   clrm -R___|
 *      
 *      sramsb
 *      -------
 *      0
 *      Q[3]
 *      rF
 * 
 *      alu_carryin
 *      ----------
 *      0
 *      1
 *      rF
 *      M[3]
 * 
 *     cmb_fmsb_s
 *     |cmb_fmsb 
 *     ||   cmb_F
 *     --   ----
 *     0x   acy
 *     10   0^acy
 *     11   1^acy
 *  
 * sel_cmb_fmsb
 * |A[3]
 * ||rF  cmb_fmsb
 * 0xx   A[3]^rF
 * 1xx   1^rF
 */



// Local Variables:
// verilog-library-directories:("." ".." )
// verilog-library-extensions:(".v" )
// End:
