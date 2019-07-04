/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This is a 5-bit down counter.
 * 
 */
module m_shiftcounter
  # ( parameter HIGHLEVEL = 1 )   
   (
    input       clk,
    input       sa18,sa19,
    input [4:0] B,
    output      lastshift,
    output      r_issh0
    );
`ifdef verilator
   wire [4:0]   dbg_shiftcnt;
   function [4:0] get_shiftcnt;
      // verilator public
      get_shiftcnt = dbg_shiftcnt;
   endfunction
`endif
   
   generate
      if ( HIGHLEVEL ) begin

         reg [4:0]    rshcnt;
         reg          rr_issh0;
         reg [5:0]   shcnt;

         always @(/*AS*/B or rshcnt or sa18 or sa19) begin
            case ( {sa19,sa18} )
              2'b00 : shcnt = {1'b0,B[4:0]};
              2'b10 : shcnt = {1'b0,B[1:0],3'b000};
              2'b01 : shcnt = {1'b0,rshcnt}+6'b011111 + {5'b00000,sa19};
              2'b11 : shcnt = {1'b0,rshcnt}+6'b011111 + {5'b00000,sa19};
            endcase      
         end

         assign lastshift = ~shcnt[5] & sa18;
         always @(posedge clk) begin
            rr_issh0 <= lastshift;
            rshcnt <= shcnt[4:0];
         end
         assign r_issh0 = rr_issh0;
`ifdef verilator
         assign dbg_shiftcnt = rshcnt[4:0];
`endif            
      end else begin
