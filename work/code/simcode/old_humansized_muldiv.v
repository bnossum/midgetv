/*
 * This is a multipier/divider that is "human sized" so I can get it 
 * right in midgetv later on.
 */
/* verilator lint_off DECLFILENAME */
/* verilator lint_off WIDTH */
module humansized_muldiv
  # ( parameter W = 4,
      HIGHLEVEL = 1
      )
   (
    input            clk,
    input [4:0]      op,
    input [W-1:0]    Di,
    input            ci,
    output [2*W-1:0] PM,
    output           dbg_rF
    );

   if ( HIGHLEVEL )
          highlevel_humansized_muldiv # (.W(W)) h_inst
            (/*AUTOINST*/
             // Outputs
             .PM                        (PM[2*W-1:0]),
             .dbg_rF                    (dbg_rF),
             // Inputs
             .clk                       (clk),
             .op                        (op[4:0]),
             .Di                        (Di[W-1:0]),
             .ci                        (ci));
   else
          lowlevel_humansized_muldiv # (.W(W)) h_inst
            (/*AUTOINST*/
             // Outputs
             .PM                        (PM[2*W-1:0]),
             .dbg_rF                    (dbg_rF),
             // Inputs
             .clk                       (clk),
             .op                        (op[4:0]),
             .Di                        (Di[W-1:0]),
             .ci                        (ci));
  
endmodule

/////////////////////////////////////////////////////////////////////////////
/* 60 LUTs when W == 8. Can do much better, but this proves the principle.
 *
 * Here I use two cycles per bit, to reflect what will happen in midgetv.
 * 
 * When multiplying, we add when lsb of M is set, and we are in an add cycle.
 * When dividing, the addition is actually a subtraction that determines enable.
 * 
 * 4-to-1 muxes determine what to store in shift registers.
 * 
 */
module highlevel_humansized_muldiv
  # ( parameter W = 8
      )
   (
    input            clk,
    input [4:0]      op,
    input [W-1:0]    Di,
    input            ci,
    output [2*W-1:0] PM,
    output           dbg_rF
    );
   reg [W-1:0]       rP,rM;
   reg               rF;
   
   wire [W-1:0]      cmb_P;//,cmb_M;
   wire              load       = op[0];
   wire [1:0]        shifttype  = op[2:1];
   wire [1:0]        addtype    = op[4:3];
   wire              add;
   wire              cmb_rF;
   reg [W*2:0]       v;  
   wire              Dimsb,Pmsb;
   wire              enable;
   
   assign add =  rM[0] | addtype[1];
   
   assign Pmsb  = addtype[1] ? rF   : (addtype[0] ? rF      : 1'b0);
   assign Dimsb = addtype[1] ? 1'b1 : (addtype[0] ? Di[W-1] : 1'b0);
   assign {cmb_rF,cmb_P} = add ? {Pmsb,rP} + {Dimsb,Di} + {{(W-1){1'b0}},ci} : {Pmsb,rP};

   assign enable = !(addtype[1]&cmb_rF);

   always @(/*AS*/cmb_P or cmb_rF or rF or rM or rP or shifttype)
     case ( shifttype )
       2'b00: v = {cmb_rF, cmb_P,rM[W-1:1],1'b1}; // Addition
       2'b01: v = {1'b0, rF, rP,rM[W-1:1]};       // Shift right logical
       2'b10: v = {rF,   rF, rP,rM[W-1:1]};       // Shift right arithmetic
       2'b11: v = {rP,   rM, 1'b0};               // Shift left logical
     endcase

   always @(posedge clk) 
      if ( enable ) begin
         rF <= load ? 0  : v[W*2]     ;
         rP <= load ? 0  : v[W*2-1:W] ;
         rM <= load ? Di : v[W-1:0]   ;
      end

   assign PM = {rP,rM};
   assign dbg_rF = rF;
endmodule

//   wire              load       = op[0];
//   wire [1:0]        shifttype  = op[2:1];
//   wire [1:0]        addtype    = op[4:3];
//   reg [W-1:0]       ADR_O,rM;
//   reg               rF;
//   wire [W-1:0]      A;
//   wire              add,enable;
//   wire [W-1:0]      DAT_O = Di; // Tmp
//   wire              sa00mod; // TMP
//   wire              acy;
//   wire [W-1:0]      usum,shrADR_O;
//   wire              cmb_F,F2;
//   wire [W-1:0]      cmbM;
//   wire [W-1:0]      shrM;
//   wire              shr_msb = 1'b0; // TMP
//   wire [W-1:0]      shlM = 0; // TMP
//   wire              enM;
//   
//   assign sa00mod = op[4:0] == 5'b00010 ? 1 : 0;
//   
//   assign shrM = {ADR_O[0],rM[W-1:1]};
//   assign shrADR_O = {shr_msb,ADR_O[W-1:1]};
//   assign add = rM[0];
//   //                         load        mult say add                       SRL
//   assign enable = op[4:0] == 5'b00001 || (op[4:0] == 5'b00000 && rM[0]) || (op[4:0] == 5'b00010);
//   assign enM    = op[4:0] == 5'b00001 ||                                   (op[4:0] == 5'b00010);
//   assign A = sa00mod ? shrADR_O : DAT_O;
//   assign {acy,usum} = add ? {1'b0,ADR_O} + {1'b0,A} + {{(W-1){1'b0}},ci} : {1'b0,A};
//
//   always @(/*AS*/A or acy or addtype or rF)
//     case (addtype)
//       2'b00 : cmb_F = acy;
//       2'b01 : cmb_F = A[W-1]^rF^acy;
//       2'b10 : cmb_F = 1'b1^rF^acy;
//       2'b11 : cmb_F = 1'b0; // don't care
//     endcase
//   always @(/*AS*/cmb_F or rF or shifttype)
//     case (shifttype)
//       2'b00 : F2 = cmb_F;
//       2'b01 : F2 = 1'b0;
//       2'b10 : F2 = rF;
//       2'b11 : F2 = ADR_O[W-1];
//     endcase
//   assign cmbM = load ? DAT_O : (DAT_O & shrM) | (~DAT_O & shlM );
//
//   always @(posedge clk) 
//     if ( enable ) begin
//        rF <= F2;
//        ADR_O <= load ? 0 : usum;
//     end
//
//   always @(posedge clk) 
//     if ( enM )
//        rM <= cmbM;
//   
//   assign PM = {ADR_O,rM};
//   assign dbg_rF = rF;
//endmodule

/////////////////////////////////////////////////////////////////////////////
// Module not pursued. If I want a compact solution, go back and
// redefine control. For the prototyping of the midgetv mult/div
// the highlevel is good enough
// 
module lowlevel_humansized_muldiv
  # ( parameter W = 8
      )
   (
    input            clk,
    input [4:0]      op,
    input [W-1:0]    Di,
    input            ci,
    output [2*W-1:0] PM,
    output           dbg_rF
    );

/*
 * 
 * 
 * STB_O_or_ReadM ---+                                         
 *         __        |              sa00mod ---------+          
 * DAT_I -|or|------|1\         __  DAT_O ----+-----|0\         
 * M -----|__|      |  |-------|  |-rDee ----|0\    |  |-- A
 * Dsram -----------|0/        >  |          |  |---|1/         
 *                corerunning -E  | shADR_O--|1/                
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
endmodule

