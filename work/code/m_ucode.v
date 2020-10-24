/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * ucode holds the microcode of midgetv in three EBRs, or two EBRs and some logic.
 * This module is a wrapper to assign control lines to a distinct data out of EBR.
 * 
 */
module m_ucode
  # ( parameter NO_UCODEOPT = 0,
      parameter MULDIV = 0,
      parameter RVC = 0,
      parameter HAS_MINSTRET = 0,
      parameter HAS_EBR_MINSTRET = 0
      )
   (
    input        clk,
    input [7:0]  minx,
    input        progress_ucode, // Hold when shifting
    input [0:0]  MULDIVREG,
    output       sa00, // sa02,sa03,sa04,sa05,sa06,
    output [1:0] s_alu_carryin,
    output       mod_s_alu_1,
    output [2:0] s_alu,
    output [1:0] s_shift,
    output [1:0] s_cyclecnt,
    output       sa11,sa12, sa14,sa15,
    output       sa20,sa21,sa22,sa23,sa24,sa25,sa26,sa27,sa28,sa29,
    output       sa30, sa32,sa33,sa34, sa37,sa38,sa39,
    output       sa40,sa41,sa42,sa43,
    output       clrM,
    output       ceM,
    output       potentialMODbranch,
    output       ctrl_pcinc_by_2,
    output [7:0] rinx,
    output       ucode_killwarnings
    );
`ifdef verilator
   function [47:0] get_sa;
      // verilator public
      get_sa = d;
   endfunction
`endif
   localparam UCODETYPE =
                         (RVC    ? 8 : 0 ) +
                         (MULDIV ? 4 : 0 ) +
                         (HAS_MINSTRET ? 2 : 0 ) +
                         (HAS_EBR_MINSTRET ? 1 : 0 );
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [47:0]          d;                      // From inst_3ebr of m_3ebr.v, ...
   // End of automatics
   generate
      if ( NO_UCODEOPT == 1 ) begin
         m_3ebr #(.UCODETYPE(UCODETYPE)) inst_3ebr
           (/*AUTOINST*/
            // Outputs
            .d                          (d[47:0]),
            // Inputs
            .clk                        (clk),
            .minx                       (minx[7:0]),
            .progress_ucode             (progress_ucode));
      end else begin
         if ( UCODETYPE == 4'b0000 ) begin
            v0_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b0010 ) begin
            v2_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b0011 ) begin
            v3_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b0100 ) begin
            v4_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b0110 ) begin
            v6_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b0111 ) begin
            v7_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1000 ) begin
            v8_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1010 ) begin
            v10_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1011 ) begin
            v11_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1100 ) begin
            v12_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1110 ) begin
            v14_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));
         end else if ( UCODETYPE == 4'b1111 ) begin
            v15_m_2ebr inst_2ebr
              (/*AUTOINST*/
               // Outputs
               .d                       (d[47:0]),
               // Inputs
               .clk                     (clk),
               .minx                    (minx[7:0]),
               .progress_ucode          (progress_ucode));         
         end
      end
   endgenerate
   
   assign rinx = d[7:0];
   assign sa00 = d[ 8];
   assign s_alu_carryin = d[10:9]; //       Carry in select
   assign s_alu         = d[13:11]; //      Alu operation
   assign s_cyclecnt    = d[19:18]; //      rcount mix, +3/+4 mux
   assign s_shift       = {d[20],d[21]}; // Shift counter selection.
   
   
   assign sa11 = d[30]; // Immediate expand exactly when we use dinx.
   assign sa12 = d[15]; // u_io_i_latch
   assign sa14 = d[16]; // nReset Q
   assign sa15 = d[17]; // Part of enable to Q
   assign sa20 = d[22]; // | Governs read address mux
   assign sa21 = d[23]; // | Governs read address mux
   assign sa22 = d[24]; // | Governs read address mux
   assign sa23 = d[25]; // | Governs read address mux
   assign sa24 = d[26]; // | Governs write address mux
   assign sa25 = d[27]; // | Governs write address mux
   assign sa26 = d[28]; // | Governs write address mux
   assign sa27 = d[29]; // | Governs write address mux
   assign sa28 = d[30]; // use_dinx
   assign sa29 = d[31]; // Adr0Mustbe0
   assign sa30 = d[32]; // Adr1Mustbe0     
   assign sa32 = d[33]; // Part of enable to Q
   assign sa33 = d[34]; // Control freeze of control when shifting
   assign sa34 = d[35]; // Modify input mux.
   assign sa37 = d[14]; // use_brcond
   assign sa38 = d[36]; // | isr_none/isr_use_uj/isr_intoCSR/isr_intoTrap
   assign sa39 = d[37]; // |
   assign sa40 = d[38]; // Select signal for rai
   assign sa41 = d[39]; // Latch SEL signals etc
   assign sa42 = d[40]; // Possibly activate STB_O or sram_stb
   assign sa43 = d[41]; // Possibly activate WE_O next cycle

   
   generate
      if ( MULDIV == 0 ) begin
         assign mod_s_alu_1 = s_alu[1];
      end else begin
         assign mod_s_alu_1 = (s_alu == 3'b100 && clrM == 1'b0) ? ~MULDIVREG[0] : s_alu[1];
      end
      if ( MULDIV == 0 && RVC == 1 ) begin
         assign ctrl_pcinc_by_2 = d[42]; // May perhaps combine with another controleq?
         assign clrM = d[43];               // Fake! R for M register. Also used to flag unsigned subtraction in DIV/DIVU/REM/REMU
         assign ceM  = d[44];               // Fake! CE for M register. Also used by m_condcode
         assign potentialMODbranch = d[45]; // Fake! Distinguish DIV or MOD
      end else begin
         assign clrM = d[42]; // R for M register. Also used to flag unsigned subtraction in DIV/DIVU/REM/REMU
         assign ceM  = d[43]; // CE for M register. Also used by m_condcode
         assign potentialMODbranch = d[44]; // Distinguish DIV or MOD
         assign ctrl_pcinc_by_2 = d[45]; // May perhaps combine with another controleq?
      end
   endgenerate
   assign ucode_killwarnings = &d[47:46]; // ???
endmodule

// Local Variables:
// verilog-library-directories:("." "../obj_dir" "../generated/" )
// verilog-library-files:("../generated/m_2ebr.v" )
// verilog-library-extensions:(".v" )
// End:
