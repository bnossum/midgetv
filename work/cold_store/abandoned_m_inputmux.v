/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The input mux selects between:
 *   o 32 bit output from a SRAM (or cache or whatever)
 *   o a data input port
 *   o 32 bit output from the internal EBR ram (DAT_O)
 *   o A rightshifted ADR_O
 *   o register M for MUL/DIV instructions
 * 
 * 
 * Rough resource usage based on what sort of input mux we instantiate, with IWIDTH = 32
 * HIGHLEVEL
 * |SYSREGS
 * ||SRAM
 * |||MULDIV
 * ||||DAT_I_ZERO_WHEN_INACTIVE
 * |||||  SB_LUT4  Registers
 * 0000x  65       33
 * 0001x  65       33
 * 0010x  65       33
 * 00110  98       33
 * 00111  66       33
 * 0110x
 * 1000x  65       33
 * 1001x  65       33
 * 1010x  65       33
 * 10110  97       33
 * 10111  66       33
 * 1100x 106       33
 * 1101x 106       33
 * 1110x 106       33
 * 11110 138       33
 * 11111 107       33
 * 
 * 
 */

/* verilator lint_off DECLFILENAME */


module m_inputmux
  # ( parameter HIGHLEVEL = 0, //      Understandable or minimum size
      MULDIV = 0, //                   With MUL/DIV instructions?
      DAT_I_ZERO_WHEN_INACTIVE = 0, // With "wellbehaved" Wishbone input we may save 32 LUTs in certain situations
      IWIDTH = 32,  //                 Can in principle be from 1 to 32. Usually 8, 16 or 32.
      SRAMADRWIDTH = 16, //            External memory. Usually SRAM in iCE40UP
      MTIMETAP = 32, //                Governs inclusion of system registers
      MTIMETAP_LOWLIM = 32 //          Really a constant
      )
   (
    input              clk, //         System clock
    input              corerunning, // Only update registers after core is started
    input [31:0]       DAT_O, //       Output from EBR is input to mux
    input [IWIDTH-1:0] DAT_I, //       External input
    input [31:0]       Dsram, //       SRAM input
    input [31:0]       ADR_O, //       For address decoding 
    input              sra_msb, //     Msb to use when rightshifing ADR_O
    input              sa00, //        Main select signal, pipelined
    input              STB_O, //       Selecte between SRAM and IO, must also lead to  ack when systemregisters written
    input              sram_ack, //    Used to select data from SRAM/input devices
    input              mie, //         Machine Interrupt enable in MSTATUS
    input              mpie, //        Machine Previous Interrupt enable in MSTATUS
    input              meie, //        Machine External Interrupt Enable in MIE
    input              mrinstretie, // Machine Retired Instructions Retired Interrupt Enable in MIE. RENAME
    input              msie, //        Machine Software Interrupt Enable in MIE
    input              mtie, //        Machine Timer Interrupt Enable in MIE
    input              mtimeincie, //  Machine Time Increment Interrupt Enable in MIE
    input              mrinstretip, // Machine Retired Instructions Retired Interrupt Pending in MIP. RENAME
    input              msip, //        Machine Software Interrupt Pending in MIP
    input              mtip,//         Machine Timer Interrupt Pending in MIP
    input              mtimeincip, //  Machine Time Increment Interrupt Pending in MIP
    input              meip, //        Machine External Interrupt Pending in MIP
    input              qACK, //        Qualified acknowledge, usually (ACK_I | sysregack)
    /* verilator lint_off UNUSED */
    input [31:0]       MULDIVREG, //   MUL/DIV result register
    input              clrM, //        To determine if MULDIVREG is to be read
    input              ceM, //         To determine if MULDIVREG is to be read
    /* verilator lint_on UNUSED */
    
    output             sysregack, //   Read/Write acknowledge from MIP/MIE/MSTATUS
    output [31:0]      Di, //          Data out of mux
    
    output [31:0]      rDee, //        Output for debugging purposes
    output [31:0]      theio //       Output for debugging purposes
    );
   
   generate
      if ( HIGHLEVEL ) begin
         m_inputmux_highlevel
           # ( .MULDIV(                   MULDIV                   ),
               .DAT_I_ZERO_WHEN_INACTIVE( DAT_I_ZERO_WHEN_INACTIVE ),
               .IWIDTH(                   IWIDTH                   ),
               .SRAMADRWIDTH(             SRAMADRWIDTH             ),
               .MTIMETAP(                 MTIMETAP                 ),
               .MTIMETAP_LOWLIM(          MTIMETAP_LOWLIM          ))
         imux
           (/*AUTOINST*/
            // Outputs
            .sysregack                  (sysregack),
            .Di                         (Di[31:0]),
            .rDee                       (rDee[31:0]),
            .theio                      (theio[31:0]),
            // Inputs
            .clk                        (clk),
            .DAT_O                      (DAT_O[31:0]),
            .DAT_I                      (DAT_I[IWIDTH-1:0]),
            .Dsram                      (Dsram[31:0]),
            .ADR_O                      (ADR_O[31:0]),
            .sra_msb                    (sra_msb),
            .sa00                       (sa00),
            .STB_O                      (STB_O),
            .sram_ack                   (sram_ack),
            .mie                        (mie),
            .mpie                       (mpie),
            .meie                       (meie),
            .mrinstretie                (mrinstretie),
            .msie                       (msie),
            .mtie                       (mtie),
            .mtimeincie                 (mtimeincie),
            .mrinstretip                (mrinstretip),
            .msip                       (msip),
            .mtip                       (mtip),
            .mtimeincip                 (mtimeincip),
            .meip                       (meip),
            .qACK                       (qACK),
            .corerunning                (corerunning),
            .MULDIVREG                  (MULDIVREG[31:0]),
            .clrM                       (clrM),
            .ceM                        (ceM));
      end else begin
         m_inputmux_lowlevel
           # ( .MULDIV(                   MULDIV                   ),
               .DAT_I_ZERO_WHEN_INACTIVE( DAT_I_ZERO_WHEN_INACTIVE ),
               .IWIDTH(                   IWIDTH                   ),
               .SRAMADRWIDTH(             SRAMADRWIDTH             ),
               .MTIMETAP(                 MTIMETAP                 ),
               .MTIMETAP_LOWLIM(          MTIMETAP_LOWLIM          ))
         imux
           (/*AUTOINST*/
            // Outputs
            .sysregack                  (sysregack),
            .Di                         (Di[31:0]),
            .rDee                       (rDee[31:0]),
            .theio                      (theio[31:0]),
            // Inputs
            .clk                        (clk),
            .DAT_O                      (DAT_O[31:0]),
            .DAT_I                      (DAT_I[IWIDTH-1:0]),
            .Dsram                      (Dsram[31:0]),
            .ADR_O                      (ADR_O[31:0]),
            .sra_msb                    (sra_msb),
            .sa00                       (sa00),
            .STB_O                      (STB_O),
            .sram_ack                   (sram_ack),
            .mie                        (mie),
            .mpie                       (mpie),
            .meie                       (meie),
            .mrinstretie                (mrinstretie),
            .msie                       (msie),
            .mtie                       (mtie),
            .mtimeincie                 (mtimeincie),
            .mrinstretip                (mrinstretip),
            .msip                       (msip),
            .mtip                       (mtip),
            .mtimeincip                 (mtimeincip),
            .meip                       (meip),
            .qACK                       (qACK),
            .corerunning                (corerunning),
            .MULDIVREG                  (MULDIVREG[31:0]),
            .clrM                       (clrM),
            .ceM                        (ceM));
      end
   endgenerate
