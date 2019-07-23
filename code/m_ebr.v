/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * EBR holds constants, registers, and code. This is a wrapper,
 * EBRADRWIDTH  EBRs  Organization   Gives     Capacity  WRITE/READ mode
 *  8           2     16 x  8 *  2   32 x  8   1 kiB     0
 *  9           4      8 x  9 *  4   32 x  9   2 kiB     1
 * 10           8      4 x 10 *  8   32 x 10   4 kiB     2
 * 11           16     2 x 11 * 16   32 x 11   8 kiB     3
 * 
 * In this illustration, for brevity; m0 = bmask0 etc, w=iwe
 * EBRADRWIDTH
 *    EBR15 EBR14 EBR13 EBR12 EBR11 EBR10 EBR9  EBR8  EBR7  EBR6  EBR5  EBR4  EBR3  EBR2  EBR1  EBR0
 *  8                                                                                     w     w
 *  9                                                                         w&m3  w&m2  w&m1  w&m0
 * 10                                                 w&m3  w&m3  w&m2  w&m2  w&m1  w&m1  w&m0  w&m0
 * 11 w&m3  w&m3  w&m3  w&m3  ie&m2 ie&m2 ie&m2 ie&m2 w&m1  w&m1  w&m1  w&m1  w&m0  w&m0  w&m0  w&m0
 * The internal mask only have an effect when we are using 2 EBRs.
 * 
 * Initiation of the EBRs is done via parameters. 
 * We have 2,4,8 or 16 EBRs, and initiate each one of these 
 * from a "stripe" of 256 entries. Schematically shown for the
 * largest configuration:
 * 
 *            4095        3840 3839 ..  512 511________ 256 255___________0
 * program0   INIT_0 for EBR15      ..      INIT_0 for EBR1 INIT_0 for EBR0
 * program1   INIT_1 for EBR15      ..      INIT_1 for EBR1 INIT_1 for EBR0
 *            :::::                 ..      :::::           :::::
 * programF   INIT_F for EBR15      ..      INIT_F for EBR1 INIT_F for EBR0
 */
module m_ebr
  # ( parameter EBRADRWIDTH = 8,
      parameter [4095:0] program0 = 4096'h0,
      parameter [4095:0] program1 = 4096'h0,
      parameter [4095:0] program2 = 4096'h0,
      parameter [4095:0] program3 = 4096'h0,
      parameter [4095:0] program4 = 4096'h0,
      parameter [4095:0] program5 = 4096'h0,
      parameter [4095:0] program6 = 4096'h0,
      parameter [4095:0] program7 = 4096'h0,
      parameter [4095:0] program8 = 4096'h0,
      parameter [4095:0] program9 = 4096'h0,
      parameter [4095:0] programA = 4096'h0,
      parameter [4095:0] programB = 4096'h0,
      parameter [4095:0] programC = 4096'h0,
      parameter [4095:0] programD = 4096'h0,
      parameter [4095:0] programE = 4096'h0,
      parameter [4095:0] programF = 4096'h0
      )
   (
    input [31:0]            B, //     Output from ALU
    input [EBRADRWIDTH-1:0] Rai, //   Read address
    input [EBRADRWIDTH-1:0] Wai, //   Write address    
    input                   clk, //   System clock
    input [3:0]             bmask, // Byte masks for write, active LOW
    input                   iwe, //   Write enable
    output                  next_readvalue_unknown, // For debugging only
    output [31:0]           DAT_O //   Register used in many places, also I/O output
    );
   localparam NRRAMS = (1<<(EBRADRWIDTH-7));
   localparam SLICEWIDTH = (1<<(12-EBRADRWIDTH));
   genvar                   j;
   wire [17:0]              zeros = 18'h0;
   wire [12:0]              extRai = {zeros[12:EBRADRWIDTH],Rai[EBRADRWIDTH-1:0]};
   wire [12:0]              extWai = {zeros[12:EBRADRWIDTH],Wai[EBRADRWIDTH-1:0]};   
   wire [1:0]               e2  = { iwe, iwe};
   wire [3:0]               e4  = { iwe&~bmask[3], iwe&~bmask[2], iwe&~bmask[1], iwe&~bmask[0] };
   wire [7:0]               e8  = { {2{e4[3]}},{2{e4[2]}},{2{e4[1]}},{2{e4[0]}} };
   wire [15:0]              e16 = { {4{e4[3]}},{4{e4[2]}},{4{e4[1]}},{4{e4[0]}} };
   wire [39:0]              e = {e16, e8, 4'h0,e4, 6'h0,e2 };
   /*EBRADRWIDTH
    *|| EBR15 EBR14 EBR13 EBR12 EBR11 EBR10 EBR9  EBR8  EBR7  EBR6  EBR5  EBR4  EBR3  EBR2  EBR1  EBR0
    * 8                                                                                     e[1]  e[0]
    * 9                                                                        e[11] e[10]  e[9]  e[8]
    *10                                                e[23] e[22] e[21] e[20] e[19] e[18] e[17] e[16]
    *11e[39] e[38] e[37] e[36] e[35] e[34] e[33] e[32] e[31] e[30] e[29] e[28] e[27] e[26] e[25] e[24]
    */
/* verilator lint_off UNUSED */
   wire                     killwarnings;
`ifdef verilator 
   wire [15:0]              sim_pre_RDATA;
   wire [31:0]              deaddead = 32'hdeaddead;
`endif
/* verilator lint_on UNUSED */
`ifdef verilator 
   function [0:0] chase_hierarchy;
      // verilator public
      chase_hierarchy = clk;
   endfunction
`endif

`ifdef verilator
   assign next_readvalue_unknown =  ( Rai == Wai && iwe );
   reg                      readvalue_unknown;
   always @(posedge clk)
     readvalue_unknown <= next_readvalue_unknown;
`else
   assign next_readvalue_unknown = 1'b0;
`endif
   
   generate
      
      for ( j = 0; j < NRRAMS; j = j + 1 ) begin : b0
         wire [15:0] RDATA;
         wire [17:0] extWDATA = {zeros[17:SLICEWIDTH],B[SLICEWIDTH*(j+1)-1:SLICEWIDTH*j]};
         reg [15:0] themask;

         always @(/*AS*/bmask) begin
            if ( NRRAMS > 2 ) begin
               themask = 16'h0;
               //$display( "bmask=%x e = %x", bmask, e );
            end else begin
               if ( (j & 1) == 0 ) begin
                  themask = {{8{bmask[1]}},{8{bmask[0]}}};
               end else begin
                  themask = {{8{bmask[3]}},{8{bmask[2]}}};
               end
            end
         end
         
         SB_RAM40_4K
           # ( .READ_MODE(EBRADRWIDTH-8),
               .WRITE_MODE(EBRADRWIDTH-8),
/* EBR can not be initiated by Verilator in this way. 
   It does not matter in simulation, because then EBR is
   filled at startup of the simulation anyway
 */              
               .INIT_0(program0[256*j+255:256*j]),
               .INIT_1(program1[256*j+255:256*j]),
               .INIT_2(program2[256*j+255:256*j]),
               .INIT_3(program3[256*j+255:256*j]),
               .INIT_4(program4[256*j+255:256*j]),
               .INIT_5(program5[256*j+255:256*j]),
               .INIT_6(program6[256*j+255:256*j]),
               .INIT_7(program7[256*j+255:256*j]),
               .INIT_8(program8[256*j+255:256*j]),
               .INIT_9(program9[256*j+255:256*j]),
               .INIT_A(programA[256*j+255:256*j]),
               .INIT_B(programB[256*j+255:256*j]),
               .INIT_C(programC[256*j+255:256*j]),
               .INIT_D(programD[256*j+255:256*j]),
               .INIT_E(programE[256*j+255:256*j]),
               .INIT_F(programF[256*j+255:256*j])
               )
           ebr
           (
            .RDATA( RDATA[15:0]                   ),
            .RADDR( extRai[10:0]                  ),
            .RCLK(  clk                           ),
            .RCLKE( 1'b1                          ),
            .RE(    1'b1                          ),
            .WADDR( extWai[10:0]                  ),
            .WCLK(  clk                           ),
            .WCLKE( 1'b1                          ),
            .WDATA( extWDATA[15:0]                ),
            .WE(    e[8*(EBRADRWIDTH-8)+j] ),
`ifdef verilator
            .sim_pre_RDATA( sim_pre_RDATA),
`endif
            .MASK(  themask ) );
`ifdef verilator
         assign DAT_O[SLICEWIDTH*(j+1)-1:SLICEWIDTH*j]  = readvalue_unknown ? deaddead[SLICEWIDTH*(j+1)-1:SLICEWIDTH*j] : RDATA[SLICEWIDTH-1:0];
         assign DAT_O[SLICEWIDTH*(j+1)-1:SLICEWIDTH*j] = RDATA[SLICEWIDTH-1:0]; 
`else
         assign DAT_O[SLICEWIDTH*(j+1)-1:SLICEWIDTH*j] = RDATA[SLICEWIDTH-1:0]; 
`endif
         assign killwarnings = &extWDATA[17:16] | &RDATA | &zeros | &extRai | &extWai;
      end
   endgenerate

endmodule

// Local Variables:
// verilog-library-directories:("." )
// verilog-library-extensions:(".v" )
// verilog-library-extensions:(".sv" )
// End:
