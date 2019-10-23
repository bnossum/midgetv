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
 * 
 * The only difference between the DIN and SRAM input is that the
 * width of SRAM is fixed to 32 bits. Midgetv can execute
 * instructions read from a 32-bit DIN port.
 *  
 * The module can be compiled with no SRAM support. 
 * Size in LUTs:
 * SRAMADRWIDTH 
 * |    IWIDTH      Size in LUTs
 * 0    iwidth      33 + iwidth
 * !=0  x           65
 * 
 */
module m_inputmux
  # ( parameter HIGHLEVEL = 0, // 
      IWIDTH = 8,  //             Can in principle be from 1 to 32. Usually 8, 16 or 32.
      SRAMADRWIDTH = 0, //        ice40hx1k and similar has no SRAM
      MTIMETAP = 0, //            Governs inclusion of registers
      MTIMETAP_LOWLIM = 32 //     Really a constant
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
    
    output             sysregack, //   Read/Write acknowledge from MIP/MIE/MSTATUS
    output [31:0]      Di, //          Data out of mux
    output [31:0]      rDee, //        Output for debugging purposes
    output [31:0]      theio, //       Output for debugging purposes
    output             m_inputmux_killwarnings // No need to connect
    );
   wire [31:0]         shADR_O = {sra_msb,ADR_O[31:1]};

   // =======================================================
   // Last part
   // ---------
   // This is the last part of the input mux. The reason I put it first
   // is because there are placement constraints specified here, and
   // the "genblk" part of code out of Lattice IceCobe should not jump
   // around.
   generate
      if ( HIGHLEVEL ) begin

         // =======================================================
         // HIGLEVEL
         // =======================================================
         
         reg sa00mod;
         always @(posedge clk)
           sa00mod <=  ~(qACK | sram_ack | sa00 | ~corerunning);
         assign Di = sa00mod ? DAT_O : (DAT_O & rDee | ~DAT_O & shADR_O);

      end else begin

         // =======================================================
         // LOWLEVEL
         // =======================================================
         
         genvar j;
         wire   cmb_sa00mod;
         wire   sa00mod;
         SB_LUT4 #(.LUT_INIT(16'h0100)) inst_presa00mod( .O(cmb_sa00mod), .I3(corerunning), .I2(sram_ack), .I1(qACK), .I0(sa00)); 
         SB_DFF sa00mod_r( .Q(sa00mod), .C(clk), .D(cmb_sa00mod));
         for ( j = 0; j < 32; j = j + 1 ) begin
            SB_LUT4 #(.LUT_INIT(16'hf0ca)) cmb(.O(Di[j]),.I3(sa00mod),.I2(DAT_O[j]),.I1(rDee[j]),.I0(shADR_O[j]));
         end
         
      end
   endgenerate
   
   generate
      wire [32:0]      zeros = 33'h0;

      if ( MTIMETAP < MTIMETAP_LOWLIM ) begin
         
         // =======================================================
         // No system registers
         // =======================================================
            
         if ( IWIDTH == 32 )
           assign theio = DAT_I[IWIDTH-1:0];
         else
           assign theio = {zeros[31:IWIDTH],DAT_I};
         assign sysregack = 1'b0;
      end else begin         
         /* Has DAT_I and registers MIP, MIE and MSTATUS 
          */

         if ( HIGHLEVEL ) begin

            // =======================================================
            // Has system registers, HIGLEVEL
            // =======================================================
            
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

         end else begin

            // =======================================================
            // Has system register, LOWLEVEL
            // =======================================================
            
            SB_LUT4 #(.LUT_INIT(16'he000)) l_sysregack(   .O(sysregack),   .I3(STB_O), .I2(ADR_O[29]), .I1(ADR_O[28]), .I0(ADR_O[27]) ); // 
            genvar k;
            for ( k = 0; k < 32; k = k + 1 ) begin
               if ( k == 3 ) begin
//                  wire k3a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[3] ) | (~ADR_O[28] & ADR_O[27] & msip );
//                  wire k3b = ( ADR_O[28] & ~ADR_O[27] & msie     ) | ( ADR_O[28] & ADR_O[27] & mie  );
//                  assign theio[3] = (~STB_O & Dsram[3]) | (STB_O & (k3a | k3b));
                  wire k3a,k3b;
                  SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k3a( .O(k3a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[3]), .I0(msip));
                  SB_LUT4 #(.LUT_INIT(16'hac00)) l_k3b( .O(k3b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(msie),     .I0(mie));
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio3( .O(theio[3]), .I3(STB_O), .I2(k3a), .I1(k3b), .I0(Dsram[3]));                  
               end else if ( k == 7 ) begin
//                  wire k7a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[7] ) | (~ADR_O[28] & ADR_O[27] & mtip );
//                  wire k7b = ( ADR_O[28] & ~ADR_O[27] & mtie     ) | ( ADR_O[28] & ADR_O[27] & mpie );
//                  assign theio[7] = (~STB_O & Dsram[7]) | (STB_O & (k7a | k7b));
                  wire k7a,k7b;
                  SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k7a( .O(k7a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[7]), .I0(mtip));
                  SB_LUT4 #(.LUT_INIT(16'hac00)) l_k7b( .O(k7b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtie),     .I0(mpie));
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio7( .O(theio[7]), .I3(STB_O), .I2(k7a), .I1(k7b), .I0(Dsram[7]));                  
               end else if ( k == 11 ) begin
//                  wire k11a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[11] ) | (~ADR_O[28] & ADR_O[27] & meip );
//                  wire k11b = ( ADR_O[28] & ~ADR_O[27] & meie      ) | ( ADR_O[28] & ADR_O[27] & 1'b1 );
//                  assign theio[11] = (~STB_O & Dsram[11]) | (STB_O & (k11a | k11b));
                  wire k11a,k11b;
                  SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k11a( .O(k11a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[11]), .I0(meip));
                  SB_LUT4 #(.LUT_INIT(16'hac00)) l_k11b( .O(k11b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(meie),      .I0(1'b1));
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio11( .O(theio[11]), .I3(STB_O), .I2(k11a), .I1(k11b), .I0(Dsram[11]));                  
               end else if ( k == 12 ) begin
//                  wire k12 = (~ADR_O[28] & ~ADR_O[27] & DAT_I[12] ) | (ADR_O[28] & ADR_O[27]) ;
//                  assign theio[12] = (~STB_O & Dsram[12]) | (STB_O & k12);
                  wire k12;
                  SB_LUT4 #(.LUT_INIT(16'hc2c2)) l_k12( .O(k12), .I3(1'b0), .I2(ADR_O[28]), .I1(ADR_O[27]), .I0(DAT_I[12]));
                  SB_LUT4 #(.LUT_INIT(16'hcaca)) l_theio12( .O(theio[12]), .I3(1'b0), .I2(STB_O), .I1(k12), .I0(Dsram[12]));                  
               end else if ( k == 16 ) begin
//                  wire k16a = (~ADR_O[28] & ~ADR_O[27] & DAT_I[16]  ) | (~ADR_O[28] & ADR_O[27] & mtimeincip );
//                  wire k16b = ( ADR_O[28] & ~ADR_O[27] & mtimeincie );
//                  assign theio[16] = (~STB_O & Dsram[16]) | (STB_O & (k16a | k16b));
                  wire k16a,k16b;
                  SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k16a( .O(k16a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[16]), .I0(mtimeincip));
                  SB_LUT4 #(.LUT_INIT(16'hac00)) l_k16b( .O(k16b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mtimeincie),.I0(1'b0));
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio16( .O(theio[16]), .I3(STB_O), .I2(k16a), .I1(k16b), .I0(Dsram[16]));                  
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
//                  assign theio[17] = (~STB_O & Dsram[17]) | (STB_O & (k17a | k17b));
                  wire k17a,k17b;
                  SB_LUT4 #(.LUT_INIT(16'h00ac)) l_k17a( .O(k17a), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(DAT_I[17]), .I0(mrinstretip));
                  SB_LUT4 #(.LUT_INIT(16'hac00)) l_k17b( .O(k17b), .I3(ADR_O[28]), .I2(ADR_O[27]), .I1(mrinstretie),.I0(1'b0));
                  SB_LUT4 #(.LUT_INIT(16'hfcaa)) l_theio17( .O(theio[17]), .I3(STB_O), .I2(k17a), .I1(k17b), .I0(Dsram[17]));                  
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
                  wire adrok; // = ADR_O[30:27] == 4'b1100 )
                  SB_LUT4 #(.LUT_INIT(16'h1000)) l_adrok( .O(adrok), .I3(ADR_O[30]), .I2(ADR_O[29]),   .I1(ADR_O[28]), .I0(ADR_O[27]));
                  SB_LUT4 #(.LUT_INIT(16'hc0aa)) l_mux( .O(theio[k]), .I3(STB_O), .I2(adrok),   .I1(DAT_I[k]), .I0(Dsram[k]));
               end
            end // for-loop
         end // HIGHLEVEL
      end // MTIMETAP
   endgenerate

   generate
      if ( SRAMADRWIDTH == 0 ) begin

         // =======================================================
         // No SRAM
         // =======================================================
           
         /* Inevitably we will have through LUTs here. Without 
          * taking great liberties with the whishbone interface it 
          * is not easy to put these LUT's to use. Because I search 
          * for and eliminates constructs named *THRU* I make a
          * low level construct to hide these in lowlevel code.
          */

         if ( HIGHLEVEL ) begin 
            reg [IWIDTH-1:0] r;
            always @(posedge clk)
              if ( corerunning )
                r <= theio[IWIDTH-1:0];
            if ( IWIDTH == 32 )
              assign rDee = r;
            else
              assign rDee = {zeros[31:IWIDTH],r};
         end else begin
            genvar kkk;
            wire [IWIDTH-1:0] vanity;
            for ( kkk = 0; kkk < 32; kkk = kkk + 1 ) begin
               if ( kkk < IWIDTH ) begin
                  SB_LUT4 #(.LUT_INIT(16'haaaa)) vanity_cmb( .O(vanity[kkk]), .I3(1'b0), .I2(1'b0), .I1(1'b0), .I0(theio[kkk]));
                  SB_DFFE vanity_r( .Q(rDee[kkk]), .C(clk), .E(corerunning), .D(vanity[kkk])); 
               end else begin
                  assign rDee[kkk] = 1'b0;
               end
            end
         end
         
      end else begin

         if ( HIGHLEVEL ) begin

            // =======================================================
            // SRAM, HIGHLEVEL
            // =======================================================
            
            reg [31:0] r;
            always @(posedge clk)
              if ( corerunning )
                r <= STB_O ? theio : Dsram;
            assign rDee = r;

         end else begin

            // =======================================================
            // SRAM, LOWLEVEL
            // =======================================================
            
            genvar jj;
            for ( jj = 0; jj < 32; jj = jj + 1 ) begin
               SB_DFFE holdinput( .Q(rDee[jj]), .C(clk), .E(corerunning), .D(theio[jj]) ); 
            end
            
         end
            
      end
   endgenerate
   
   // To keep Verilator happy
   assign m_inputmux_killwarnings = ADR_O[0] | mie | mpie | meie | mrinstretie | 
                                    msie | mtie | mtimeincie | mrinstretip | 
                                    mtimeincip | msip | mtip |
                                    &zeros | meip | &Dsram | STB_O;
   
endmodule
