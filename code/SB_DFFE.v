/* A Verilator model
 */
module SB_DFFE
  ( input C,E,D,
    output reg Q
    );
   initial
     Q = 1'b0;
   always @(posedge C)
     if ( E )
       Q <= D;
endmodule

  
