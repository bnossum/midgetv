/* A Verilator model
 */
module SB_DFFESR
  ( input C,E,D,R,
    output reg Q
    );
   initial
     Q = 1'b0;
   always @(posedge C)
     if ( E )
       Q <= R ? 1'b0 : D;
endmodule

  