endmodule

// =============================================================================             
module m_inputmux_highlevel
  # ( parameter MULDIV = 1, 
      DAT_I_ZERO_WHEN_INACTIVE = 0, 
      IWIDTH = 8,  
      SRAMADRWIDTH = 0, 
      MTIMETAP = 0, 
      MTIMETAP_LOWLIM = 32 
      )
   (
    input              clk,
    input [31:0]       DAT_O, 
    input [IWIDTH-1:0] DAT_I, 
    input [31:0]       Dsram, 
    input [31:0]       ADR_O, 
    input              sra_msb, 
    input              sa00, 
    input              STB_O, 
    input              sram_ack, 
    input              mie, 
    input              mpie, 
    input              meie, 
    input              mrinstretie, 
    input              msie, 
    input              mtie, 
    input              mtimeincie, 
    input              mrinstretip, 
    input              msip, 
    input              mtip,
    input              mtimeincip, 
    input              meip, 
    input              qACK, 
    input              corerunning, 
    /* verilator lint_off UNUSED */
    input [31:0]       MULDIVREG, 
    input              clrM,
    input              ceM,
    /* verilator lint_on UNUSED */
    
    output             sysregack, 
    output [31:0]      Di, 
    output [31:0]      rDee, 
    output [31:0]      theio
    );
   wire [31:0]         shADR_O = {sra_msb,ADR_O[31:1]};
   
   generate
      
      // =======================================================
      // Last part
      // =======================================================
      reg              sa00mod;
      always @(posedge clk)
        sa00mod <=  ~(qACK | sram_ack | sa00 | ~corerunning);
      assign Di = sa00mod ? DAT_O : (DAT_O & rDee | ~DAT_O & shADR_O);
      
      wire [32:0]      zeros = 33'h0;
      
      // =======================================================
      // Potentially system registers
      // =======================================================
      if ( MTIMETAP < MTIMETAP_LOWLIM ) begin         
         // No system registers            
         if ( IWIDTH == 32 )
           assign theio = DAT_I[IWIDTH-1:0];
         else
           assign theio = {zeros[31:IWIDTH],DAT_I};
         assign sysregack = 1'b0;

      end else begin         
         // Has DAT_I and registers MIP, MIE and MSTATUS 
         wire [32:0] extDAT_I = {zeros[32:IWIDTH],DAT_I};
         //                     32-18 17          16         15-12   11   10-8 7    6-4  3    2-0 
         wire [31:0] MIP     = {14'h0,mrinstretip,mtimeincip,4'b0000,meip,3'h0,mtip,3'h0,msip,3'h0};
         wire [31:0] MIE     = {14'h0,mrinstretie,mtimeincie,4'b0000,meie,3'h0,mtie,3'h0,msie,3'h0};
         wire [31:0] MSTATUS = {14'h0,1'b0,       1'b0,      4'b0001,1'b1,3'h0,mpie,3'h0,mie, 3'h0};
         /* v erilator lint_off UNUSED */
         reg         aaa;
         /* v erilator lint_on UNUSED */
         reg [31:0]  defeatlattice_theio;
         
         always @(/*AS*/ADR_O or MIE or MIP or MSTATUS or extDAT_I) 
           case ( ADR_O[29:27] )
             3'b000 : { aaa, defeatlattice_theio} = {1'b0, extDAT_I[31:0]};
             3'b001 : { aaa, defeatlattice_theio} = {1'b0, extDAT_I[31:0]};
             3'b010 : { aaa, defeatlattice_theio} = {1'b0, extDAT_I[31:0]};
             3'b011 : { aaa, defeatlattice_theio} = {1'b0, extDAT_I[31:0]};
             3'b100 : { aaa, defeatlattice_theio} = {1'b0, extDAT_I[31:0]};
             3'b101 : { aaa, defeatlattice_theio} = {1'b1, MIP};
             3'b110 : { aaa, defeatlattice_theio} = {1'b1, MIE};
             3'b111 : { aaa, defeatlattice_theio} = {1'b1, MSTATUS};
           endcase
         assign theio = defeatlattice_theio;
         assign sysregack = aaa & STB_O;         
      end // MTIMETAP

      // =======================================================
      // Potentially SRAM
      // =======================================================
      if ( SRAMADRWIDTH == 0 ) begin
         // No SRAM
         reg [IWIDTH-1:0] r;
         wire [31:0]      eio;
         if ( IWIDTH == 32 )
           assign eio = theio[31:0];
         else
           assign eio = {zeros[31:IWIDTH],theio[IWIDTH-1:0]};
         
         always @(posedge clk)
           if ( corerunning )
             r <= STB_O ? eio : MULDIVREG;
         assign rDee = r;
         
      end else begin
         // Has SRAM
         reg [31:0] r;
         wire [31:0] cmb;

         if ( MULDIV == 0 ) begin
            assign cmb = STB_O ? theio : Dsram;
         end else begin
            wire ReadM = clrM & ceM; 
            wire STB_O_or_ReadM;
            wire [31:0] theio_or_M;
            assign STB_O_or_ReadM = STB_O | ReadM;

            if ( DAT_I_ZERO_WHEN_INACTIVE ) begin
               assign theio_or_M = theio | MULDIVREG;
            end else begin
               assign theio_or_M = ReadM ? MULDIVREG : theio;
            end
            assign cmb = STB_O_or_ReadM ? theio_or_M : Dsram;

         end
         always @(posedge clk)
           if ( corerunning )
             r <= cmb;
         assign rDee = r;
      end // SRAMADRWIDTH
   endgenerate


