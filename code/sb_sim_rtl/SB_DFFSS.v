/* A Verilator model
 */
module SB_DFFSS
  ( input C,D,S,
    output reg Q
    );
   initial
     Q = 1'b0;
   always @(posedge C)
       Q <= S ? 1'b1 : D;
endmodule

  
