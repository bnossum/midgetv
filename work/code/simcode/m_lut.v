module m_lut
  # ( parameter v=16'h0 )
   (
    input  I0,I1,I2,I3,
    output O
    );
   SB_LUT4 #(.LUT_INIT(v)) cmb( .O(O), .I3(I3), .I2(I2), .I1(I1), .I0(I0) );
   
endmodule
