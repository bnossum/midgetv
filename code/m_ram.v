/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 *
 * Nearly Whishbone B.4 data sheet for m_ram. The only reason I can not
 * call this a Whishbone interface is that midgetv require a read latency
 * of 1 cycle (or higher). In other words, midgetv can not support a 
 * Whishbone classical read cycle with no latency.
 * 
 * --------------------------------------------------------------------
 * Inteface type:                   SLAVE
 * General description:             0/16384/32768 * 32-bit memory
 * Supported cycles:                SLAVE, READ/WRITE
 *                                  SLAVE, BLOCK READ/WRITE
 *                                  SLAVE, RMW
 * Data port, size:                 32-bit
 * Data port, granularity:          8-bit
 * Data port, maximum operand size: 32-bit
 * Data transfer ordering:          Big endian and/or little endian
 * Data transfer sequencing:        Undefined
 * Supported signal list            Signal name   WHISHBONE Equiv. 
 *   and cross-reference to         CLK_I         CLK_I        
 *   equivalent WHISHBONE signals:  DAT_I[31:0]   DAT_I()
 *                                  ADR_I[31:0]   ADR_I()
 *                                  STB_I         STB_I        
 *                                  WE_I          WE_I         
 *                                  SEL_I[3:0]    SEL_I()
 *                                  DAT_O[31:0]   DAT_O()
 *                                  ACK_O         ACK_O        
 * 
 * The interface to RAM follows the Whishbone B.4 specification, except:
 *  o  RST_I is not implemented. 
 *     The reason is that if SRAM_READLATENCY == 1 and SRAM_WRITELATENCY == 0,
 *     the whishbone interface of this module can not profit on RST_I in any way.
 *  o  CYC_I is not implemented. This is simply because midgetv sets 
 *     CYC_O == STB_O, so adding CYC_I does not enhance this module in any way.
 * Please tell me if these assumptions are unresonable. 
 * 
 * The motivation to interface RAM with a Whishbone interface is to later on
 * be able to use a cache. The wrapper is written for efficient instantiation
 * of SRAM in ICE40UP. It is also written so that simulation may play with
 * higher latencies.
 * 
 * Please note: This module should also be able to simulate SRAM_READLATENCY == 0.
 * But the microcode of midgetv depends upon a SRAM_READLATENCY >= 1.
 * 
 * Parameter description: SRAMADRWIDTH
 * --------------------------------
 * Legal addresswidth 
 *  |  Resources         SRAM
 *  0  0 SB_SPRAM256KA,    0 KiB no SRAM implemented,
 * 16  2 SB_SPRAM256KA    64 KiB organized as 32 * 14,
 * 17  4 SB_SPRAM256KA   128 KiB organized as 32 * 15.
 */
module m_ram
  # ( parameter SRAMADRWIDTH = 16
      )
   (
    input         CLK_I, // System clock
    input [31:0]  DAT_I, // Data out from core, into RAM
    input [31:0]  ADR_I, // Address to read/write
    input         STB_I, // Ram is accessed
    input         WE_I, //  Write cycle
    input [3:0]   SEL_I, // Byte select signals
    output [31:0] DAT_O, // Data out
    output        ACK_O, // Acknowledge after operation
    output        m_ram_killwarnings
    );
   /*   Tested latencies
    * 
    *   WRITELATENCY
    *   |  READLATENCY 
    *   |   1 2 10
    *   |  ---------
    *   0 | x x x
    *   1 |   x
    *  10 |     x
    *
    */
   
   localparam SRAM_READLATENCY =  1; // No smaller than 1. For simulation of slow SRAMs can be larger
   localparam SRAM_WRITELATENCY = 0; // Can be higher for simulation of slow SRAMs.
   
   generate
      if ( SRAMADRWIDTH == 0 ) begin
         // No SRAM at all
         assign DAT_O = 32'h0;
         assign ACK_O = 1'b0;
         assign m_ram_killwarnings = CLK_I & STB_I & WE_I & &ADR_I & &DAT_I & &SEL_I;
      end else begin
         wire [(SRAMADRWIDTH-15)*32-1:0] o;
`ifdef verilator
         wire [(SRAMADRWIDTH-15)*32-1:0] zo;
`endif
         wire [SRAMADRWIDTH-16:0]        we;
         wire [7:0]                      srammask;
         genvar                          j,k;

         assign srammask = {{2{SEL_I[3]}},{2{SEL_I[2]}},{2{SEL_I[1]}},{2{SEL_I[0]}}};
         
         // Instantiate 2 or 4 SB_SPRAM256KA's
         for ( j = 0; j < SRAMADRWIDTH-15; j = j + 1 ) begin : blk0
            for ( k = 0; k < 2; k = k + 1 ) begin : blk1
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

         wire readack,writeack;
         wire [31:0] preDAT_O;
         
         wire writestrobe = STB_I & WE_I;
         if ( SRAM_WRITELATENCY == 0 ) begin
            assign writeack = writestrobe;
         end else begin
            /* verilator lint_off UNUSED */
            reg [SRAM_WRITELATENCY:0] writeackdly;
            /* verilator lint_on UNUSED */
            always @(posedge CLK_I) begin
               if ( writeackdly == 0 )
                 writeackdly[SRAM_WRITELATENCY:0] <= {writestrobe,writeackdly[SRAM_WRITELATENCY:1]};
               else
                 writeackdly[SRAM_WRITELATENCY:0] <= {1'b0,writeackdly[SRAM_WRITELATENCY:1]};
            end
            assign writeack = writeackdly[1];
         end
         
         if ( SRAMADRWIDTH == 16 ) begin
            assign we[0] = writestrobe;
`ifdef verilator
            if ( SRAM_READLATENCY == 0 ) begin
               assign preDAT_O = zo[31:0];
            end else begin
               assign preDAT_O = o[31:0];
            end
`else
            assign preDAT_O = o[31:0];
`endif
         end else begin
            assign we[0] = writestrobe & ~ADR_I[16];
            assign we[1] = writestrobe &  ADR_I[16];
            // ADR_I[] stable until ACK_O, so need not pipeline ADR_I[16]
`ifdef verilator
            if ( SRAM_READLATENCY == 0 ) begin
               assign preDAT_O = ADR_I[16] ? zo[63:32] : zo[31:0];
            end else begin
               assign preDAT_O = ADR_I[16] ? o[63:32] : o[31:0];
            end
`else
               assign preDAT_O = ADR_I[16] ? o[63:32] : o[31:0];
`endif
         end

         wire readstrobe = STB_I & ~WE_I;
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
         assign DAT_O = ACK_O ? preDAT_O : 32'habbababa;
`else
         assign DAT_O = preDAT_O;
`endif
         assign m_ram_killwarnings = &ADR_I & &o
`ifdef verilator                                     
& &zo
`endif
;

      end 
   endgenerate      
endmodule

// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-extensions:(".v" )
// End:
