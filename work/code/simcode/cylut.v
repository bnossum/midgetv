module cylut
  # ( parameter v=16'h0 )
   (
    input       CI,
    input [2:0] I,
    output      CO,O
    );
   SB_LUT4 #(.LUT_INIT(v)) cmb( .O(O), .I3(I[3]), .I2(I[2]), .I1(I[1]), .I0(I[0]) );
   SB_CARRY cy(               .CO(CO), .CI(CI),   .I1(I[2]), .I0(I[1]));
   
endmodule
