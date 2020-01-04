/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This plays the role of a testbench together with verilator.
 * Just a wrapper to set a parameter, I don't know how to do
 * this when compiling with verilator, it can probably not be done?
 */
module m_ice40sim_SRAM
  # ( parameter
      SRAMADRWIDTH       = 16,  
      SIMEBRADRWIDTH     =  8, 
      IWIDTH             = 32, 
      NO_CYCLECNT        = 0, 
      MTIMETAP           = 14, 
      HIGHLEVEL          = 0,
      LAZY_DECODE        = 0,
      DISREGARD_WB4_3_55 = 0,
      MULDIV             = 1
      )
   (
    input CLK_I, // Toggled from verilator
    input RST_I,
    input meip
    );
   
   
   m_ice40sim_EBRonly
     #(
       .SRAMADRWIDTH       ( SRAMADRWIDTH        ),
       .SIMEBRADRWIDTH     ( SIMEBRADRWIDTH      ),
       .IWIDTH             ( IWIDTH              ),
       .NO_CYCLECNT        ( NO_CYCLECNT         ),
       .MTIMETAP           ( MTIMETAP            ),
       .HIGHLEVEL          ( HIGHLEVEL           ),
       .LAZY_DECODE        ( LAZY_DECODE         ),
       .DISREGARD_WB4_3_55 ( DISREGARD_WB4_3_55  ),
       .MULDIV             ( MULDIV              )
       )
   inst_ice40sim_EBRonly
     (/*AUTOINST*/
      // Inputs
      .CLK_I                            (CLK_I),
      .RST_I                            (RST_I),
      .meip                             (meip));
endmodule

// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-extensions:(".v" )
// End:
