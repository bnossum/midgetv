// Work. Need to add code dependency to pack lastshift as shown in diagram [a]
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 
 * The alu carry input. It must be selectable. raluF is used by slt(u), slti(u)
 * instructions. alu_carryin must be put on the carry chain.
 * 
 * Free resources here give sra_msb and rlastshift
 * Size of module : 2 SB_LUT4s
 * 
 *                                          
 *                    | alu_carryin           s_alu_carryin[1]       FUNC7_5 
 *                   /y\     ___              |s_alu_carryin[0]      |Q[31]    
 * ADR_O[31] --------(((----|I0 |             ||  prealucyin         ||      sra_msb    
 * s_alu_carryin[0] -+((----|I1 |-- sra_msb   00  0                  00      0      
 * s_alu_carryin[1] --(+----|I2 |             01  raluF              01      0
 * FUNC7_5 -----------(-----|I3_|             10  raluF              10      0
 *                    | prealucyin            11  1                  11      1
 *                   /y\     ___                     __        
 * lastshift   ------(((----|I0 |-- lastshift_dup --|  |-- rlastshift
 * raluF ------------+||    |I1 |                   |  | 
 * GND ---------------(+    |I2 |                   >__|    
 *                    |     |I3_|
 *                    |
 *                    VCC
 * 
 * Minor changes after MULDIV implemented:
 * raluF only need to be put on the carry chain for SLT[I][U], all other situations are don't care
 * It is not evident, but from ucode.h we see that ADR_O == 0 when raluF is indeed used. This
 * mean we can squeze in this solution:
 * 
 * diagram [a]                                         
 *                    | alu_carryin           
 *                   /y\     ___              
 * lastshift --------(((----|I0 |                    __                         
 * s_alu_carryin[0] -+||    |I1 |-- lastshift_dup --|  |-- rlastshift 
 * s_alu_carryin[1] --(+    |I2 |                   |  |                        
 *                    |     |I3_|                   >__|                        
 *                    | prealucyin            
 *                   /y\     ___    
 * FUNC7_0 ----------(((----|I0 |-- sra_msb   
 * raluF ------------+((----|I1 |   
 * ADR_O[31]----------(+----|I2 |   
 * FUNC7_5 -----------(-----|I3_|
 *                    |
 *                    VCC
 * 
 * FUNC7_5
 * |FUNC7_0  
 * ||         sra_msb
 * 00         0
 * 01         raluF
 * 10         ADR_O_31
 * 11         ADR_O_31
 * 
 * ADR_O[31]
 * |s_alu_carryin[1] 
 * ||s_alu_carryin[0]
 * |||  prealucyin   
 * x00  0            
 * 001  raluF        
 * 010  raluF        
 * 101  1 (not used)
 * 110  1 (not used)
 * x11  1            
 */

module m_alu_carryin  # ( parameter HIGHLEVEL = 1, MULDIV = 1 )   
   (
    input       clk, lastshift, raluF, FUNC7_5, ADR_O_31,
    input       mod_s_alu_1, s_alu_1,muldivregmsb,
    /* verilator lint_off UNUSED */
    input       FUNC7_0, 
    /* verilator lint_on UNUSED */
    input [1:0] s_alu_carryin,
    output      alu_carryin, sra_msb, rlastshift
    );
   
   wire [1:0]           mod_s_alu_carryin;
   wire                 mod_raluF;
   assign mod_s_alu_carryin = (mod_s_alu_1 ^ s_alu_1) ? 2'b00 : s_alu_carryin;
   assign mod_raluF  = s_alu_carryin[1] ? muldivregmsb : raluF;
   
   generate
      if ( HIGHLEVEL != 0 ) begin
         reg rrlastshift;
         always @(posedge clk)
           rrlastshift <= lastshift;
         assign rlastshift = rrlastshift;

         if ( MULDIV == 0 ) begin
            // Will be removed
            reg r_alu_carryin, r_sra_msb;
            always @(*) 
              case ( mod_s_alu_carryin )
                2'b00 : r_alu_carryin = 1'b0;
                2'b01 : r_alu_carryin = mod_raluF;
                2'b10 : r_alu_carryin = mod_raluF;
                2'b11 : r_alu_carryin = 1'b1;
              endcase
            always @(*) 
              r_sra_msb = FUNC7_5 ? ADR_O_31 : 1'b0;
            assign sra_msb = r_sra_msb;
            assign alu_carryin = r_alu_carryin;
         end else begin
            wire prealucyin;
            assign sra_msb = FUNC7_5 ? ADR_O_31 : (FUNC7_0 ? mod_raluF : 0);
            assign prealucyin = mod_raluF | ADR_O_31;
            assign alu_carryin = &mod_s_alu_carryin | (mod_s_alu_carryin[1] & prealucyin) | (mod_s_alu_carryin[0] & prealucyin);
         end
      end else begin
         
         wire prealucyin,dup_lastshift;
         bn_lcy4v_b #(.I(16'haaaa)) la(.o(dup_lastshift), .co(prealucyin),  .ci(1'b1),       .i({1'b0,1'b0,mod_raluF,lastshift}));
         bn_lcy4v_b #(.I(16'haa00)) lb(.o(sra_msb),       .co(alu_carryin), .ci(prealucyin), .i({FUNC7_5,mod_s_alu_carryin,ADR_O_31}));
         SB_DFF reglastshift( .Q(rlastshift), .C(clk), .D(dup_lastshift));
      end
      
   endgenerate
endmodule
