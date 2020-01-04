module m_cylut
  # ( parameter v=16'h0 )
   (
    input  CI,
    input  I0,I1,I2,I3,
    output CO,O
    );
   SB_LUT4 #(.LUT_INIT(v)) cmb( .O(O), .I3(I3), .I2(I2), .I1(I1), .I0(I0) );
   SB_CARRY cy(               .CO(CO), .CI(CI), .I1(I2), .I0(I1));
   
endmodule
