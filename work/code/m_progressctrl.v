/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
 * This module is actually several smallish modules in one.
 */
module m_progressctrl
  #( parameter HIGHLEVEL = 0, SRAMADRWIDTH = 0, MULDIV  = 1,
     NO_CYCLECNT = 0, MTIMETAP = 0, MTIMETAP_LOWLIM = 32, DISREGARD_WB4_3_55 = 0, RVC = 0) 
   (
    input        clk, //            System clock
    input        corerunning, //    Avoid writing of registers when we are not running
    input        RST_I, //          Non-maskable interrupt
    input        ACK_I, //          Acknowledge from I/O device.
    input        sram_ack, //       Acknowledge from SRAM (if SRAMADRWIDTH != 0)
    input        sa15, //           Part of enable for Q
    input        sa27,sa26, //      Controls EBR write address mux
    input        sa25,sa24, //      Controls EBR write address mux
    input        sa32, //           read input
    input        sa41, //           Latch SEL_O
    input        sa33, //           Repeat shr until shreg == 0
    input        sa42, //           Possibly activate STB_O, sram_stb
    input        sa43, //           Possibly activate WE_O
    input        sa14, //           Needed to deactivate WE_O
    input        sa30, //           Special case, strobe for "SW" must respect word alignment
    input        lastshift, //      To halt progress of microcode etc
    input        rlastshift, //     To halt progress of microcode etc
    input [31:0] B, //              Do we access SRAM or I/O? Also used when RVC included
    input        buserror, //       When we have bus error we must have forward progress in ucode
    /* verilator lint_off UNUSED */
    input        sysregack, //      Acknowledge from system registers (if MTIMETAP >= MTIMETAP_LOWLIM)
    input        sa12, //           Capturing the instruction
    input [17:0] Di, //             To find out if an instruction is RVC
    input        alu_carryout, //   For DIV
    input        clrM, //           For DIV
    input        ceM, //            For DIV
    input        isDIVREM, //
    input        lastshiftoverride,// Update Q even if lastshift is true in MULx instructions
    input        sa20, //           For RVC need to decode Wpc
    input        sa21, //
    input        sa22, //
    input        sa23, //

    //     
    /* verilator lint_on UNUSED */
    
    output [3:0] SEL_O, //          Byte selects for SRAM and outputs
    output [3:0] bmask, //          SEL_O is unfortunately also needed in an active low version for EBR
                                   
    output       iwe, //            Write of EBR
    output       ctrlreg_we, //     Write control registers in EBR space.   
    output       WE_O, //           Write to Output or SRAM   
    output       STB_O, //          Operation on I/O
    output       sram_stb, //       Operation on SRAM
    output       enaQ, //           Sample output from ALU
    output       progress_ucode, // Continue execution of microcode
    output       qACK, //           Qualified acknowledge, usually (ACK_I | sysregack)
    output       next_STB_O, //     Output for debugging
    output       next_sram_stb, //  Output for debugging
    output       cond_holdq, //     During divide.

    output       pcinc_by_2, //      True only when updating PC after a RVC instruction or in an unaligned 32-bit instruction
    output       pc1, //             Mirror of pc[1] used when RVC instructions implemented
    output       was_rvc_instr, //   To correctly chose ucodepc
    output       luh, //             Load upper halfword of instruction
    
    output       m_progressctrl_killwarnings // Dummy
   );

   // To investigate implementation sizes           HIGH LOW     LOW better by
   localparam sel_o_HIGHLEVEL  = HIGHLEVEL | 0; //  369  365     4  
   localparam stb_HIGHLEVEL    = HIGHLEVEL | 1; //  
   localparam we_HIGHLEVEL     = HIGHLEVEL | 1; //  229  230     -1 Note, if ACK_I = STB_O, Lattice simplifies, this give no good estimate on size
   //                                                               I still don't understand where synthesis can save a LUT.
