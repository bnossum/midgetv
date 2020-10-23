/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Simply 3 EBRs used as a ROM for control equations. We could in theory use 
 * logic instead but that is a terrible idea. Note. Verilator not able to 
 * simulate this theoretic case either.
 */
module m_3ebr
  # (  parameter UCODETYPE = 0, EXPERIMENT_AVOID_EBR = 0 )
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   
`include "../generated/ucodeinitval.hv"

   generate
      if ( EXPERIMENT_AVOID_EBR != 1 ) begin
`ifdef verilator
         /* verilator lint_off UNUSED */
         wire [15:0]   sim_a;
         wire [15:0]   sim_b;
         wire [15:0]   sim_c;
         /* verilator lint_on UNUSED */
`endif
         
         SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                         .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                         .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                         .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                         .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                         ) ucode0
           (
            .RDATA( d[15:0]             ),
            .RADDR( {3'h0,minx}         ),
            .RCLK(  clk                 ),
            .RCLKE( 1'b1                ),
            .RE(    progress_ucode      ),
            .WADDR( 11'h0               ),
            .WCLK(  1'b0                ),
            .WCLKE( 1'b0                ),
            .WDATA( 16'h0               ),
            .WE(    1'b0                ),
            .MASK(  16'h0               )
            );
         
         SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                         .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                         .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                         .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                         .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                         ) ucode1
           (
            .RDATA( d[31:16]            ),
            .RADDR( {3'h0,minx}         ),
            .RCLK(  clk                 ),
            .RCLKE( 1'b1                ),
            .RE(    progress_ucode      ),
            .WADDR( 11'h0               ),
            .WCLK(  1'b0                ),
            .WCLKE( 1'b0                ),
            .WDATA( 16'h0               ),
            .WE(    1'b0                ),
            .MASK(  16'h0               )
            );
         
         SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                         .INIT_0(u2_0), .INIT_1(u2_1), .INIT_2(u2_2), .INIT_3(u2_3),
                         .INIT_4(u2_4), .INIT_5(u2_5), .INIT_6(u2_6), .INIT_7(u2_7),
                         .INIT_8(u2_8), .INIT_9(u2_9), .INIT_A(u2_A), .INIT_B(u2_B),
                         .INIT_C(u2_C), .INIT_D(u2_D), .INIT_E(u2_E), .INIT_F(u2_F)
                         ) ucode2
           (
            .RDATA( d[47:32]            ),
            .RADDR( {3'h0,minx}         ),
            .RCLK(  clk                 ),
            .RCLKE( 1'b1                ),
            .RE(    progress_ucode      ),
            .WADDR( 11'h0               ),
            .WCLK(  1'b0                ),
            .WCLKE( 1'b0                ),
            .WDATA( 16'h0               ),
            .WE(    1'b0                ),
            .MASK(  16'h0               )
            );
      end else begin

         /* Purely an experiment. What would happen if we used logic instead of EBR
          * for the control equations?
          * The iceblink example that compiles to 247 SB_LUTS, 4 EBRs here compiles to
          * 1101 LUTs, 2 EBRs, speed 45 MHz  (Lattice LSE).
          * 1175 LUTs, 2 EBRs, speed ? MHz (Synplify Pro, placement failed).
          */
         genvar k;
         wire [47:0] cmb /* synthesis syn_romstyle = "logic" */;
         reg [47:0]  thereg /* synthesis syn_romstyle = "logic" */;
         localparam [4095:0] param_u0 = {u0_F,u0_E,u0_D,u0_C,u0_B,u0_A,u0_9,u0_8,u0_7,u0_6,u0_5,u0_4,u0_3,u0_2,u0_1,u0_0};
         localparam [4095:0] param_u1 = {u1_F,u1_E,u1_D,u1_C,u1_B,u1_A,u1_9,u1_8,u1_7,u1_6,u1_5,u1_4,u1_3,u1_2,u1_1,u1_0};
         localparam [4095:0] param_u2 = {u2_F,u2_E,u2_D,u2_C,u2_B,u2_A,u2_9,u2_8,u2_7,u2_6,u2_5,u2_4,u2_3,u2_2,u2_1,u2_0};
         for ( k = 0; k < 16; k = k + 1 ) begin
            assign cmb[k+ 0] = ((param_u0 >> minx) >> k) & 1'b1;
            assign cmb[k+16] = ((param_u1 >> minx) >> k) & 1'b1;
            assign cmb[k+32] = ((param_u2 >> minx) >> k) & 1'b1;
         end
         always @(posedge clk) begin
            if ( progress_ucode )
              thereg <= cmb;
         end
         assign d = thereg;
      end
   endgenerate
endmodule
// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-extensions:(".v" )
// End:
