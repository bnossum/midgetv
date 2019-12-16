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
   reg [W-1:0]    rP,rM;
   reg            rF;
   
   wire [W-1:0]   cmb_P;//,cmb_M;
   wire           load       = op[0];
   wire [1:0]     shifttype  = op[2:1];
   wire [1:0]     addtype    = op[4:3];
   wire           add;
   wire           cmb_rF;
   reg [W*2:0]    v;  
   wire           Dimsb,Pmsb;
   wire           enable;
   
   assign add =  (rM[0] & ~load) | addtype[1];

   assign Pmsb  = addtype[1] ? rF   : (addtype[0] ? rF      : 1'b0);
   assign Dimsb = addtype[1] ? 1'b1 : (addtype[0] ? Di[W-1] : 1'b0);
   assign {cmb_rF,cmb_P} = add ? {Pmsb,rP} + {Dimsb,Di} + {{(W-1){1'b0}},ci} : {Pmsb,rP};

   assign enable = !(addtype[1]&cmb_rF);

   always @(/*AS*/Pmsb or addtype or cmb_P or cmb_rF or rF or rM or rP
            or shifttype)
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
 * This diagram   C A N   N O T  W O R K
 *                                   
 *             ___     |                      ___                         ___ 
 *  add  -(((-|I0 |    |                     |I0 |                       |D Q|
 * Di[3] -+((-|I1 |    | +-------------------|I1 |----------------------->   |--- P[3]
 *  P[3] --(+-|I2 |----+ |              shr -|I2 |                 en   -E   |
 *         +--|I3_|    | |                  -|I3_|                 load -R___|
 *         |           | |                                                    
 *        /y\  ___     | |                    ___                         ___ 
 *   add -(((-|I0 |    +-(-------------------|I0 |                       |D Q|
 * Di[2] -+((-|I1 |      | +-----------------|I1 |----------------------->   |--- P[2]
 *  P[2] --(+-|I2 |------+ |            shr -|I2 |                 en   -E   |
 *         +--|I3_|      | |                -|I3_|                 load -R___|
 *         |             | |                                                  
 *        /y\  ___       | |                  ___                         ___ 
 *   add -(((-|I0 |      +-(-----------------|I0 |                       |D Q|
 * Di[1] -+((-|I1 |        | +---------------|I1 |----------------------->   |--- P[1]
 *  P[1] --(+-|I2 |--------+ |          shr -|I2 |                 en   -E   |
 *         +--|I3_|        | |              -|I3_|                 load -R___|
 *         |               | |                                                
 *        /y\  ___         | |                ___                         ___ 
 *   add -(((-|I0 |        +-(---------------|I0 |                       |D Q|
 * Di[0] -+((-|I1 |          | +-------------|I1 |----------------------->   |--- P[0]  
 *  P[0] --(+-|I2 |          | |        shr -|I2 |                 en   -E   |
 *         +--|I3_|----------+ |            -|I3_|                 load -R___|
 *         |                 | |                                      
 *         Ci                | |              ___             ___         ___    
 *                           +-(-------------|I0 |-----------|I0 |-------|D Q|--- M[3]           
 *                             | +-----------|I1 |    Di[3] -|I1 |       >   |   
 *                    M[3] ----+ |      shr -|I2 |    load  -|I2 | en   -E   |   
 *                             | |          -|I3_|           |I3_|       R___|   
 *                             | |                                          
 *                             | |            ___             ___         ___    
 *                             +-(-----------|I0 |-----------|I0 |-------|D Q|--- M[2]   
 *                               | +---------|I1 |    Di[3] -|I1 |       >   |   
 *                    M[2] ------+ |    shr -|I2 |    load  -|I2 | en   -E   |   
 *                               | |        -|I3_|           |I3_|       R___|   
 *                               | |                                        
 *                               | |          ___             ___         ___    
 *                               +-(---------|I0 |-----------|I0 |-------|D Q|--- M[1]
 *                                 | +-------|I1 |    Di[3] -|I1 |       >   |
 *                    M[1] --------+ |  shr -|I2 |    load  -|I2 | en   -E   |   
 *                                 | |      -|I3_|           |I3_|       R___|   
 *                                 | |                                      
 *                                 | |        ___             ___         ___  
 *                                 +-(-------|I0 |-----------|I0 |-------|D Q|--- M[0]
 *                                   |  shr -|I1 |    Di[3] -|I1 |       >   |   
 *                                   |      -|I2 |    load  -|I2 | en   -E   |   
 *                    M[0] ----------+      -|I3_|          -|I3_|       R___|
 *  
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 *  
 */
endmodule