//Work on enaQ_HIGHLEVEL == 0   
   localparam enaQ_HIGHLEVEL   = HIGHLEVEL | 1; //  363  361     2   when SRAMADRWIDTH != 0 NO_CYCLECNT = 0
   //                                               227  228     0   when SRAMADRWIDTH == 0 NO_CYCLECNT = 0
   //                                                    
   localparam iwe_HIGHLEVEL    = HIGHLEVEL | 0; //  361  361     0
   localparam qACK_HIGHLEVEL   = HIGHLEVEL | 0; //  229  229     0  when DISREGARD_WB4_3_55 == 1. 
   //                                           //  231  231     0  when DISREGARD_WB4_3_55 == 0. 
   localparam RVC_HIGHLEVEL    = HIGHLEVEL | 0;
   
   /* during write to registers in output devices, 
    * writes to SRAM,  EBR, we need byte selects. 
    * Non-maskable interrupt clears registers.
    */
   generate
      if ( sel_o_HIGHLEVEL ) begin

         wire [5:0]    what_sel_o = {sa27,sa26,sa25,sa24,B[1:0]};
         reg [3:0]     aSEL_O; // combinatorical
         reg [3:0]     rSEL_O;
         reg [3:0]     rbmask;
         always @(*) begin
            case ( what_sel_o )
              6'b0001_00 : aSEL_O = 4'b0011;
              6'b0001_10 : aSEL_O = 4'b1100;
              6'b0010_00 : aSEL_O = 4'b0001;
              6'b0010_01 : aSEL_O = 4'b0010;
              6'b0010_10 : aSEL_O = 4'b0100;
              6'b0010_11 : aSEL_O = 4'b1000;
              default :    aSEL_O = 4'b1111;
            endcase
         end   
         always @(posedge clk)
           if ( RST_I ) begin
              rSEL_O <= 4'h0;
              rbmask <= 4'hf;        
           end else if ( sa41 ) begin
              rSEL_O <= aSEL_O;
              rbmask <= ~aSEL_O;
           end
         assign SEL_O = rSEL_O;
         assign bmask = rbmask;

      end else begin : blka
         wire [3:0] cmb_asel,cmb_bsel;
         wire       usedefault,en;
         
         SB_LUT4 #(.LUT_INIT(16'hfff9)) l_usedefault( .O(usedefault), .I3(sa27), .I2(sa26), .I1(sa25), .I0(sa24));
         SB_LUT4 #(.LUT_INIT(16'h004e)) l_cmb_bsel0( .O(cmb_bsel[0]), .I3(usedefault), .I2(sa24), .I1(B[1]), .I0(B[0]));
         SB_LUT4 #(.LUT_INIT(16'h004d)) l_cmb_bsel1( .O(cmb_bsel[1]), .I3(usedefault), .I2(sa24), .I1(B[1]), .I0(B[0]));
         SB_LUT4 #(.LUT_INIT(16'h001b)) l_cmb_bsel2( .O(cmb_bsel[2]), .I3(usedefault), .I2(sa24), .I1(B[1]), .I0(B[0]));
         SB_LUT4 #(.LUT_INIT(16'h0017)) l_cmb_bsel3( .O(cmb_bsel[3]), .I3(usedefault), .I2(sa24), .I1(B[1]), .I0(B[0]));
         SB_LUT4 #(.LUT_INIT(16'h0F0F)) l_cmb_asel0( .O(cmb_asel[0]), .I3(1'b0), .I2(cmb_bsel[0]), .I1(1'b0), .I0(1'b0));
         SB_LUT4 #(.LUT_INIT(16'h0F0F)) l_cmb_asel1( .O(cmb_asel[1]), .I3(1'b0), .I2(cmb_bsel[1]), .I1(1'b0), .I0(1'b0));
         SB_LUT4 #(.LUT_INIT(16'h0F0F)) l_cmb_asel2( .O(cmb_asel[2]), .I3(1'b0), .I2(cmb_bsel[2]), .I1(1'b0), .I0(1'b0));
         SB_LUT4 #(.LUT_INIT(16'h0F0F)) l_cmb_asel3( .O(cmb_asel[3]), .I3(1'b0), .I2(cmb_bsel[3]), .I1(1'b0), .I0(1'b0));

         SB_LUT4 #(.LUT_INIT(16'heeee)) l_en( .O(en), .I3(1'b0), .I2(1'b0), .I1(RST_I), .I0(sa41) );
         SB_DFFESS r_bsel0( .Q(bmask[0]), .C(clk), .E(en), .S(RST_I), .D(cmb_bsel[0]));
         SB_DFFESS r_bsel1( .Q(bmask[1]), .C(clk), .E(en), .S(RST_I), .D(cmb_bsel[1]));
         SB_DFFESS r_bsel2( .Q(bmask[2]), .C(clk), .E(en), .S(RST_I), .D(cmb_bsel[2]));
         SB_DFFESS r_bsel3( .Q(bmask[3]), .C(clk), .E(en), .S(RST_I), .D(cmb_bsel[3]));
         SB_DFFESR r_asel0( .Q(SEL_O[0]), .C(clk), .E(en), .R(RST_I), .D(cmb_asel[0]));
         SB_DFFESR r_asel1( .Q(SEL_O[1]), .C(clk), .E(en), .R(RST_I), .D(cmb_asel[1]));
         SB_DFFESR r_asel2( .Q(SEL_O[2]), .C(clk), .E(en), .R(RST_I), .D(cmb_asel[2]));
         SB_DFFESR r_asel3( .Q(SEL_O[3]), .C(clk), .E(en), .R(RST_I),. D(cmb_asel[3]));

      end
   endgenerate

   wire             badalignment;
   generate
      if ( stb_HIGHLEVEL == 0 || we_HIGHLEVEL == 0 ) begin
         SB_LUT4 #(.LUT_INIT(16'he0ff)) l_badalignment( .O(badalignment), .I3(corerunning), .I2(sa30), .I1(B[1]), .I0(B[0]));
      end else begin
         assign badalignment = ~corerunning | (sa30 & (B[1] | B[0])); // 
      end
   endgenerate
   
   wire clrregs;
   generate      
      if ( stb_HIGHLEVEL ) begin
            
         /* Strobes and acks
          * If sa42 and B[31:28] == 2'b01, STB_O is set next cycle.
          * It remains set until we get ACK_I or sysregack
          * Similarly for sram_stb.
          * 
          * A special case for "SW". If the address is not word aligned, we
          * will not give a strobe. (There is no such special case for "SH",
          * because the decission to give strobe is done some ucode cycles
          * after the address is checked).
          * 
          * Non-maskable interrupt clears registers.
          */
         reg rSTB_O;
         reg rsram_stb;
         assign next_STB_O    = (sa42 & ~B[31] & B[30] & ~badalignment) | (rSTB_O    & ~qACK );
         assign next_sram_stb = (sa42 &  B[31]         & ~badalignment) | (rsram_stb & ~sram_ack);
         always @(posedge clk) 
           if ( RST_I | buserror ) begin
              rSTB_O <= 1'b0;
              rsram_stb <= 1'b0;
           end else begin
              rSTB_O    <= next_STB_O;
              rsram_stb <= next_sram_stb;
           end
         assign STB_O = rSTB_O;
         assign sram_stb = rsram_stb;
         assign clrregs = 0; // Keep Verilator happy
      end else begin
         
         wire help1;