/*
 *
 *                        +-------- lastshift = ~shcy[4] & sa18. The cycle we are loading the counter is not the last shift..
 *                  ___   |  ___  
 *                 |I0 |  | |I0 | lastshift_dup  __                
 *                 |I1 |--+-|I1-|---------------|  |-- r_issh0
 *        sa18 ----|I2 |    |I2 |               |  |               
 *              +--|I3_|    |I3_|               >__|               
 *              |shcy[4]
 *             /y\  ___
 *  d4   ------(((-|I0 |     __
 *  sa18 ------+((-|I1 |----|  |-- rshcnt[4]
 *  rshcnt[4] --(+-|I2 |    |  |
 *              +--|I3_|    >__|               
 *              |shcy[3]
 *             /y\  ___
 *  d3   ------(((-|I0 |     __
 *  sa18 ------+((-|I1 |----|  |-- rshcnt[3]
 *  rshcnt[3] --(+-|I2 |    |  |
 *              +--|I3_|    >__|
 *              |shcy[2]
 *             /y\  ___
 *  d2   ------(((-|I0 |     __
 *  sa18 ------+((-|I1 |----|  |-- rshcnt[2]
 *  rshcnt[2] --(+-|I2 |    |  |
 *              +--|I3_|    >__|
 *              |shcy[1]
 *             /y\  ___
 *  d1   ------(((-|I0 |     __
 *  sa18 ------+((-|I1 |----|  |-- rshcnt[1]
 *  rshcnt[1] --(+-|I2 |    |  |
 *              +--|I3_|    >__|
 *              |shcy[0]
 *             /y\  ___
 *  sa18 ------(((-|I0 |     __
 *  sa19 ------+((-|I1 |----|  |-- rshcnt[0]
 *  rshcnt[0] --(+-|I2 |    |  |
 *  B[0] -------(--|I3_|    >__|
 *              |
 *              vcc
 * 
 *            ___ 
 *  B[1] ----|I0 |-- d1 = ~sa19 & B[1]
 *  sa19 ----|I1 |
 *       ----|I2 |
 *       ----|I3_|
 * 
 *            ___ 
 *  B[2] ----|I0 |-- d2 = ~sa19 & B[2]
 *  sa19 ----|I1 |
 *       ----|I2 |
 *       ----|I3_|
 * 
 *            ___ 
 *  B[3] ----|I0 |-- d3 = (~sa19 & B[3]) | sa19 & B[0]
 *  B[0] ----|I1 |
 *  sa19 ----|I2 |
 *       ----|I3_|
 * 
 *            ___ 
 *  B[4] ----|I0 |-- d4 = (~sa19 & B[4]) | sa19 & B[1]
 *  B[1] ----|I1 |
 *  sa19 ----|I2 |
 *       ----|I3_|
 * 
 */
         wire [4:0] rshcnt;
         wire       d1,d2,d3,d4;
         wire       shcnt0,shcnt1,shcnt2,shcnt3,shcnt4;
         wire       shcy0,shcy1,shcy2,shcy3,shcy4;
         wire       lastshift_dup;
         
         SB_LUT4 #(.LUT_INIT(16'h2222)) cmb_d1( .O(d1), .I3(1'b0), .I2(1'b0), .I1(sa19), .I0(B[1]));
         SB_LUT4 #(.LUT_INIT(16'h2222)) cmb_d2( .O(d2), .I3(1'b0), .I2(1'b0), .I1(sa19), .I0(B[2]));
         SB_LUT4 #(.LUT_INIT(16'hcaca)) cmb_d3( .O(d3), .I3(1'b0), .I2(sa19), .I1(B[0]), .I0(B[3]));
         SB_LUT4 #(.LUT_INIT(16'hcaca)) cmb_d4( .O(d4), .I3(1'b0), .I2(sa19), .I1(B[1]), .I0(B[4]));

         SB_LUT4 #(.LUT_INIT(16'h9382)) cmb_shcnt0( .O(shcnt0), .I3(B[0]),  .I2(rshcnt[0]), .I1(sa19), .I0(sa18));
         SB_LUT4 #(.LUT_INIT(16'he22e)) cmb_shcnt1( .O(shcnt1), .I3(shcy0), .I2(rshcnt[1]), .I1(sa18), .I0(d1));
         SB_LUT4 #(.LUT_INIT(16'he22e)) cmb_shcnt2( .O(shcnt2), .I3(shcy1), .I2(rshcnt[2]), .I1(sa18), .I0(d2));
         SB_LUT4 #(.LUT_INIT(16'he22e)) cmb_shcnt3( .O(shcnt3), .I3(shcy2), .I2(rshcnt[3]), .I1(sa18), .I0(d3));
         SB_LUT4 #(.LUT_INIT(16'he22e)) cmb_shcnt4( .O(shcnt4), .I3(shcy3), .I2(rshcnt[4]), .I1(sa18), .I0(d4));
         
         SB_CARRY cmbcy0( .CO(shcy0), .CI(1'b1),  .I1(rshcnt[0]), .I0(sa19));
         SB_CARRY cmbcy1( .CO(shcy1), .CI(shcy0), .I1(rshcnt[1]), .I0(sa18));
         SB_CARRY cmbcy2( .CO(shcy2), .CI(shcy1), .I1(rshcnt[2]), .I0(sa18));
         SB_CARRY cmbcy3( .CO(shcy3), .CI(shcy2), .I1(rshcnt[3]), .I0(sa18));
         SB_CARRY cmbcy4( .CO(shcy4), .CI(shcy3), .I1(rshcnt[4]), .I0(sa18));

         SB_LUT4 #(.LUT_INIT(16'h00f0)) cmb_lastshift( .O(lastshift), .I3(shcy4), .I2(sa18), .I1(1'b0), .I0(1'b0));
         SB_LUT4 #(.LUT_INIT(16'hff00)) cmb_wasted( .O(lastshift_dup), .I3(lastshift), .I2(1'b0), .I1(1'b0), .I0(1'b0));
         SB_DFF issh0_reg( .Q(r_issh0), .C(clk), .D(lastshift_dup));

         SB_DFF reg_shcnt0( .Q(rshcnt[0]), .C(clk), .D(shcnt0));
         SB_DFF reg_shcnt1( .Q(rshcnt[1]), .C(clk), .D(shcnt1));
         SB_DFF reg_shcnt2( .Q(rshcnt[2]), .C(clk), .D(shcnt2));
         SB_DFF reg_shcnt3( .Q(rshcnt[3]), .C(clk), .D(shcnt3));
         SB_DFF reg_shcnt4( .Q(rshcnt[4]), .C(clk), .D(shcnt4));
`ifdef verilator
         assign dbg_shiftcnt = rshcnt[4:0];
`endif         
      end
   endgenerate
endmodule
