/* A Verilator model -- incomplete and with errors
 */
module SB_SPRAM256KA
  (
   input [15:0]      DATAIN,
   input [13:0]      ADDRESS,
   input [3:0]       MASKWREN,
   input             WREN,CLOCK,CHIPSELECT,POWEROFF,STANDBY,SLEEP,
   output reg [15:0] DATAOUT,
   output [15:0]     preDATAOUT
   );
   reg [15:0]    mem[(1<<14)-1:0];

`ifdef verilator
   function [15:0] get_as_16;
      input [13:0] adr;
      // verilator public
      get_as_16 = mem[adr];
   endfunction

   function [15:0] set_as_16;
      input [13:0] adr;
      input [15:0] data;
      // verilator public
      mem[adr] = data;
      set_as_16 = mem[adr];
   endfunction   
`endif
   
   always @(posedge CLOCK) begin
      if ( POWEROFF == 1'b0 || SLEEP == 1'b1 || STANDBY == 1'b1 || CHIPSELECT == 1'b0) begin
         // Laugh or cry. POWEROFF==0 mean POWER OFF. POWEROFF==1 mean POWER ON
         DATAOUT <= 16'hdead;
      end else begin
         DATAOUT <= mem[ADDRESS];
         if ( WREN ) begin
            if ( (MASKWREN & 4'h1) != 4'h0 ) 
              mem[ADDRESS][3:0] <= DATAIN[3:0];
            if ( (MASKWREN & 4'h2) != 4'h0 )
              mem[ADDRESS][7:4] <= DATAIN[7:4];
            if ( (MASKWREN & 4'h4) != 4'h0 )
              mem[ADDRESS][11:8] <= DATAIN[11:8];
            if ( (MASKWREN & 4'h8) != 4'h0 )
              mem[ADDRESS][15:12] <= DATAIN[15:12];
         end
      end
   end

   assign preDATAOUT = mem[ADDRESS]; // Only for simulating a 0-delay SRAM
endmodule