//   // To keep Verilator and SimplifyPro happy
//   assign m_inputmux_killwarnings = ADR_O[0] | mie | mpie | meie | mrinstretie | 
//                                    msie | mtie | mtimeincie | mrinstretip | 
//                                    mtimeincip | msip | mtip |
//                                    &zeros | meip | &Dsram | STB_O |
//                                    &MULDIVREG;   
endmodule

// =============================================================================             
/* Situations.  System registers, if available, are muxed with DAT_I, this
 * is not shown in these diagrams
 * 
 * No SRAM, MULDIV = 0, IWIDTH = 32. 
 *                                   sa00mod ---------+
 *                              __   DAT_O ----+-----|0\
 *                DAT_I -------|  |- rDee ----|0\    |  |-- Di
 *                             >  |           |  |---|1/
 *                corerunning -E__|  shADR_O--|1/               
 * 
 * No SRAM, MULDIV = 1, IWIDTH = 32. 
 * STB_O ------------+               sa00mod ---------+
 * DAT_I -----------|1\         __   DAT_O ----+-----|0\
 *                  |  |-------|  |- rDee ----|0\    |  |-- Di
 * MULDIVREG -------|0/        >  |           |  |---|1/
 *                corerunning -E__|  shADR_O--|1/               
 * 
 * SRAM, MULDIV = 0, IWIDTH = 32.
 * 
 * STB_O --------------------+
 *                           |               sa00mod ---------+         
 * DAT_I -------------------|1\         __   DAT_O ----+-----|0\        
 *                          |  |-------|  |- rDee ----|0\    |  |-- Di  
 * Dsram -------------------|0/        >  |           |  |---|1/        
 *                        corerunning -E__|  shADR_O--|1/               
 * 
 * 
 * 
 * SRAM, MULDIV = 1, DAT_I_ZERO_WHEN_INACTIVE = 1, IWIDTH = 32.
 * 
 * STB_O_or_ReadM -----------+
 *                 __        |               sa00mod ---------+         
 * DAT_I ---------|or|------|1\         __   DAT_O ----+-----|0\        
 * MULDIVREG -----|__|      |  |-------|  |- rDee ----|0\    |  |-- Di  
 * Dsram -------------------|0/        >  |           |  |---|1/        
 *                        corerunning -E__|  shADR_O--|1/               
 * 
 * 
 * SRAM, MULDIV = 1, DAT_I_ZERO_WHEN_INACTIVE = 0, IWIDTH = 32.
 * 
 * STB_O_or_ReadM -------+
 * STB_O ------+         |
 * MULDIVREG -|0\        |               sa00mod ---------+         
 *            |  |------|1\         __   DAT_O ----+-----|0\        
 * DAT_I -----|1/       |  |-------|  |- rDee ----|0\    |  |-- Di  
 * Dsram ---------------|0/        >  |           |  |---|1/        
 *                    corerunning -E__|  shADR_O--|1/               
 * 
 * 
 * 
 */
