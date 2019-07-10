/* A Verilator model -- incomplete 
 */
module SB_RAM40_4K 
  #(parameter
    INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000,
    WRITE_MODE = 0,READ_MODE  = 0,
    DEBUG = 0)
   (
    output reg [15:0] RDATA,
    output [15:0]     sim_pre_RDATA,
    input [15:0]      WDATA,MASK,
    input [10:0]      WADDR,RADDR, 
    input             RE,WE, WCLK, RCLK,RCLKE, WCLKE
    );
   //                                     WRITE_MODE           0  1  2  3
   localparam write_data_width = (1<<(4-WRITE_MODE));     //  16  8  4  2
   localparam write_shiftmask  = ((1<<WRITE_MODE)-1);     //   0  1  3  7
   localparam stmp             = (((1<<write_data_width))-1);
   //                                     READ_MODE            0  1  2  3
   localparam read_data_width  = (1<<(4-READ_MODE));      //  16  8  4  2
   localparam read_shiftmask   = ((1<<READ_MODE)-1);      //   0  1  3  7
   reg [15:0]         mem[255:0];
   reg [255:0]        v;
   integer            i;
   integer            j;
   reg [15:0]         towrite_in_most_modes;
   reg [15:0]         towrite_in_mode_0;
/* verilator lint_off UNUSED */
   reg [10:0]         adrtowriteto;
   reg [10:0]         adrtoreadfrom;
/* verilator lint_on UNUSED */

`ifdef verilator
   function [15:0] get_as_16;
      input [7:0]     adr;
      // verilator public
      get_as_16 = mem[adr];
   endfunction

   function [15:0] set_as_16;
      input [7:0]     adr;
      input [15:0]    data;
      // verilator public
      mem[adr] = data;
      set_as_16 = mem[adr];
   endfunction
             
`endif
   
   initial begin
      for ( i = 0; i < 16; i = i + 1 )
        begin
           case ( i )
             0  : v = INIT_0; 1  : v = INIT_1; 2  : v = INIT_2; 3  : v = INIT_3;
             4  : v = INIT_4; 5  : v = INIT_5; 6  : v = INIT_6; 7  : v = INIT_7;
             8  : v = INIT_8; 9  : v = INIT_9; 10 : v = INIT_A; 11 : v = INIT_B;
             12 : v = INIT_C; 13 : v = INIT_D; 14 : v = INIT_E; 15 : v = INIT_F;
           endcase
           for ( j = 0; j < 16; j = j + 1 )
             begin
                mem[(i<<4)+j] = v[15:0];
                v[239:0] = v[255:16];
               end
        end
      RDATA = {16'hx}; // Latches of RAM4k unknown at startup, but they do have a value
   end

   assign adrtowriteto   = WADDR>>WRITE_MODE;
   assign adrtoreadfrom  = RADDR>>READ_MODE;
   
   assign towrite_in_most_modes 
     = ( (  mem[adrtowriteto[7:0]] & ~(stmp <<  ((WADDR & write_shiftmask) * write_data_width)))
         |(  WDATA << ((WADDR & write_shiftmask) * write_data_width)) );

   assign towrite_in_mode_0
     = ( ( mem[WADDR[7:0]] & MASK ) | (  WDATA & ~MASK  ));

   always @(posedge WCLK) begin // Write memory.
      //$display( "WCLKE=%d WE=%d", WCLKE, WE );
      
      if (WCLKE && WE) begin
         //$display( "PIP" );
         mem[adrtowriteto[7:0]] <= WRITE_MODE == 0 ? towrite_in_mode_0 : towrite_in_most_modes;
      end 
   end
   
   always @(posedge RCLK) // Read memory.
     if (RCLKE && RE) 
        RDATA <= ( mem[adrtoreadfrom[7:0]] >> ( (RADDR & read_shiftmask) * read_data_width) );

   assign sim_pre_RDATA = mem[adrtoreadfrom[7:0]] >> ( (RADDR & read_shiftmask) * read_data_width);
   
//   assign killwarnings = &adrtoreadfrom | &adrtowriteto; 
endmodule
// Local Variables:
// verilog-library-directories:("." )
// verilog-library-extensions:(".v" )
// verilog-library-extensions:(".sv" )
// End:
