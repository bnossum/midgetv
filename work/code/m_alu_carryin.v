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
 * 
 */

module m_alu_carryin  # ( parameter HIGHLEVEL = 0 )   
   (
    input        clk, lastshift, raluF, FUNC7_5, ADR_O_31,
    input [1:0]  s_alu_carryin,
    output       alu_carryin, sra_msb, rlastshift
    );
   
   generate
      if ( HIGHLEVEL != 0 ) begin
         reg r_alu_carryin, r_sra_msb;
         always @(/*AS*/raluF or s_alu_carryin) 
           case ( s_alu_carryin )
             2'b00 : r_alu_carryin = 1'b0;
             2'b01 : r_alu_carryin = raluF;
             2'b10 : r_alu_carryin = raluF;
             2'b11 : r_alu_carryin = 1'b1;
           endcase
         always @(/*AS*/ADR_O_31 or FUNC7_5) 
           r_sra_msb = FUNC7_5 ? ADR_O_31 : 1'b0;
         assign sra_msb = r_sra_msb;
         assign alu_carryin = r_alu_carryin;
         reg rrlastshift;
         always @(posedge clk)
           rrlastshift <= lastshift;
         assign rlastshift = rrlastshift;
      end else begin
         
         wire prealucyin,dup_lastshift;
         bn_lcy4v_b #(.I(16'haaaa)) la(.o(dup_lastshift), .co(prealucyin),  .ci(1'b1),       .i({1'b0,1'b0,raluF,lastshift}));
         bn_lcy4v_b #(.I(16'haa00)) lb(.o(sra_msb),       .co(alu_carryin), .ci(prealucyin), .i({FUNC7_5,s_alu_carryin,ADR_O_31}));
         SB_DFF reglastshift( .Q(rlastshift), .C(clk), .D(dup_lastshift));
      end
      
   endgenerate
endmodule