module m_inputmux_lowlevel
  # ( parameter MULDIV = 1, //         With MUL/DIV instructions?
      DAT_I_ZERO_WHEN_INACTIVE = 0, // With "wellbehaved" Wishbone input we may save 32 LUTs
      IWIDTH = 8,  //                  Can in principle be from 1 to 32. Usually 8, 16 or 32.
      SRAMADRWIDTH = 0, //             ice40hx1k and similar may have no SRAM
      MTIMETAP = 32, //                 Governs inclusion of registers
      MTIMETAP_LOWLIM = 32 //          Really a constant
      )
   (
    input              clk,
    input [31:0]       DAT_O, //       Output from EBR is input to mux
    input [IWIDTH-1:0] DAT_I, //       External input
    input [31:0]       Dsram, //       SRAM input
    input [31:0]       ADR_O, //       For address decoding 
    input              sra_msb, //     Msb to use when rightshifing ADR_O
    input              sa00, //        Main select signal
    input              STB_O, //       Selecte between SRAM and IO, must also give ack when systemregisters written
    input              sram_ack, //    Used to select data from SRAM/input devices
    input              mie, //         Machine Interrupt enable in MSTATUS
    input              mpie, //        Machine Previous Interrupt enable in MSTATUS
    input              meie, //        Machine External Interrupt Enable in MIE
    input              mrinstretie, // Machine Retired Instructions Retired Interrupt Enable in MIE. RENAME
    input              msie, //        Machine Software Interrupt Enable in MIE
    input              mtie, //        Machine Timer Interrupt Enable in MIE
    input              mtimeincie, //  Machine Time Increment Interrupt Enable in MIE
    input              mrinstretip, // Machine Retired Instructions Retired Interrupt Pending in MIP. RENAME
    input              msip, //        Machine Software Interrupt Pending in MIP
    input              mtip,//         Machine Timer Interrupt Pending in MIP
    input              mtimeincip, //  Machine Time Increment Interrupt Pending in MIP
    input              meip, //        Machine External Interrupt Pending in MIP
    input              qACK, //        Qualified acknowledge, usually (ACK_I | sysregack)
    input              corerunning, //
    /* verilator lint_off UNUSED */
    input [31:0]       MULDIVREG, //           When MUL/DIV
    input              clrM,
    input              ceM,
    /* verilator lint_on UNUSED */
    
    output             sysregack, //   Read/Write acknowledge from MIP/MIE/MSTATUS
    output [31:0]      Di, //          Data out of mux
    output [31:0]      rDee, //        Output for debugging purposes
    output [31:0]      theio //        Output for debugging purposes
    );
   wire [31:0]         shADR_O = {sra_msb,ADR_O[31:1]};
   wire [32:0]         zeros = 33'h0;
   
   // =======================================================
   generate

      // Last part
      // ---------
      // This is the last part of the input mux. The reason I put it first
      // is because there are placement constraints specified here, and
      // the "genblk" part of code out of Lattice iCECube2 should not jump
      // around.
      wire             cmb_sa00mod;
      wire             sa00mod;
      SB_LUT4 #(.LUT_INIT(16'h0100)) inst_presa00mod( .O(cmb_sa00mod), .I3(corerunning), .I2(sram_ack), .I1(qACK), .I0(sa00)); 
      SB_DFF sa00mod_r( .Q(sa00mod), .C(clk), .D(cmb_sa00mod));
      SB_LUT4 #(.LUT_INIT(16'hf0ca)) cmb [31:0] (.O(Di),.I3(sa00mod),.I2(DAT_O),.I1(rDee),.I0(shADR_O));
      
      
//      assign theio = ( IWIDTH == 32 ) ? DAT_I[IWIDTH-1:0] : {zeros[31:IWIDTH],DAT_I};
      if ( IWIDTH == 32 )
        assign theio = DAT_I[IWIDTH-1:0];
      else
        assign theio = {zeros[31:IWIDTH],DAT_I};
      
      if ( MTIMETAP < MTIMETAP_LOWLIM ) begin
         assign sysregack = 1'b0;  // No system registers
         wire [31:0] cDee;
         
         if ( SRAMADRWIDTH == 0 ) begin
            if ( MULDIV == 0 ) begin
               // No system registers, no SRAM, no MUL/DIV
               SB_LUT4 #(.LUT_INIT(16'haaaa)) l_cDee [31:0] (.O(cDee), .I3(1'b0), .I2(1'b0), .I1(1'b0), .I0(theio));
            end else begin
               // No system registers, no SRAM, MUL/DIV
               SB_LUT4 #(.LUT_INIT(16'hcaca)) l_cDee [31:0] (.O(cDee), .I3(1'b0), .I2(STB_O), .I1(theio), .I0(MULDIVREG));
            end
         end else begin
            if ( MULDIV == 0 ) begin
               // No system registers, SRAM, no MUL/DIV
               SB_LUT4 #(.LUT_INIT(16'hcaca)) l_cDee [31:0] (.O(cDee), .I3(1'b0), .I2(STB_O), .I1(theio), .I0(Dsram));
            end else begin
               wire STB_O_or_ReadM;
               SB_LUT4 #(.LUT_INIT(16'hf8f8)) l_STB_O_or_ReadM( .O(STB_O_or_ReadM), .I3(1'b0), .I2(STB_O), .I1(clrM), .I0(ceM));
               
               if ( DAT_I_ZERO_WHEN_INACTIVE == 1 ) begin
                  // No system registers, SRAM, MUL/DIV, DAT_I == 0 when inactive                  
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee [31:0] (.O(cDee), .I3(STB_O_or_ReadM), .I2(theio), .I1(MULDIVREG), .I0(Dsram));
               end else begin
                  // No system registers, SRAM, MUL/DIV, DAT_I may be != 0 when inactive
                  wire [31:0] mux_i_mul;
                  SB_LUT4 #(.LUT_INIT(16'hcaca)) l_mux_i_mul [31:0] (.O(mux_i_mul), .I3(1'b0), .I2(STB_O),          .I1(theio),     .I0(MULDIVREG));
                  SB_LUT4 #(.LUT_INIT(16'hcaca)) l_cDee [31:0]      (.O(cDee),      .I3(1'b0), .I2(STB_O_or_ReadM), .I1(mux_i_mul), .I0(Dsram));
               end
            end
         end
         SB_DFFE r_rDee [31:0] (.Q(rDee), .C(clk), .E(corerunning), .D(cDee) );

      end else begin

         SB_LUT4 #(.LUT_INIT(16'he000)) l_sysregack( .O(sysregack), .I3(STB_O), .I2(ADR_O[29]), .I1(ADR_O[28]), .I0(ADR_O[27]) ); // System registers ack
         
         if ( SRAMADRWIDTH == 0 ) begin
            if ( MULDIV == 0 ) begin
               // System registers, no SRAM, no MUL/DIV
               morework NotImplemented();
            end else begin
               // System registers, no SRAM, MUL/DIV
               morework NotImplemented();
            end 
         end else begin
            if ( MULDIV == 0 ) begin
               // System registers, SRAM, no MUL/DIV

               wire [31:0] cDee;
               wire   adrok; // = ADR_O[30:27] == 4'b1100 )
               SB_LUT4 #(.LUT_INIT(16'h1000)) l_adrok( .O(adrok), .I3(ADR_O[30]), .I2(ADR_O[29]),   .I1(ADR_O[28]), .I0(ADR_O[27]));
               genvar k = 0;
               
               for ( k = 0; k < 32; k = k + 1 ) begin
                  if ( k == 3 ) begin
                     //                  wire k3a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[3] ) | (~ADR_O[28] & ADR_O[27] & msip );
                     //                  wire k3b = ( ADR_O[28] & ~ADR_O[27] & msie     ) | ( ADR_O[28] & ADR_O[27] & mie  );
                     //                  assign cDee[3] = (~STB_O & Dsram[3]) | (STB_O & (k3a | k3b));
                     wire k3a,k3b;
                     SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k3a( .O(k3a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[3]), .I0(msip));
                     SB_LUT4 #(.LUT_INIT(16'hac00)) l_k3b( .O(k3b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(msie),     .I0(mie));
                     SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee3( .O(cDee[3]), .I3(STB_O), .I2(k3a), .I1(k3b), .I0(Dsram[3]));                  
                  end else if ( k == 7 ) begin
                     //                  wire k7a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[7] ) | (~ADR_O[28] & ADR_O[27] & mtip );
                     //                  wire k7b = ( ADR_O[28] & ~ADR_O[27] & mtie     ) | ( ADR_O[28] & ADR_O[27] & mpie );
                     //                  assign cDee[7] = (~STB_O & Dsram[7]) | (STB_O & (k7a | k7b));
                     wire k7a,k7b;
                     SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k7a( .O(k7a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[7]), .I0(mtip));
                     SB_LUT4 #(.LUT_INIT(16'hac00)) l_k7b( .O(k7b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtie),     .I0(mpie));
                     SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee7( .O(cDee[7]), .I3(STB_O), .I2(k7a), .I1(k7b), .I0(Dsram[7]));                  
                  end else if ( k == 11 ) begin
                     //                  wire k11a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[11] ) | (~ADR_O[28] & ADR_O[27] & meip );
                     //                  wire k11b = ( ADR_O[28] & ~ADR_O[27] & meie      ) | ( ADR_O[28] & ADR_O[27] & 1'b1 );
                     //                  assign cDee[11] = (~STB_O & Dsram[11]) | (STB_O & (k11a | k11b));
                     wire k11a,k11b;
                     SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k11a( .O(k11a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[11]), .I0(meip));
                     SB_LUT4 #(.LUT_INIT(16'hac00)) l_k11b( .O(k11b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(meie),      .I0(1'b1));
                     SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee11( .O(cDee[11]), .I3(STB_O), .I2(k11a), .I1(k11b), .I0(Dsram[11]));                  
                  end else if ( k == 12 ) begin
                     //                  wire k12 = (~ADR_O[28] & ~ADR_O[27] & DAT_I[12] ) | (ADR_O[28] & ADR_O[27]) ;
                     //                  assign cDee[12] = (~STB_O & Dsram[12]) | (STB_O & k12);
                     wire k12;
                     SB_LUT4 #(.LUT_INIT(16'hc2c2)) l_k12( .O(k12), .I3(1'b0), .I2(ADR_O[28]), .I1(ADR_O[27]), .I0(DAT_I[12]));
                     SB_LUT4 #(.LUT_INIT(16'hcaca)) l_cDee12( .O(cDee[12]), .I3(1'b0), .I2(STB_O), .I1(k12), .I0(Dsram[12]));                  
                  end else if ( k == 16 ) begin
                     //                  wire k16a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[16]  ) | (~ADR_O[28] & ADR_O[27] & mtimeincip );
                     //                  wire k16b = ( ADR_O[28] & ~ADR_O[27] & mtimeincie );
                     //                  assign cDee[16] = (~STB_O & Dsram[16]) | (STB_O & (k16a | k16b));
                     wire k16a,k16b;
                     SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k16a( .O(k16a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[16]), .I0(mtimeincip));
                     SB_LUT4 #(.LUT_INIT(16'hac00)) l_k16b( .O(k16b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtimeincie),.I0(1'b0));
                     SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee16( .O(cDee[16]), .I3(STB_O), .I2(k16a), .I1(k16b), .I0(Dsram[16]));                  
                  end else if ( k == 17 ) begin
                     /* STB_O
                      * |ADR_O[28:27]
                      * 0xx  Dsram[17]
                      * 100  DAT_I[17]
                      * 101  mrinstretip
                      * 110  mrinstretie
                      * 111  1'b0
                      * 
                      * ADR_O[28:27]
                      * ||  luta         lutb
                      * 00  DAT_I[17]    0
                      * 01  mrinstretip  0
                      * 10  0            mrinstretie
                      * 11  0            0
                      * 
                      * STB_O lutc
                      * 0     Dsram[17]
                      * 1     luta | lutb
                      * 
                      */
                     //                  wire k17a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[17]  ) | (~ADR_O[28] & ADR_O[27] & mrinstretip);
                     //                  wire k17b = ( ADR_O[28] & ~ADR_O[27] & mrinstretie);
                     //                  assign cDee[17] = (~STB_O & Dsram[17]) | (STB_O & (k17a | k17b));
                     wire k17a,k17b;
                     SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k17a( .O(k17a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[17]), .I0(mrinstretip));
                     SB_LUT4 #(.LUT_INIT(16'hac00)) l_k17b( .O(k17b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mrinstretie),.I0(1'b0));
                     SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_cDee17( .O(cDee[17]), .I3(STB_O), .I2(k17a), .I1(k17b), .I0(Dsram[17]));                  
                  end else begin
                     /*            
                      * For most bits:
                      * STB_O ----------------+ 
                      *                __     |
                      * ADR_O[30] ---o| &|    |     
                      * DAT_I[x] -----|__|---|1\    __
                      *                      |  |--|  |-- rDee[x]
                      * Dsram[x] ------------|0/   >__|
                      * 
                      */
                     SB_LUT4 #(.LUT_INIT(16'hc0aa)) l_mux( .O(cDee[k]), .I3(STB_O), .I2(adrok),   .I1(DAT_I[k]), .I0(Dsram[k]));
                  end
               end // for-loop
               SB_DFFE r_rDee [31:0] (.Q(rDee), .C(clk), .E(corerunning), .D(cDee) );

               
            end else begin
               if ( DAT_I_ZERO_WHEN_INACTIVE == 1 ) begin
                  // System registers, SRAM, MUL/DIV, DAT_I == 0 when inactive
               end else begin
                  // System registers, SRAM, MUL/DIV, DAT_I may be != 0 when inactive
               end
            end
         end
      end
   endgenerate
   
endmodule
      

               
               
            


//
//else begin         
//         // Has DAT_I and registers MIP, MIE and MSTATUS 
//            
//         genvar k;
//         for ( k = 0; k < 32; k = k + 1 ) begin
//            if ( k == 3 ) begin
//               //                  wire k3a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[3] ) | (~ADR_O[28] & ADR_O[27] & msip );
//               //                  wire k3b = ( ADR_O[28] & ~ADR_O[27] & msie     ) | ( ADR_O[28] & ADR_O[27] & mie  );
//               //                  assign theio[3] = (~STB_O & Dsram[3]) | (STB_O & (k3a | k3b));
//               wire k3a,k3b;
//               SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k3a( .O(k3a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[3]), .I0(msip));
//               SB_LUT4 #(.LUT_INIT(16'hac00)) l_k3b( .O(k3b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(msie),     .I0(mie));
//               SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio3( .O(theio[3]), .I3(STB_O), .I2(k3a), .I1(k3b), .I0(Dsram[3]));                  
//            end else if ( k == 7 ) begin
//               //                  wire k7a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[7] ) | (~ADR_O[28] & ADR_O[27] & mtip );
//               //                  wire k7b = ( ADR_O[28] & ~ADR_O[27] & mtie     ) | ( ADR_O[28] & ADR_O[27] & mpie );
//               //                  assign theio[7] = (~STB_O & Dsram[7]) | (STB_O & (k7a | k7b));
//               wire k7a,k7b;
//               SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k7a( .O(k7a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[7]), .I0(mtip));
//               SB_LUT4 #(.LUT_INIT(16'hac00)) l_k7b( .O(k7b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtie),     .I0(mpie));
//               SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio7( .O(theio[7]), .I3(STB_O), .I2(k7a), .I1(k7b), .I0(Dsram[7]));                  
//            end else if ( k == 11 ) begin
//               //                  wire k11a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[11] ) | (~ADR_O[28] & ADR_O[27] & meip );
//               //                  wire k11b = ( ADR_O[28] & ~ADR_O[27] & meie      ) | ( ADR_O[28] & ADR_O[27] & 1'b1 );
//               //                  assign theio[11] = (~STB_O & Dsram[11]) | (STB_O & (k11a | k11b));
//               wire k11a,k11b;
//               SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k11a( .O(k11a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[11]), .I0(meip));
//               SB_LUT4 #(.LUT_INIT(16'hac00)) l_k11b( .O(k11b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(meie),      .I0(1'b1));
//               SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio11( .O(theio[11]), .I3(STB_O), .I2(k11a), .I1(k11b), .I0(Dsram[11]));                  
//            end else if ( k == 12 ) begin
//               //                  wire k12 = (~ADR_O[28] & ~ADR_O[27] & DAT_I[12] ) | (ADR_O[28] & ADR_O[27]) ;
//               //                  assign theio[12] = (~STB_O & Dsram[12]) | (STB_O & k12);
//               wire k12;
//               SB_LUT4 #(.LUT_INIT(16'hc2c2)) l_k12( .O(k12), .I3(1'b0), .I2(ADR_O[28]), .I1(ADR_O[27]), .I0(DAT_I[12]));
//               SB_LUT4 #(.LUT_INIT(16'hcaca)) l_theio12( .O(theio[12]), .I3(1'b0), .I2(STB_O), .I1(k12), .I0(Dsram[12]));                  
//            end else if ( k == 16 ) begin
//               //                  wire k16a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[16]  ) | (~ADR_O[28] & ADR_O[27] & mtimeincip );
//               //                  wire k16b = ( ADR_O[28] & ~ADR_O[27] & mtimeincie );
//               //                  assign theio[16] = (~STB_O & Dsram[16]) | (STB_O & (k16a | k16b));
//               wire k16a,k16b;
//               SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k16a( .O(k16a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[16]), .I0(mtimeincip));
//               SB_LUT4 #(.LUT_INIT(16'hac00)) l_k16b( .O(k16b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtimeincie),.I0(1'b0));
//               SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio16( .O(theio[16]), .I3(STB_O), .I2(k16a), .I1(k16b), .I0(Dsram[16]));                  
//            end else if ( k == 17 ) begin
//               /* STB_O
//                * |ADR_O[28:27]
//                * 0xx  Dsram[17]
//                * 100  DAT_I[17]
//                * 101  mrinstretip
//                * 110  mrinstretie
//                * 111  1'b0
//                * 
//                * ADR_O[28:27]
//                * ||  luta         lutb
//                * 00  DAT_I[17]    0
//                * 01  mrinstretip  0
//                * 10  0            mrinstretie
//                * 11  0            0
//                * 
//                * STB_O lutc
//                * 0     Dsram[17]
//                * 1     luta | lutb
//                * 
//                */
//               //                  wire k17a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[17]  ) | (~ADR_O[28] & ADR_O[27] & mrinstretip);
//               //                  wire k17b = ( ADR_O[28] & ~ADR_O[27] & mrinstretie);
//               //                  assign theio[17] = (~STB_O & Dsram[17]) | (STB_O & (k17a | k17b));
//               wire k17a,k17b;
//               SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k17a( .O(k17a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[17]), .I0(mrinstretip));
//               SB_LUT4 #(.LUT_INIT(16'hac00)) l_k17b( .O(k17b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mrinstretie),.I0(1'b0));
//               SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio17( .O(theio[17]), .I3(STB_O), .I2(k17a), .I1(k17b), .I0(Dsram[17]));                  
//            end else begin
//               /*            
//                * For most bits:
//                * STB_O ----------------+ 
//                *                __     |
//                * ADR_O[30] ---o| &|    |     
//                * DAT_I[x] -----|__|---|1\    __
//                *                      |  |--|  |-- rDee[x]
//                * Dsram[x] ------------|0/   >__|
//                * 
//                */
//               wire adrok; // = ADR_O[30:27] == 4'b1100 )
//               SB_LUT4 #(.LUT_INIT(16'h1000)) l_adrok( .O(adrok), .I3(ADR_O[30]), .I2(ADR_O[29]),   .I1(ADR_O[28]), .I0(ADR_O[27]));
//               SB_LUT4 #(.LUT_INIT(16'hc0aa)) l_mux( .O(theio[k]), .I3(STB_O), .I2(adrok),   .I1(DAT_I[k]), .I0(Dsram[k]));
//            end
//         end // for-loop
//      end // MTIMETAP
//
//        
//      wire [31:0]   eio;
//      assign eio =  ( IWIDTH == 32 ) ? theio[31:0] : {zeros[31:IWIDTH],theio[IWIDTH:0]};
//      
//      if ( SRAMADRWIDTH == 0 ) begin
//         // No SRAM
//         wire [31:0] mux_i_m;         
//         SB_LUT4 #(.LUT_INIT(16'hcaca)) cmb_mux [31:0] ( .O(mux_i_m), .I3(1'b0), .I2(STB_O), .I1(eio), .I0(MULDIVREG));
//         SB_DFFE r_rDee [31:0] ( .Q(rDee), .C(clk), .E(corerunning), .D(mux_i_m));
//         
//      end else begin
//         // SRAM
//         if ( MULDIV == 0 ) begin
//            wire [31:0] mux_i_sram;
//            SB_LUT4 #(.LUT_INIT(16'hcaca)) cmb_mux_i_sram [31:0] ( .O(mux_i_sram), .I3(1'b0), .I2(STB_O), .I1(eio), .I0(
//            is good.
//         genvar jj;
//         for ( jj = 0; jj < 32; jj = jj + 1 ) begin
//            SB_DFFE holdinput( .Q(rDee[jj]), .C(clk), .E(corerunning), .D(theio[jj]) ); 
//         end
//      end



