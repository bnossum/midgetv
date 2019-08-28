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
`ifdef verilator
   wire [63:0]    zo;
`endif
   wire [7:0]     srammask = {{2{SEL_I[3]}},{2{SEL_I[2]}},{2{SEL_I[1]}},{2{SEL_I[0]}}};
   wire [1:0]     we;
   
   generate
      genvar      j,k;
      
      for ( j = 0; j < 2; j = j + 1 ) begin : blk0 //    j is Parallell based on ADR_I[16]
         for ( k = 0; k < 2; k = k + 1 ) begin : blk1 // k is low/high of a word
            SB_SPRAM256KA sram
                   (
                    .DATAIN     ( DAT_I[k*16+15 : k*16]       ),
                    .ADDRESS    ( ADR_I[15 : 2]               ),
                    .MASKWREN   ( srammask[k*4+3 : k*4]       ),
                    .WREN       ( we[j]                       ),
                    .CLOCK      ( CLK_I                       ),
                    .CHIPSELECT ( 1'b1                        ),
                    .POWEROFF   ( 1'b1 ), // Note. Shockingly bad name. Shame on Lattice
                    .STANDBY    ( 1'b0                        ),
                    .SLEEP      ( 1'b0                        ),
`ifdef verilator                       
                    .preDATAOUT ( zo[j*32+k*16+15 : j*32+k*16]),
`endif
                    .DATAOUT    ( o[j*32+k*16+15 : j*32+k*16] )
                    );
         end
      end
   endgenerate
   
   
   wire [31:0] preDAT_O;
   wire        readack;
   
   generate
      if ( HIGHLEVEL != 0 ) begin
         // -----------------------------------------------------------------------------
         // HIGHLEVEL
         // Note to self - at some stage I had a problem with this ram. Erostathenes
         // passed ok, but verify_maxupduino failed.
         // This either had to do with 
         //   o  how the writestrobe was deasserted
         //   o  pipelining of A[16]
         //   o  how readack was declared.
         // But when I now try to pin it down, everything works. Leave this messy
         // code until such time that I can find out what happens.
         // -----------------------------------------------------------------------------
//bn         wire hello_readack;
         wire writestrobe;
         wire writeack;
         wire readstrobe;
         
         assign writestrobe = STB_I &  WE_I;
         assign readstrobe  = STB_I & ~WE_I;

         assign writeack = writestrobe;
         
         /* verilator lint_off UNUSED */
         reg [1:0] readackdly;
         /* verilator lint_on UNUSED */
         always @(posedge CLK_I) begin
            if ( readackdly == 0 ) 
              readackdly[1:0] <= {readstrobe,readackdly[1:1]};
            else
              readackdly[1:0] <= {1'b0,readackdly[1:1]};
         end
//bn         assign hello_readack = readackdly[1];
//bn         assign ACK_O = hello_readack | writeack;

         assign readack = readackdly[1];
         assign ACK_O = readack | writeack;


//         wire writestrobe = STB_I &  WE_I;
//         reg hello_readack;
//         wire cmb_readack = ~hello_readack & STB_I & ~WE_I;
//         always @(posedge CLK_I)
//           hello_readack <= cmb_readack;
//         assign ACK_O = hello_readack | writestrobe;
         
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
//bn         wire        readack;
         
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