//         assign help1 = sa42 & ~B[31] & B[30] & ~badalignment;
//         assign h0 = sa42 &  B[31] & ~badalignment
//         assign clrregs = RST_I | buserror;
//         assign next_STB_O = help1 | (STB_O & ~qACK);
//         next_sram_stb = ~clrregs & (h2 | (sram_stb & ~sram_ack) 

         if ( NO_CYCLECNT == 0 )  begin
            SB_LUT4 #(.LUT_INIT(16'h0400)) l_help1(.O(help1), .I3(sa42), .I2(B[31]), .I1(B[30]), .I0(badalignment)); 
            SB_LUT4 #(.LUT_INIT(16'hf4f4)) l_next_STB_O( .O(next_STB_O), .I3(1'b0), .I2(help1), .I1(STB_O), .I0(qACK)); 
            SB_LUT4 #(.LUT_INIT(16'heeee)) l_clrregs(.O(clrregs), .I3(1'b0), .I2(1'b0), .I1(RST_I), .I0(buserror));
            SB_DFFSR r_STB_O(    .Q(STB_O),    .C(clk), .R(clrregs), .D(next_STB_O));
         end else begin
            //assign next_STB_O    = (sa42 & ~B[31] & B[30] & ~badalignment) | (rSTB_O & ~qACK ) & ~RST_I;
            SB_LUT4 #(.LUT_INIT(16'h0400)) l_help1(.O(help1), .I3(sa42), .I2(B[31]), .I1(B[30]), .I0(badalignment));
            SB_LUT4 #(.LUT_INIT(16'h00f4)) l_next_STB_O(.O(next_STB_O), .I3(RST_I), .I2(help1), .I1(STB_O), .I0(qACK));
            SB_DFF r_STB_O( .Q(STB_O), .C(clk), .D(next_STB_O));
            assign clrregs = RST_I;
         end
         if ( SRAMADRWIDTH == 0 ) begin
            assign next_sram_stb = 1'b0;
            assign sram_stb = 1'b0;
         end else begin
            wire h2;
            SB_LUT4 #(.LUT_INIT(16'h4040)) l_h2(.O(h2), .I3(1'b0), .I2(sa42), .I1(B[31]), .I0(badalignment)); 
            SB_LUT4 #(.LUT_INIT(16'hf4f4)) l_next_sram_stb( .O(next_sram_stb), .I3(1'b0), .I2(h2), .I1(sram_stb), .I0(sram_ack)); 
            SB_DFFSR r_sram_stb( .Q(sram_stb), .C(clk), .R(clrregs), .D(next_sram_stb));
         end
         
      end
   endgenerate
   
   generate
      if ( we_HIGHLEVEL ) begin

         /* Write enable is set when we do a write to either SRAM or I/O, cleared when ADR_O is cleared.
          * ctrlreg_we is set when we write to address 0x2xxxxxxx.
          * 
          * A special case for "SW". If the address is not word aligned, we
          * do not give WE_O. See above for STB_O.
          * 
          * Non-maskable interrupt clears registers
          */
         reg rWE_O,rctrlreg_we;
         wire next_WE_O = (B[31] | B[30]) & ~badalignment;
         wire next_ctrlreg_we = (B[31:28] == 4'b0010) & ~badalignment;
         always @(posedge clk)
           if ( (~sa14 | RST_I | buserror) ) begin
              rWE_O       <= 1'b0;
              rctrlreg_we <= 1'b0;
           end else if ( sa43 & ~buserror ) begin
              rWE_O       <= next_WE_O;
              rctrlreg_we <= next_ctrlreg_we;
           end
         assign WE_O = rWE_O;
         assign ctrlreg_we = rctrlreg_we;         

      end else begin

         wire next_WE_O,next_ctrlreg_we;
         wire clearweregs,updateweregs,ioregion;
//         assign ioregion = B[31:28] == 4'b0010;
//         assign clearweregs = (~sa14 | RST_I | buserror);
//         assign next_WE_O       = ~clearweregs & ((B[31] | B[30])       & ~badalignment);
//         assign next_ctrlreg_we = ~clearweregs & ( ioregion & ~badalignment);
//         assign updateweregs = (sa43 & ~buserror) | clearweregs;
         SB_LUT4 #(.LUT_INIT(16'h0004)) l_ioregion(.O(ioregion), .I3(B[31]), .I2(B[30]), .I1(B[29]), .I0(B[28]));
//         SB_LUT4 #(.LUT_INIT(16'hfefe)) l_clearweregs(.O(clearweregs), .I3(1'b0), .I2(sa14), .I1(RST_I), .I0(buserror)); 
         SB_LUT4 #(.LUT_INIT(16'h7f7f)) l_clearweregs(.O(clearweregs), .I3(1'b0), .I2(sa14), .I1(RST_I), .I0(buserror)); 
         SB_LUT4 #(.LUT_INIT(16'h000e)) l_next_WE_O(.O(next_WE_O), .I3(clearweregs), .I2(badalignment), .I1(B[31]), .I0(B[30]));

         SB_LUT4 #(.LUT_INIT(16'hf4f4)) I_updateweregs( .O(updateweregs), .I3(1'b0), .I2(clearweregs), .I1(sa43), .I0(buserror));
         SB_DFFE r_WE_O(       .Q(WE_O),       .C(clk), .E(updateweregs), .D(next_WE_O) );

         if ( MTIMETAP < MTIMETAP_LOWLIM ) begin
            assign ctrlreg_we = 1'b0;
         end else begin
            SB_LUT4 #(.LUT_INIT(16'h0202)) I_next_ctrlreg_we(.O(next_ctrlreg_we), .I3(1'b0), .I2(clearweregs), .I1(badalignment), .I0(ioregion));
            SB_DFFE r_ctrlreg_we( .Q(ctrlreg_we), .C(clk), .E(updateweregs), .D(next_ctrlreg_we) );
         end

      end
   endgenerate
      
   
   /* Register ADR_O holds the address when we read and write.
    * When an ack is seen it is sampled with the data.
    * When we ask for a shift of 0, it is held.
    * 
    * sa32
    * |sa15  Codes in ucode.h
    * 00     Qzh,Qhld,Qx
    * 01     Qu,Qshr,Qz,Qzh,Qudec,Qx
    * 10     Qextra
    * 11     Qs.Qcndz
    */
   generate
      if ( SRAMADRWIDTH != 0 ) begin
         if ( enaQ_HIGHLEVEL ) begin
            if ( MULDIV == 0 ) begin
               assign cond_holdq = 0;
               assign enaQ = (sa15 | sa32) & ~lastshift & ~(STB_O | sram_stb);
            end else begin
               wire mod_lastshift = lastshift & ~lastshiftoverride;
               assign cond_holdq = ~alu_carryout & clrM & ~ceM & isDIVREM;
               assign enaQ = ((sa15 | sa32) & ~mod_lastshift & ~(STB_O | sram_stb)) & ~cond_holdq;
            end
            assign progress_ucode = ((~sa33 | lastshift | rlastshift) & ~(STB_O | sram_stb)) | buserror;
         end else begin
            wire h3,hcy;
//            assign h1 = ~sa33 | lastshift | rlastshift;
//            assign progress_ucode = (h1 & ~(STB_O | sram_stb)) | buserror;
//            assign hcy = STB_O | sram_stb;
//            assign enaQ = (sa15 | sa32) & ~lastshift & ~hcy;
//se next line SB_LUT4 #(.LUT_INIT(16'hdfdf)) l_h3(.O(h3), .I3(1'b0), .I2(sa33), .I1(lastshift), .I0(r_issh0_not));
            SB_LUT4 #(.LUT_INIT(16'hefef)) l_h3(.O(h3), .I3(1'b0), .I2(sa33), .I1(lastshift), .I0(rlastshift));
            SB_LUT4 #(.LUT_INIT(16'hff02)) l_progress_ucode(.O(progress_ucode), .I3(buserror), .I2(STB_O), .I1(sram_stb), .I0(h3));
            SB_CARRY l_hcy(.CO(hcy), .CI(1'b1), .I1(STB_O), .I0(sram_stb));
            SB_LUT4 #(.LUT_INIT(16'h000e)) l_enaQ(.O(enaQ), .I3(hcy), .I2(lastshift), .I1(sa15), .I0(sa32));
         end
      end else begin
         if ( enaQ_HIGHLEVEL ) begin
            if ( MULDIV == 0 ) begin
               assign cond_holdq = 0;
               assign enaQ = (sa15 | sa32) & ~lastshift & ~STB_O;
            end else begin
               wire mod_lastshift = lastshift & ~lastshiftoverride;
               assign cond_holdq = ~alu_carryout & clrM & ~ceM & isDIVREM;
               assign enaQ = ((sa15 | sa32) & ~mod_lastshift & ~STB_O) & ~cond_holdq;
            end
            assign progress_ucode = ((~sa33 | lastshift | rlastshift) & ~STB_O) | buserror;
         end else begin
//            assign enaQ            = (sa15 | sa32) & ~lastshift   & ~STB_O;
//            assign progress_ucode = ((~sa33 | lastshift | rlastshift) & ~STB_O) | buserror;
            wire g1;
            
            SB_LUT4 #(.LUT_INIT(16'h000e)) l_enaQ(.O(enaQ), .I3(STB_O), .I2(lastshift), .I1(sa15), .I0(sa32)); //correct
//            SB_LUT4 #(.LUT_INIT(16'h000e)) l_enaQ(.O(enaQ), .I3(STB_O), .I2(lastshift), .I1(sa15), .I0(alu_carryout)); // test

//see next line            SB_LUT4 #(.LUT_INIT(16'h00f7)) l_g1(.O(g1), .I3(STB_O), .I2(lastshift), .I1(sa33), .I0(r_issh0_not));
            SB_LUT4 #(.LUT_INIT(16'h00fb)) l_g1(.O(g1), .I3(STB_O), .I2(lastshift), .I1(sa33), .I0(rlastshift)); 
            SB_LUT4 #(.LUT_INIT(16'heeee)) I_progress_ucode(.O(progress_ucode), .I3(1'b0), .I2(1'b0), .I1(buserror), .I0(g1));
         end
      end
   endgenerate

   generate
      if ( iwe_HIGHLEVEL ) begin
         /* Internal write enable to EBR, mostly active, but not active when:
          *     sa41 == 1         Wnn, Wbp, Whp, Sets up SEL_O
          *     WE_O              We write to SRAM or I/O
          *     rlastshift == 1   Shift right, but inhibit because we want shift 0 
          * 
          * To avoid a potential write the very first active cycle, we qualify write with corerunning.
          * Work. Check if this is really needed.
          */
         wire avoid_iwe = sa41 | WE_O | rlastshift;
         assign iwe = ~avoid_iwe & corerunning;
      end else begin
//see next line            SB_LUT4 #(.LUT_INIT(16'h0200)) l_iwe(.O(iwe), .I3(corerunning), .I2(sa41), .I1(WE_O), .I0(r_issh0_not));
         SB_LUT4 #(.LUT_INIT(16'h0100)) l_iwe(.O(iwe), .I3(corerunning), .I2(sa41), .I1(WE_O), .I0(rlastshift));         
      end
   endgenerate

   generate
      if ( DISREGARD_WB4_3_55 ) begin
         if ( qACK_HIGHLEVEL ) begin
            assign qACK =  (ACK_I | sysregack);
         end else begin
            if ( MTIMETAP < MTIMETAP_LOWLIM ) begin
               assign qACK = ACK_I;
            end else begin
               SB_LUT4 #(.LUT_INIT(16'heeee)) l_iwe(.O(qACK), .I3(1'b0), .I2(1'b0), .I1(ACK_I), .I0(sysregack));
            end
         end
      end else begin

         /* If we ever see an ACK_I without STB_O, the input device is malfunctioning.
          * There is one situation where this legaly can occur according to Whisbone B.4:
          * 
          * PERMISSION 3.35
          * Under certain circumstances SLAVE interfaces MAY be designed to hold [ACK_O] in the
          * asserted state. This situation occurs on point-to-point interfaces where there is a single
          * SLAVE on the interface, and that SLAVE always operates without wait states.
          * RULE 3.55
          * MASTER interfaces MUST be designed to operate normally when the SLAVE interface
          * holds [ACK_I] in the asserted state.      
          * 
          * There is not much I can do if the input data structure is faulty (ACK_I wrong).
          * But I can at least assume we are in the situation as stated in rule 3.55. 
          * If I observe ACK_I without STB_O, I disregard ACK_I, and uses STB_O instead.
          * In an attempt to get midgetv to work with a faulty input device, if we later
          * see ACK_I low, we go back to normal operation. State machine:
          * 
          *         sysregack
          *         | ACK_I
          *         | | STB_O
          * State   | | |   Next state qACK
          * NORMAL  0 0 0   NORMAL     0
          *         0 0 1   NORMAL     0
          *         0 1 0   R355       0
          *         0 1 1   NORMAL     1
          *         1 0 0   NORMAL     1
          *         1 0 1   NORMAL     1
          *         1 1 0   R355       1
          *         1 1 1   NORMAL     1  <- What should I do here? An input device gives ACK on an address reserved for status registers.
          * R355    0 0 0   NORMAL     0
          *         0 0 1   NORMAL     1
          *         0 1 0   R355       0
          *         0 1 1   R355       1
          *         1 0 0   NORMAL     1
          *         1 0 1   NORMAL     1
          *         1 1 0   R355       1
          *         1 1 1   R355       1
          */
         if ( qACK_HIGHLEVEL ) begin

            reg AckM;
            reg nextAckM;
            reg rqACK;
            always @(*) begin
               case ({AckM,sysregack,ACK_I,STB_O})
                 4'b0000 : {nextAckM, rqACK} = 2'b00;
                 4'b0001 : {nextAckM, rqACK} = 2'b00;
                 4'b0010 : {nextAckM, rqACK} = 2'b10;
                 4'b0011 : {nextAckM, rqACK} = 2'b01;
                 4'b0100 : {nextAckM, rqACK} = 2'b01;
                 4'b0101 : {nextAckM, rqACK} = 2'b01;
                 4'b0110 : {nextAckM, rqACK} = 2'b11;
                 4'b0111 : {nextAckM, rqACK} = 2'b01;
                 4'b1000 : {nextAckM, rqACK} = 2'b00;
                 4'b1001 : {nextAckM, rqACK} = 2'b01;
                 4'b1010 : {nextAckM, rqACK} = 2'b10;
                 4'b1011 : {nextAckM, rqACK} = 2'b11;
                 4'b1100 : {nextAckM, rqACK} = 2'b01;
                 4'b1101 : {nextAckM, rqACK} = 2'b01;
                 4'b1110 : {nextAckM, rqACK} = 2'b11;
                 4'b1111 : {nextAckM, rqACK} = 2'b11;
               endcase
            end
            always @(posedge clk)
              AckM <= nextAckM;
            assign qACK = rqACK;

         end else begin

            wire nextAckM,AckM;
            SB_LUT4 #(.LUT_INIT(16'hfaf8)) l_qACK(    .O(qACK),     .I3(AckM), .I2(sysregack), .I1(ACK_I), .I0(STB_O));
            SB_LUT4 #(.LUT_INIT(16'hc4c4)) l_nextAckM(.O(nextAckM), .I3(1'b0), .I2(AckM),      .I1(ACK_I), .I0(STB_O));
            SB_DFF AckM_r(.Q(AckM), .C(clk), .D(nextAckM));

         end
      end
   endgenerate

   generate
      if ( RVC == 0 ) begin

         /* No code for this case */
         assign pcinc_by_2 = 1'b0;
         assign pc1 = 1'b0;
         assign was_rvc_instr = 1'b0;
         assign luh = 1'b0;
      end else begin

         if ( RVC_HIGHLEVEL ) begin
            
            wire potential_rvc_instr = pc1 ? Di[17:16] != 3 : Di[1:0] != 3;
            /* To correctly decode the RVC (and unaligned 32-bit wide instructions) we need access to pc[1] in
             * a cycle where it is not normally available. It is mirrored to pc1.
             */
            reg  reg_pc1;
            always @(posedge clk) begin
               if ( {sa27,sa26,sa25,sa24} == 4'b1010 ) begin// Wpc
                  reg_pc1 <= B[1];
               end
            end
            assign pc1 = reg_pc1;
            
            /* When RVC instructions are implemented, PC must be incremented by 2 rather than 4 when a
             * RVC instruction was seen. An RVC instruction is seen when the two lsb != 3 and the instruction
             * is latched (sa12==1).
             * PC will also be incremented with 2 when we have an unaligned 32-bit instruction. Because
             * an unaligned 32-bit instruction is followed by either a 16-bit instruction, or yet another
             * unaligned 32-bit instruction, we have was_rvc_instr <= potential_rvc_instr | luh, hece
             * was_rvc_instr is a misnomer.
             */
            reg reg_was_rvc_instr;
            always @(posedge clk)
              if (sa12 & progress_ucode)
                reg_was_rvc_instr <= potential_rvc_instr | luh;
            assign was_rvc_instr = reg_was_rvc_instr;
            assign pcinc_by_2 = was_rvc_instr | pc1;
            
            /* When pc is incremented from ...10 to ...00, and we did not see a rvc instruction,
             * we need to load the upper half word of an unaligned 32-bit instruction
             */
            reg reg_luh;
            always @(posedge clk)
              if (sa12 & progress_ucode)
                reg_luh <= pc1 & ~potential_rvc_instr;
            assign luh = reg_luh;

         end else begin
            /*
             *
             *           ___                           ___              
             *  sa24 ---|I0 |              pc1 -------|I0 | cmb_pc1  __          
             *  sa25 ---|I1 |-- upd_pc1    B[1] ------|I1 |---------|  |-- pc1
             *  sa26 ---|I2 |              upd_pc1 ---|I2 |         >__|
             *  sa27 ---|I3_|                      ---|I3_|             
             *                     
             *                        ___
             * Di[0] ----------------|I0 |
             * Di[1] ----------------|I1 |----------- potential_rvc_instr
             * pc1 ------------------|I2 |
             *                   +---|I3_|
             *                  /y\   ___
             * pc1 -------------(((--|I0 |
             *          Di[16] -((+--|I1 |----------- pcinc_by_2
             *          Di[17] -+(---|I2 |
             * was_rvc_instr ----(---|I3_|
             *                   0
             *                        ___
             * potential_rvc_instr --|I0 |
             * luh  -----------------|I1 | lwas_rvc_instr __         
             * was_rvc_instr --------|I2 |---------------|  |-- was_rvc_instr
             * sa12 -----------------|I3_|               >  |        
             * progress_ucode ---------------------------E__|        
             *
             *                        ___
             * potential_rvc_instr --|I0 |
             * pc1  -----------------|I1 | lluh           __         
             * luh ------------------|I2 |---------------|  |-- luh  
             * sa12 -----------------|I3_|               >  |        
             * progress_ucode ---------------------------E__|        
             */
            wire lwas_rvc_instr,lluh;
            wire Di17and16,upd_pc1,cmb_pc1;
            wire potential_rvc_instr;
            
            bn_l4v #(.I(16'h0400)) lupd_pc1(.o(upd_pc1),.i({sa27,sa26,sa25,sa24}));
            bn_l4v #(.I(16'hcaca)) lcmb_pc1(.o(cmb_pc1),.i({1'b0,upd_pc1,B[1],pc1}));
            SB_DFF regpc1( .Q(pc1), .C(clk), .D(cmb_pc1));

            bn_lcy4v_b #(.I(16'hffaa)) lpcinc_by_2(.o(pcinc_by_2),.co(Di17and16), .ci(1'b0), .i({was_rvc_instr,Di[17:16],pc1}));
            bn_l4v #(.I(16'h07f7)) lpotential_rvc_instr(.o(potential_rvc_instr),.i({Di17and16,pc1,Di[1:0]}));

            bn_l4v #(.I(16'heef0)) llwas_rvc_instr(.o(lwas_rvc_instr),.i({sa12,was_rvc_instr,luh,potential_rvc_instr}));
            SB_DFFE regwas_rvc_instr( .Q(was_rvc_instr),.C(clk),.E(progress_ucode),.D(lwas_rvc_instr));
            
            bn_l4v #(.I(16'h44f0)) llluh(.o(lluh),.i({sa12,luh,pc1,potential_rvc_instr}));
            SB_DFFE regluh( .Q(luh),.C(clk),.E(progress_ucode),.D(lluh));
            
         end
      end
   endgenerate

   
`ifdef verilator   
   function [6:0] get_dbg_stb_ack;
      // verilator public
      get_dbg_stb_ack = {progress_ucode, enaQ, WE_O, 1'b00, 1'b0, 1'b0, 1'b0 };
   endfunction
   function [0:0] get_was_rvc_instr;
      // verilator public
      get_was_rvc_instr = was_rvc_instr;
   endfunction
`endif
 
   assign m_progressctrl_killwarnings = &B[31:2] | sram_ack | clrregs | isDIVREM | clrM | ceM | alu_carryout | &Di[17:0];
endmodule


