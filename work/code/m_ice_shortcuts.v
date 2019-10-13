/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Constructs to try to get cleaner code
 */
/* verilator lint_off DECLFILENAME */
module bn_l4
  # ( parameter I = 16'h0 )
   (
    input  i0,i1,i2,i3,
    output o
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i3), .I2(i2), .I1(i1), .I0(i0));
endmodule

module bn_lcy4
  # ( parameter I = 16'h0 )
   (
    input  i0,i1,i2,i3,
    output o,co
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i3), .I2(i2), .I1(i1), .I0(i0));
   SB_CARRY y(.CO(co),              .CI(i3), .I1(i2), .I0(i1));
endmodule

module bn_lcy4_b
  # ( parameter I = 16'h0 )
   (
    input  i0,i1,i2,i3,ci,
    output o,co
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i3), .I2(i2), .I1(i1), .I0(i0));
   SB_CARRY y(.CO(co),              .CI(ci), .I1(i2), .I0(i1));
endmodule

module bn_l4v
  # ( parameter I = 16'h0 )
   (
    input [3:0] i,
    output      o
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i[3]), .I2(i[2]), .I1(i[1]), .I0(i[0]));
endmodule

module bn_lcy4v
  # ( parameter I = 16'h0 )
   (
    input [3:0] i,
    output      o,co
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i[3]), .I2(i[2]), .I1(i[1]), .I0(i[0]));
   SB_CARRY y(.CO(co),              .CI(i[3]), .I1(i[2]), .I0(i[1]));
endmodule

module bn_lcy4v_b
  # ( parameter I = 16'h0 )
   (
    input [3:0] i,
    input       ci,
    output      o,co
    );
   SB_LUT4 #(.LUT_INIT(I)) l(.O(o), .I3(i[3]), .I2(i[2]), .I1(i[1]), .I0(i[0]));
   SB_CARRY y(.CO(co),              .CI(ci),   .I1(i[2]), .I0(i[1]));
endmodule

