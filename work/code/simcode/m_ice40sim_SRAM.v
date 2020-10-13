/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This plays the role of a testbench together with verilator.
 * Just a wrapper to set a parameter, I don't know how to do
 * this when compiling with verilator, it can probably not be done?
 */

`include "../../generated/midgetv_ucodeoptions.hv"

module m_ice40sim_SRAM
  # ( parameter
      SRAMADRWIDTH       = 16,  
      SIMEBRADRWIDTH     =  8
      )
   (
    input CLK_I, // Toggled from verilator
    input RST_I,
    input meip
    );
   
   
   m_ice40sim_EBRonly
     #(
       .SRAMADRWIDTH       ( SRAMADRWIDTH        ),
       .SIMEBRADRWIDTH     ( SIMEBRADRWIDTH      )
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
