/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * 64 KiB ram using two SB_SPRAM256KA.
 * The highlevel version can be used in simulations to test out different 
 * read/write latencies.
 */
module m_ram_a16
  # ( parameter HIGHLEVEL = 1 )
   (
    input         CLK_I, // System clock
    input [31:0]  DAT_I, // Data out from core, into RAM
    input [15:0]  ADR_I, // Address to read/write
    input         STB_I, // Ram is accessed
    input         WE_I, //  Write cycle
    input [3:0]   SEL_I, // Byte select signals
    output [31:0] DAT_O, // Data out
    output        ACK_O, // Acknowledge after operation
    output        m_ram_a16_killwarnings
    );
   
   localparam SRAM_READLATENCY =  1; // No smaller than 1. For simulation of slow SRAMs can be larger
   localparam SRAM_WRITELATENCY = 0; // Can be higher for simulation of slow SRAMs.
   
   // -----------------------------------------------------------------------------
   // SRAM
   // -----------------------------------------------------------------------------
   wire [31:0]    o;
`ifdef verilator
   wire [31:0]    zo;
`endif
   wire [0:0]     we;
   wire [7:0]     srammask;
   wire           readack;
   wire [31:0]    preDAT_O;
   genvar         j,k;
   
   assign srammask = {{2{SEL_I[3]}},{2{SEL_I[2]}},{2{SEL_I[1]}},{2{SEL_I[0]}}};
   
   SB_SPRAM256KA sram0
     (
      .DATAIN     ( DAT_I[15 : 0]   ),
      .ADDRESS    ( ADR_I[15 : 2]   ),
      .MASKWREN   ( srammask[3 : 0] ),
      .WREN       ( we[0]           ),
      .CLOCK      ( CLK_I           ),
      .CHIPSELECT ( 1'b1            ),
      .POWEROFF   ( 1'b1            ), // Note. Shockingly bad name. Shame on Lattice
      .STANDBY    ( 1'b0            ),
      .SLEEP      ( 1'b0            ),
`ifdef verilator                       
      .preDATAOUT ( zo[15 : 0]      ),
`endif
      .DATAOUT    ( o[15 : 0]       )
      );
   
   SB_SPRAM256KA sram1
     (
      .DATAIN     ( DAT_I[31 :16]   ),
      .ADDRESS    ( ADR_I[15 : 2]   ),
      .MASKWREN   ( srammask[7 : 4] ),
      .WREN       ( we[0]           ),
      .CLOCK      ( CLK_I           ),
      .CHIPSELECT ( 1'b1            ),
      .POWEROFF   ( 1'b1            ), // Note. Shockingly bad name. Shame on Lattice
      .STANDBY    ( 1'b0            ),
      .SLEEP      ( 1'b0            ),
`ifdef verilator                       
      .preDATAOUT ( zo[31 :16]      ),
`endif
      .DATAOUT    ( o[31 :16]       )
      );
   
   generate
      if ( HIGHLEVEL == 1 ) begin
         // -----------------------------------------------------------------------------
         // HIGHLEVEL
         // -----------------------------------------------------------------------------
         wire writeack;
         wire readstrobe;
         
         assign we = STB_I & WE_I;
         if ( SRAM_WRITELATENCY == 0 ) begin
            assign writeack = we;
         end else begin
            /* verilator lint_off UNUSED */
            reg [SRAM_WRITELATENCY:0] writeackdly;
            /* verilator lint_on UNUSED */
            always @(posedge CLK_I) begin
               if ( writeackdly == 0 )
                 writeackdly[SRAM_WRITELATENCY:0] <= {we,writeackdly[SRAM_WRITELATENCY:1]};
               else
                 writeackdly[SRAM_WRITELATENCY:0] <= {1'b0,writeackdly[SRAM_WRITELATENCY:1]};
            end
            assign writeack = writeackdly[1];
         end
         
         assign readstrobe = STB_I & ~WE_I;
         if ( SRAM_READLATENCY == 0) begin
            assign readack = readstrobe;
         end else begin
            /* verilator lint_off UNUSED */
            reg [SRAM_READLATENCY:0] readackdly;
            /* verilator lint_on UNUSED */
            always @(posedge CLK_I) begin
               if ( readackdly == 0 ) 
                 readackdly[SRAM_READLATENCY:0] <= {readstrobe,readackdly[SRAM_READLATENCY:1]};
               else
                 readackdly[SRAM_READLATENCY:0] <= {1'b0,readackdly[SRAM_READLATENCY:1]};
            end
            assign readack = readackdly[1];
         end
         assign ACK_O = readack | writeack;
         
`ifdef verilator
         if ( SRAM_READLATENCY == 0 ) begin
            assign preDAT_O = zo[31:0];
         end else begin
            assign preDAT_O = o[31:0];
         end
         assign DAT_O = ACK_O ? preDAT_O : 32'habbababa;
`else
         assign preDAT_O = o[31:0];
         assign DAT_O = preDAT_O;
`endif
         
      end else begin
         
         // -----------------------------------------------------------------------------
         // LOWLEVEL
         // -----------------------------------------------------------------------------
         
         SB_LUT4 #(.LUT_INIT(16'h8888)) we_l(.O(we[0]), .I3(1'b0), .I2(1'b0), .I1(STB_I), .I0(WE_I)); 
         assign preDAT_O = o[31:0];
         
         wire cmb_readack;
         SB_LUT4 #(.LUT_INIT(16'h0404)) readack_l(.O(cmb_readack), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
         SB_DFF readack_r(.Q(readack), .C(CLK_I), .D(cmb_readack));
         
         //assign ACK_O = readack | writeack;
         SB_LUT4 #(.LUT_INIT(16'hf8f8)) ACK_O_l(.O(ACK_O), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
         
         
`ifdef verilator
         /* Not strictly wanted in low-level code,
          * but keep output strictly equal to
          * highlevel. This is only in simulation.
          */
         assign DAT_O = ACK_O ? preDAT_O : 32'habbababa;
`else
         assign DAT_O = preDAT_O;
`endif
      end // HIGHLEVEL
   endgenerate

   assign m_ram_a16_killwarnings = &ADR_I |
`ifdef verilator                                     
                                   &zo |
`endif
                                   &o;            
endmodule      
   
