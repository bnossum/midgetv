/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This is a wrapper unit.
 * 
 * 
 * Nearly Wishbone B.4 data sheet for m_ram. The only reason I can not
 * call this a Wishbone interface is that midgetv require a read latency
 * of 1 cycle (or higher). In other words, midgetv can not support SRAM
 * implemented as a Wishbone classical read cycle with no latency.
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
 * Supported signal list            Signal name   WISHBONE Equiv. 
 *   and cross-reference to         CLK_I         CLK_I        
 *   equivalent WISHBONE signals:   DAT_I[31:0]   DAT_I()
 *                                  ADR_I[31:0]   ADR_I()
 *                                  STB_I         STB_I        
 *                                  WE_I          WE_I         
 *                                  SEL_I[3:0]    SEL_I()
 *                                  DAT_O[31:0]   DAT_O()
 *                                  ACK_O         ACK_O        
 * 
 * The interface to RAM follows the Wishbone B.4 specification, except:
 *  o  RST_I is not implemented. 
 *     The reason is that if SRAM_READLATENCY == 1 and SRAM_WRITELATENCY == 0,
 *     the wishbone interface of this module can not profit on RST_I in any way.
 *  o  CYC_I is not implemented. This is simply because midgetv sets 
 *     CYC_O == STB_O, so adding CYC_I does not enhance this module in any way.
 *  o  Whishbone B.4 rule 3.55 is disregarded
 * 
 * Please tell me if these assumptions are unresonable. 
 * 
 * The motivation to interface RAM with a Wishbone interface is to later on
 * be able to use a cache. The wrapper is written for efficient instantiation
 * of SRAM in ICE40UP. It is also written so that simulation may play with
 * higher latencies.
 * 
 * Please note: This module should also be able to simulate SRAM_READLATENCY == 0.
 * But the microcode of midgetv depends upon a SRAM_READLATENCY >= 1.
 * 
 * Parameter description: SRAMADRWIDTH
 * --------------------------------
 *
 * Tested
 * | Implemented 
 * | | SRAMADRWIDTH
 * x    0    0   KiB SRAM No SRAM implemented
 *      9    0.5 KiB SRAM (1 EBR and logic masquarading as SRAM)
 *   x 10    1   KiB SRAM (2 EBRs masquerading as SRAM)
 *   x 11    2   KiB SRAM (4 EBRs masquerading as SRAM)
 * x x 12    4   KiB SRAM (8 EBRs masquerading as SRAM)                     [11:2]
 *   x 13    8   KiB SRAM (16 EBRs masquerading as SRAM)                    [12:2]
 *     14   16   KiB SRAM (32 EBRs and logic masquerading as SRAM)          [13:2]
 *     15   32   KiB SRAM (1 SB_SPRAM256KA, and logic)                      [14:2]
 * x x 16   64   KiB SRAM (2 SB_SPRAM256KA)   64 KiB organized as 32 * 14,  [15:2]
 * x x 17  128   KiB SRAM (4 SB_SPRAM256KA)  128 KiB organized as 32 * 15.  [16:2]
 */
