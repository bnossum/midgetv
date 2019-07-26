/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 128 KiB ram using 4 SB_SPRAM256KAs.
 */
module m_ram_a17
  # ( parameter HIGHLEVEL = 1 )
   (
    input         CLK_I, // System clock
    input [31:0]  DAT_I, // Data out from core, into RAM
    input [16:0]  ADR_I, // Address to read/write
    input         STB_I, // Ram is accessed
    input         WE_I, //  Write cycle
    input [3:0]   SEL_I, // Byte select signals
    output [31:0] DAT_O, // Data out
    output        ACK_O, // Acknowledge after operation
    output        m_ram_a17_killwarnings
    );
   
         // -----------------------------------------------------------------------------
         // SRAM
         // -----------------------------------------------------------------------------
   wire [63:0]    o;
   wire [63:0]    zo;
   wire [7:0]     srammaskA = {{2{SEL_I[3]}},{2{SEL_I[2]}},{2{SEL_I[1]}},{2{SEL_I[0]}}};
   wire [15:0]    srammask  = {srammaskA,srammaskA};
   wire [1:0]     we;
   
   generate
      genvar      k;
      
      for ( k = 0; k < 4; k = k + 1 ) begin
         SB_SPRAM256KA sram
                (
                 .DATAIN     ( DAT_I[16*(k/2)+15 : 16*(k/2)]  ),
                 .ADDRESS    ( ADR_I[15 : 2]                  ),
                 .MASKWREN   ( srammask[4*k+3 : 4*k]          ),
                 .WREN       ( we[k/2]                        ),
                 .CLOCK      ( CLK_I                          ),
                 .CHIPSELECT ( 1'b1                           ),
                 .POWEROFF   ( 1'b1                           ), // Note. Shockingly bad name. Shame on Lattice
                 .STANDBY    ( 1'b0                           ),
                 .SLEEP      ( 1'b0                           ),
`ifdef verilator                                              
                 .preDATAOUT ( zo[16*k+15 : 16*k]             ),
`endif                                                        
                 .DATAOUT    ( o[16*k+15 : 16*k]              )
                 );
      end
   endgenerate
   
   
   //`ifdef verilator
//         wire [(SRAMADRWIDTH-15)*32-1:0] zo;
//`endif
//         wire [SRAMADRWIDTH-16:0]        we;
//         wire [7:0]                      srammask;
//         wire                            readack;
   wire [31:0] preDAT_O;
   wire        readack;
//         genvar                          j,k;
//         
//    
   generate
      if ( HIGHLEVEL != 0 ) begin
         // -----------------------------------------------------------------------------
         // HIGHLEVEL
         // -----------------------------------------------------------------------------
         wire writestrobe;
         wire writeack;
         wire readstrobe;
         
         assign writestrobe = STB_I & WE_I;
         assign writeack = writestrobe;
         
         assign readstrobe = STB_I & ~WE_I;
         /* verilator lint_off UNUSED */
         reg [1:0] readackdly;
         /* verilator lint_on UNUSED */
         always @(posedge CLK_I) begin
            if ( readackdly == 0 ) 
              readackdly[1:0] <= {readstrobe,readackdly[1:1]};
            else
              readackdly[1:0] <= {1'b0,readackdly[1:1]};
         end
         assign readack = readackdly[1];

         assign ACK_O = readack | writeack;
         
         assign we[0] = writestrobe & ~ADR_I[16];
         assign we[1] = writestrobe &  ADR_I[16];
         // ADR_I[] stable until ACK_O, so need not pipeline ADR_I[16]
         assign preDAT_O = ADR_I[16] ? o[63:32] : o[31:0];
         
`ifdef verilator
         assign DAT_O = ACK_O ? preDAT_O : 32'habbababa;
`else
         assign DAT_O = preDAT_O;
`endif
      
      end else begin
            
         // -----------------------------------------------------------------------------
         // LOWLEVEL
         // -----------------------------------------------------------------------------
         
         SB_LUT4 #(.LUT_INIT(16'h0808)) we0_l(.O(we[0]), .I3(1'b0), .I2(ADR_I[16]), .I1(STB_I), .I0(WE_I)); // assign we[0] = writeack & ~ADR_I[16];
         SB_LUT4 #(.LUT_INIT(16'h8080)) we1_l(.O(we[1]), .I3(1'b0), .I2(ADR_I[16]), .I1(STB_I), .I0(WE_I)); // assign we[1] = writeack &  ADR_I[16];
         // ADR_I[] stable until ACK_O, so need not pipeline ADR_I[16]
         assign preDAT_O = ADR_I[16] ? o[63:32] : o[31:0];

         wire cmb_readack;
         SB_LUT4 #(.LUT_INIT(16'h0404)) readack_l(.O(cmb_readack), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
         SB_DFF readack_r(.Q(readack), .C(CLK_I), .D(cmb_readack));
         //assign readstrobe = STB_I & ~WE_I;
         //reg r_readack;
         //always @(posedge CLK_I) 
         //   r_readack <= readstrobe & ~r_readack;
         //assign readack = r_readack;
         
         //assign ACK_O = readack | writeack;
         SB_LUT4 #(.LUT_INIT(16'hf8f8)) ACK_O_l(.O(ACK_O), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
         
         
         
         /* Not strictly wanted in low-level code,
          * but keep output strictly equal to
          * highlevel. This is only in simulation.
          */
`ifdef verilator
         assign DAT_O = ACK_O ? preDAT_O : 32'habbababa;
`else
         assign DAT_O = preDAT_O;
`endif
      end // HIGHLEVEL
      
      assign m_ram_a17_killwarnings = &ADR_I |
`ifdef verilator                                     
                                      &zo |
`endif
                                      &o;            
   endgenerate
endmodule
