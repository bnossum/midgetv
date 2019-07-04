/* A Verilator model. 
 * A note to self. At one stage I did this terribly wrong,
 * assign O = ( (LUT_INIT >> ((I3<<3)+(I2<<2)+(I1<<1)+(I0<<0))) & 16'h0001) == 16'h0 ? 1'b0 : 1'b1;
 * I believe this fails because, for example, I3 is a 1-bit signal so (I3<<3) == 0 always.
 */
module SB_LUT4 # ( parameter LUT_INIT = 16'h0 ) 
   ( 
     input  I3,I2,I1,I0,
     output O
     );
   assign O = ( (LUT_INIT >> {I3,I2,I1,I0}) & 16'h1) == 16'h0 ? 1'b0 : 1'b1;
endmodule

  
