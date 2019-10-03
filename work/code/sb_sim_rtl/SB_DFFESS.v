/* A Verilator model
 */
module SB_DFFESS
  ( input C,E,D,S,
    output reg Q
    );
   initial
     Q = 1'b0;
   always @(posedge C)
     if ( E )
       Q <= S ? 1'b1 : D;
endmodule

  
