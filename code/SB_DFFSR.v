/* A Verilator model
 */
module SB_DFFSR
  ( input C,D,R,
    output reg Q
    );
   initial
     Q = 1'b0;
   always @(posedge C)
     Q <= R ? 1'b0 : D;
endmodule

  