module m_ram
  # ( parameter HIGHLEVEL = 0,
      SRAMADRWIDTH = 16
      )
   (
    input         CLK_I, // System clock
    input [31:0]  DAT_I, // Data out from core, into RAM
    input [31:0]  ADR_I, // Address to read/write
    input         STB_I, // Ram is accessed
    input         WE_I, //  Write cycle
    input [3:0]   SEL_I, // Byte select signals
    /* verilator lint_off UNUSED */
    input [3:0]   bmask, // Inverse of above
    /* verilator lint_on UNUSED */
    output [31:0] DAT_O, // Data out
    output        ACK_O, // Acknowledge after operation
    output        m_ram_killwarnings
    );

   /*AUTOWIRE*/
   
   generate
      if ( SRAMADRWIDTH == 0 ) begin
         // No SRAM at all
         assign DAT_O = 32'h0;
         assign ACK_O = 1'b0;
         assign m_ram_killwarnings = CLK_I & STB_I & WE_I & &ADR_I & &DAT_I & &SEL_I;
      end else if ( SRAMADRWIDTH == 17 ) begin
         wire            m_ram_a17_killwarnings;
         // End of automatics
         m_ram_a17 #(.HIGHLEVEL(HIGHLEVEL))
         m_ram_inst
           (/*AUTOINST*/
            // Outputs
            .DAT_O                      (DAT_O[31:0]),
            .ACK_O                      (ACK_O),
            .m_ram_a17_killwarnings     (m_ram_a17_killwarnings),
            // Inputs
            .CLK_I                      (CLK_I),
            .DAT_I                      (DAT_I[31:0]),
            .ADR_I                      (ADR_I[16:0]),
            .STB_I                      (STB_I),
            .WE_I                       (WE_I),
            .SEL_I                      (SEL_I[3:0]));

         assign m_ram_killwarnings = &bmask & CLK_I & STB_I & WE_I & &ADR_I & &DAT_I & &SEL_I | m_ram_a17_killwarnings;

      end else if ( SRAMADRWIDTH == 16 ) begin

         wire            m_ram_a16_killwarnings;
         m_ram_a16 #(.HIGHLEVEL(HIGHLEVEL)) // 15:2 used as address
         m_ram_inst
           (/*AUTOINST*/
            // Outputs
            .DAT_O                      (DAT_O[31:0]),
            .ACK_O                      (ACK_O),
            .m_ram_a16_killwarnings     (m_ram_a16_killwarnings),
            // Inputs
            .CLK_I                      (CLK_I),
            .DAT_I                      (DAT_I[31:0]),
            .ADR_I                      (ADR_I[15:0]),
            .STB_I                      (STB_I),
            .WE_I                       (WE_I),
            .SEL_I                      (SEL_I[3:0]));
         assign m_ram_killwarnings = &bmask & CLK_I & STB_I & WE_I & &ADR_I & &DAT_I & &SEL_I | m_ram_a16_killwarnings;
         
      end else if ( SRAMADRWIDTH >= 10 && SRAMADRWIDTH <= 13 ) begin

         wire we;
         if ( HIGHLEVEL ) begin
            assign we  = STB_I & WE_I;
            reg  readack;
            wire cmb_readack = ~readack & STB_I & ~WE_I;
            always @(posedge CLK_I)
              readack <= cmb_readack;
            assign ACK_O = readack | we;
         end else begin
            wire readack;
            wire cmb_readack;
            SB_LUT4 #(.LUT_INIT(16'h8888)) we_l(.O(we), .I3(1'b0), .I2(1'b0), .I1(STB_I), .I0(WE_I));
            SB_LUT4 #(.LUT_INIT(16'h0404)) readack_l(.O(cmb_readack), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
            SB_DFF readack_r(.Q(readack), .C(CLK_I), .D(cmb_readack));
            SB_LUT4 #(.LUT_INIT(16'hf8f8)) ACK_O_l(.O(ACK_O), .I3(1'b0), .I2(readack), .I1(STB_I), .I0(WE_I)); 
         end

         
         wire       next_readvalue_unknown;
         m_ebr #(.EBRADRWIDTH(SRAMADRWIDTH-2))
         inst_ram (// Inputs
                   .Rai                 (ADR_I[SRAMADRWIDTH-1:2]),
                   .Wai                 (ADR_I[SRAMADRWIDTH-1:2]),
                   .iwe                 (we),
                   .B                   (DAT_I[31:0]),
                   .clk                 (CLK_I),
                   /*AUTOINST*/
                   // Outputs
                   .DAT_O               (DAT_O[31:0]),
                   .next_readvalue_unknown(next_readvalue_unknown),
                   // Inputs
                   .bmask               (bmask[3:0]));

         assign m_ram_killwarnings = &ADR_I | next_readvalue_unknown;
         
      end
`ifndef verilator
      else begin
         unsupported_sramwidth inst_can_not_have_this();
      end
`endif
   endgenerate
endmodule

// Local Variables:
// verilog-library-directories:("." "sb_sim_rtl" )
// verilog-library-extensions:(".v" )
// End:
