/* A Verilator model of SB_RAM40_4K 
 * Errors in my original code were discovered in August 2019. A __much superiour__
 * and lovely written simulation model is seen in Clifford Wolfs icestorm project 
 * (cells_sim.v). I want verilator access functions, so I here copy Mr Wolfs work, 
 * to whom I hope to give the credit due. This is essentially his code.
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
    WRITE_MODE = 0,
    READ_MODE  = 0 )
   (
    output reg [15:0] RDATA,
    /* verilator lint_off UNUSED */
    input [15:0]      MASK,
    input [15:0]      WDATA,
    input [10:0]      WADDR,
    input [10:0]      RADDR, 
    /* verilator lint_on UNUSED */
    input             RE,WE, WCLK, RCLK,RCLKE, WCLKE
    );

   // MODE 0:  256 x 16
   // MODE 1:  512 x 8
   // MODE 2: 1024 x 4
   // MODE 3: 2048 x 2

   wire [15:0]        WMASK_I;
   wire [15:0]        RMASK_I;

   reg [15:0]         RDATA_I;
   wire [15:0]        WDATA_I;

   generate
      case (WRITE_MODE)
	0: assign WMASK_I = MASK;
        
	1: assign WMASK_I = WADDR[   8] == 0 ? 16'b 1010_1010_1010_1010 :
			    WADDR[   8] == 1 ? 16'b 0101_0101_0101_0101 : 16'bx;
        
	2: assign WMASK_I = WADDR[ 9:8] == 0 ? 16'b 1110_1110_1110_1110 :
			    WADDR[ 9:8] == 1 ? 16'b 1101_1101_1101_1101 :
			    WADDR[ 9:8] == 2 ? 16'b 1011_1011_1011_1011 :
			    WADDR[ 9:8] == 3 ? 16'b 0111_0111_0111_0111 : 16'bx;
        
	3: assign WMASK_I = WADDR[10:8] == 0 ? 16'b 1111_1110_1111_1110 :
			    WADDR[10:8] == 1 ? 16'b 1111_1101_1111_1101 :
			    WADDR[10:8] == 2 ? 16'b 1111_1011_1111_1011 :
			    WADDR[10:8] == 3 ? 16'b 1111_0111_1111_0111 :
			    WADDR[10:8] == 4 ? 16'b 1110_1111_1110_1111 :
			    WADDR[10:8] == 5 ? 16'b 1101_1111_1101_1111 :
			    WADDR[10:8] == 6 ? 16'b 1011_1111_1011_1111 :
			    WADDR[10:8] == 7 ? 16'b 0111_1111_0111_1111 : 16'bx;
      endcase
      
      case (READ_MODE)
	0: assign RMASK_I = 16'b 0000_0000_0000_0000;
        
	1: assign RMASK_I = RADDR[   8] == 0 ? 16'b 1010_1010_1010_1010 :
			    RADDR[   8] == 1 ? 16'b 0101_0101_0101_0101 : 16'bx;
        
	2: assign RMASK_I = RADDR[ 9:8] == 0 ? 16'b 1110_1110_1110_1110 :
			    RADDR[ 9:8] == 1 ? 16'b 1101_1101_1101_1101 :
			    RADDR[ 9:8] == 2 ? 16'b 1011_1011_1011_1011 :
			    RADDR[ 9:8] == 3 ? 16'b 0111_0111_0111_0111 : 16'bx;
        
	3: assign RMASK_I = RADDR[10:8] == 0 ? 16'b 1111_1110_1111_1110 :
			    RADDR[10:8] == 1 ? 16'b 1111_1101_1111_1101 :
			    RADDR[10:8] == 2 ? 16'b 1111_1011_1111_1011 :
			    RADDR[10:8] == 3 ? 16'b 1111_0111_1111_0111 :
			    RADDR[10:8] == 4 ? 16'b 1110_1111_1110_1111 :
			    RADDR[10:8] == 5 ? 16'b 1101_1111_1101_1111 :
			    RADDR[10:8] == 6 ? 16'b 1011_1111_1011_1111 :
			    RADDR[10:8] == 7 ? 16'b 0111_1111_0111_1111 : 16'bx;
      endcase
      
      case (WRITE_MODE)
	0: assign WDATA_I = WDATA;
        
	1: assign WDATA_I = {WDATA[14], WDATA[14], WDATA[12], WDATA[12],
			     WDATA[10], WDATA[10], WDATA[ 8], WDATA[ 8],
			     WDATA[ 6], WDATA[ 6], WDATA[ 4], WDATA[ 4],
			     WDATA[ 2], WDATA[ 2], WDATA[ 0], WDATA[ 0]};
        
	2: assign WDATA_I = {WDATA[13], WDATA[13], WDATA[13], WDATA[13],
			     WDATA[ 9], WDATA[ 9], WDATA[ 9], WDATA[ 9],
			     WDATA[ 5], WDATA[ 5], WDATA[ 5], WDATA[ 5],
			     WDATA[ 1], WDATA[ 1], WDATA[ 1], WDATA[ 1]};
        
	3: assign WDATA_I = {WDATA[11], WDATA[11], WDATA[11], WDATA[11],
			     WDATA[11], WDATA[11], WDATA[11], WDATA[11],
			     WDATA[ 3], WDATA[ 3], WDATA[ 3], WDATA[ 3],
			     WDATA[ 3], WDATA[ 3], WDATA[ 3], WDATA[ 3]};
      endcase
      
      case (READ_MODE)
	0: assign RDATA = RDATA_I;
	1: assign RDATA = {1'b0, |RDATA_I[15:14], 1'b0, |RDATA_I[13:12], 1'b0, |RDATA_I[11:10], 1'b0, |RDATA_I[ 9: 8],
			   1'b0, |RDATA_I[ 7: 6], 1'b0, |RDATA_I[ 5: 4], 1'b0, |RDATA_I[ 3: 2], 1'b0, |RDATA_I[ 1: 0]};
	2: assign RDATA = {2'b0, |RDATA_I[15:12], 3'b0, |RDATA_I[11: 8], 3'b0, |RDATA_I[ 7: 4], 3'b0, |RDATA_I[ 3: 0], 1'b0};
	3: assign RDATA = {4'b0, |RDATA_I[15: 8], 7'b0, |RDATA_I[ 7: 0], 3'b0};
      endcase
   endgenerate
      
   integer            i;
   reg [15:0]         memory [0:255];
   
   initial begin
      for (i=0; i<16; i=i+1) begin
/* verilator lint_off INITIALDLY */
	 memory[ 0*16 + i] <= INIT_0[16*i +: 16];
	 memory[ 1*16 + i] <= INIT_1[16*i +: 16];
	 memory[ 2*16 + i] <= INIT_2[16*i +: 16];
	 memory[ 3*16 + i] <= INIT_3[16*i +: 16];
	 memory[ 4*16 + i] <= INIT_4[16*i +: 16];
	 memory[ 5*16 + i] <= INIT_5[16*i +: 16];
	 memory[ 6*16 + i] <= INIT_6[16*i +: 16];
	 memory[ 7*16 + i] <= INIT_7[16*i +: 16];
	 memory[ 8*16 + i] <= INIT_8[16*i +: 16];
	 memory[ 9*16 + i] <= INIT_9[16*i +: 16];
	 memory[10*16 + i] <= INIT_A[16*i +: 16];
	 memory[11*16 + i] <= INIT_B[16*i +: 16];
	 memory[12*16 + i] <= INIT_C[16*i +: 16];
	 memory[13*16 + i] <= INIT_D[16*i +: 16];
	 memory[14*16 + i] <= INIT_E[16*i +: 16];
	 memory[15*16 + i] <= INIT_F[16*i +: 16];
/* verilator lint_on INITIALDLY */
      end
   end

   always @(posedge WCLK) begin
      if (WE && WCLKE) begin
	 if (!WMASK_I[ 0]) memory[WADDR[7:0]][ 0] <= WDATA_I[ 0];
	 if (!WMASK_I[ 1]) memory[WADDR[7:0]][ 1] <= WDATA_I[ 1];
	 if (!WMASK_I[ 2]) memory[WADDR[7:0]][ 2] <= WDATA_I[ 2];
	 if (!WMASK_I[ 3]) memory[WADDR[7:0]][ 3] <= WDATA_I[ 3];
	 if (!WMASK_I[ 4]) memory[WADDR[7:0]][ 4] <= WDATA_I[ 4];
	 if (!WMASK_I[ 5]) memory[WADDR[7:0]][ 5] <= WDATA_I[ 5];
	 if (!WMASK_I[ 6]) memory[WADDR[7:0]][ 6] <= WDATA_I[ 6];
	 if (!WMASK_I[ 7]) memory[WADDR[7:0]][ 7] <= WDATA_I[ 7];
	 if (!WMASK_I[ 8]) memory[WADDR[7:0]][ 8] <= WDATA_I[ 8];
	 if (!WMASK_I[ 9]) memory[WADDR[7:0]][ 9] <= WDATA_I[ 9];
	 if (!WMASK_I[10]) memory[WADDR[7:0]][10] <= WDATA_I[10];
	 if (!WMASK_I[11]) memory[WADDR[7:0]][11] <= WDATA_I[11];
	 if (!WMASK_I[12]) memory[WADDR[7:0]][12] <= WDATA_I[12];
	 if (!WMASK_I[13]) memory[WADDR[7:0]][13] <= WDATA_I[13];
	 if (!WMASK_I[14]) memory[WADDR[7:0]][14] <= WDATA_I[14];
	 if (!WMASK_I[15]) memory[WADDR[7:0]][15] <= WDATA_I[15];
      end
   end
   
   always @(posedge RCLK) begin
      if (RE && RCLKE) begin
	 RDATA_I <= memory[RADDR[7:0]] & ~RMASK_I;
      end
   end

`ifdef verilator
   function [15:0] get_as_16;
      input [7:0]     adr;
      // verilator public
      get_as_16 = memory[adr];
   endfunction
  
   function [15:0] set_as_16;
      input [7:0]     adr;
      input [15:0]    data;
      // verilator public
      memory[adr] = data;
      set_as_16 = 0; // dummy
   endfunction

   function [7:0] get_as_8;
      input [8:0]     adr;
      // verilator public
      reg [15:0]      rmask_i = adr[8] ? 16'h5555 : 16'haaaa;
      reg [15:0]      d_i = memory[adr[7:0]] & ~rmask_i;
      get_as_8 = {|d_i[15:14], |d_i[13:12], |d_i[11:10], |d_i[9:8], |d_i[7:6], |d_i[5:4], |d_i[3:2], |d_i[1:0]};
   endfunction
   
   function [7:0] set_as_8;
      input [8:0]     adr;
      input [7:0]     d;
      // verilator public
      reg [15:0]      wdata_i = {{2{d[7]}},{2{d[6]}},{2{d[5]}},{2{d[4]}},{2{d[3]}},{2{d[2]}},{2{d[1]}},{2{d[0]}}};
      reg [15:0]      wmask_i = adr[8] ? 16'h5555 : 16'haaaa;
      memory[adr[7:0]] = (~wmask_i & wdata_i) | (wmask_i & memory[adr[7:0]]);
      set_as_8 = 0; // dummy
   endfunction

   function [3:0] get_as_4;
      input [9:0]     adr;
      // verilator public
      reg [15:0]      rmask_i = adr[9] ? (adr[8] ? 16'h7777 : 16'hbbbb) : (adr[8] ? 16'hdddd : 16'heeee);
      reg [15:0]      d_i = memory[adr[7:0]] & ~rmask_i;
      get_as_4 = {|d_i[15:12], |d_i[11:8], |d_i[7:4], |d_i[3:0]};
   endfunction
   
   function [3:0] set_as_4;
      input [9:0]     adr;
      input [3:0]     d;
      // verilator public
      reg [15:0]      wdata_i = {{4{d[3]}},{4{d[2]}},{4{d[1]}},{4{d[0]}}};
      reg [15:0]      wmask_i = adr[9] ? (adr[8] ? 16'h7777 : 16'hbbbb) : (adr[8] ? 16'hdddd : 16'heeee);
      memory[adr[7:0]] = (~wmask_i & wdata_i) | (wmask_i & memory[adr[7:0]]);
      set_as_4 = 0; // dummy
   endfunction
   
   function [1:0] get_as_2;
      input [10:0]    adr;
      // verilator public
      reg [15:0]      rmask_i = adr[10] ?
                      (adr[9] ? (adr[8] ? 16'h7f7f : 16'hbfbf) : (adr[8] ? 16'hdfdf : 16'hefef)) :
                      (adr[9] ? (adr[8] ? 16'hf7f7 : 16'hfbfb) : (adr[8] ? 16'hfdfd : 16'hfefe));
      reg [15:0]      d_i = memory[adr[7:0]] & ~rmask_i;
      get_as_2 = {|d_i[15:8], |d_i[7:0]};
   endfunction
   
   function [1:0] set_as_2;
      input [10:0]    adr;
      input [1:0]     d;
      // verilator public
      reg [15:0]      wdata_i = {{8{d[1]}},{8{d[0]}}};
      reg [15:0]      wmask_i = adr[10] ?
                      (adr[9] ? (adr[8] ? 16'h7f7f : 16'hbfbf) : (adr[8] ? 16'hdfdf : 16'hefef)) :
                      (adr[9] ? (adr[8] ? 16'hf7f7 : 16'hfbfb) : (adr[8] ? 16'hfdfd : 16'hfefe));
      memory[adr[7:0]] = (~wmask_i & wdata_i) | (wmask_i & memory[adr[7:0]]);
      set_as_2 = 0; // dummy
   endfunction
   
`endif


endmodule
// Local Variables:
// verilog-library-directories:("." )
// verilog-library-extensions:(".v" )
// verilog-library-extensions:(".sv" )
// End:
