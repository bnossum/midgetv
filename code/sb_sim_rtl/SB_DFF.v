/* A Verilator model
 */
module SB_DFF
  ( input C,D,
    output reg Q
    );
   initial
     Q = 1'b0;   
   always @(posedge C)
       Q <= D;
endmodule

  
