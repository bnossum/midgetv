/* A Verilator model
 */
module SB_CARRY
  ( input  CI,I1,I0,
    output CO
    );
   // assign CO =  (CI&I1) | (CI&I0) | (I1&I0);  
   // At one stage the above gave UNOPTFLAT warnings in Verilator for unknown reasons.
   // The below is a tested alternative   
   SB_LUT4 #(.LUT_INIT(16'hfcc0)) cy(.O(CO), .I3(CI), .I2(I1), .I1(I0), .I0(1'b0));
endmodule

