/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * midgetv has no barrel shifter, shifting is done in microcode.
 * Here is the logic for the shift counter - a 5-bit down counter. 
 * 
 * This module also give a 1'b1 on a carry chain, to save one LUT in the ALU
 * (probably due to routing constraints).
 *
 * s_shift[1:0]
 * ||B[1:0]
 * ||||         Action      Loadval
 * 00xx         Load        B[4:0]   
 * 0100         Load        00000    
 * 0101         Load        01000
 * 0110         Load        10000
 * 0111         Load        11000
 * 10xx         Count down
 * 11xx         Hold
 * 
 * HIGHLEVEL   Size in SB_LUT4s:
 * 0           11            
 * 1           13 (Lattice LSE)
 *             15 (Synplify Pro)
 */
module m_shiftcounter
  # ( parameter HIGHLEVEL = 0 )   
   (
    input        clk, //          System clock
    input [1:0]  s_shift, //     Operation
    input [4:0]  B, //            For initial value
    output       lastshift, //    Counter decrements to zero
    output [4:0] dbg_rshcnt  //   
    );
   
   generate
      if ( HIGHLEVEL ) begin
         
         reg [4:0] rshcnt;
         reg       rr_lastshift;
         reg [5:0] shcnt;
         
         always @(/*AS*/B or rshcnt or s_shift) begin
            case ( s_shift )
              2'b00 : shcnt = {1'b0,B[4:0]};
              2'b01 : shcnt = {1'b0,B[1:0],3'b000};
              2'b10 : shcnt = {1'b0,rshcnt}+6'b011111 + {5'b00000,s_shift[0]};
              2'b11 : shcnt = {1'b0,rshcnt}+6'b011111 + {5'b00000,s_shift[0]};
            endcase      
         end

         assign lastshift = ~shcnt[5] & s_shift[1];
         always @(posedge clk) 
           rshcnt <= shcnt[4:0];
         assign dbg_rshcnt = rshcnt[4:0];
      end else begin


         /*
          *                       
          *                      
          *                                
          *                          ___    
          *         s_shift[1] -----|I0 |   
          *                vcc ---- |I1 |---------- lastshift = ~shcy[4] & s_shift[1]. The cycle we are loading the counter is not the last shift.
          *                vcc ---- |I2 |    
          *                      +--|I3_|    
          *                      |shcy[4]
          *                     /y\  ___
          *          d[3] ------(((-|I0 |     __
          *    s_shift[1] ------+((-|I1 |----|  |-- rshcnt[4]
          *          rshcnt[4] --(+-|I2 |    |  |
          *                      +--|I3_|    >__|               
          *                      |shcy[3]
          *                     /y\  ___
          *          d[2] ------(((-|I0 |     __
          *    s_shift[1] ------+((-|I1 |----|  |-- rshcnt[3]
          *          rshcnt[3] --(+-|I2 |    |  |
          *                      +--|I3_|    >__|
          *                      |shcy[2]
          *                     /y\  ___
          *          d[1] ------(((-|I0 |     __
          *    s_shift[1] ------+((-|I1 |----|  |-- rshcnt[2]
          *          rshcnt[2] --(+-|I2 |    |  |
          *                      +--|I3_|    >__|
          *                      |shcy[1]
          *                     /y\  ___
          *          d[0] ------(((-|I0 |     __
          *    s_shift[1] ------+((-|I1 |----|  |-- rshcnt[1]
          *          rshcnt[1] --(+-|I2 |    |  |
          *                      +--|I3_|    >__|
          *                      |shcy[0]
          *                     /y\  ___
          *    s_shift[1] ------(((-|I0 |     __
          *    s_shift[0] ------+((-|I1 |----|  |-- rshcnt[0]
          *          rshcnt[0] --(+-|I2 |    |  |
          *          B[0] -------(--|I3_|    >__|
          *                      |
          *                      vcc
          *         
          *                          ___ 
          *                B[1] ----|I0 |-- d1 = ~s_shift[0] & B[1]
          *          s_shift[0] ----|I1 |
          *                     ----|I2 |
          *                     ----|I3_|
          *               
          *                          ___ 
          *                B[2] ----|I0 |-- d2 = ~s_shift[0] & B[2]
          *          s_shift[0] ----|I1 |
          *                     ----|I2 |
          *                     ----|I3_|
          *               
          *                          ___ 
          *                B[3] ----|I0 |-- d3 = (~s_shift[0] & B[3]) | s_shift[0] & B[0]
          *                B[0] ----|I1 |
          *          s_shift[0] ----|I2 |
          *                     ----|I3_|
          *               
          *                          ___ 
          *                B[4] ----|I0 |-- d4 = (~s_shift[0] & B[4]) | s_shift[0] & B[1]
          *                B[1] ----|I1 |
          *          s_shift[0] ----|I2 |
          *                     ----|I3_|
          *       
          */
         wire [4:0] rshcnt,shcnt;
         wire [3:0] d;
         /* verilator lint_off UNOPTFLAT */
         wire [4:0] shcy;
         /* verilator lint_on UNOPTFLAT */
         
         bn_l4 #(.I(16'h2222)) cmb_d21 [1:0] ( .o(d[1:0]), .i3(1'b0), .i2(1'b0), .i1(s_shift[0]),   .i0(B[2:1]));
         bn_l4 #(.I(16'hcaca)) cmb_d43 [1:0] ( .o(d[3:2]), .i3(1'b0), .i2(s_shift[0]), .i1(B[1:0]), .i0(B[4:3]));

         bn_lcy4_b #(.I(16'h9382)) cmb_shcnt0        (.o(shcnt[0]),   .co(shcy[0]),  .ci(1'b1), .i3(B[0]),      .i2(rshcnt[0]),   .i1(s_shift[0]), .i0(s_shift[1]));
         bn_lcy4   #(.I(16'he22e)) cmb_shcnt41 [3:0] (.o(shcnt[4:1]), .co(shcy[4:1]),           .i3(shcy[3:0]), .i2(rshcnt[4:1]), .i1(s_shift[1]), .i0(d[3:0]));
         bn_l4   #(.I(16'h00aa)) cmb_lastshift     (.o(lastshift),  .i3(shcy[4]),   .i2(1'b1),        .i1(1'b1),          .i0(s_shift[1]));

         SB_DFF reg_shcnt40 [4:0] ( .Q(rshcnt[4:0]), .C(clk), .D(shcnt[4:0]));
         assign dbg_rshcnt = rshcnt[4:0];
      end
   endgenerate
endmodule
