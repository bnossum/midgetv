/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 
 * If we have MTIMETAP >= MTIMETAP_LOWLIM, interrupts and mtime is implemented 
 * in midgetv. From user code, the following holds:
 *
 * Stated as memory-mapped in riscv-privileged:
 * Machine-level MSIP bit: 
 *     Exposed for writing by remote harts. Not implemented here (we only
 *     support one hart). MSIP is simply a bit in the MIP register.
 * mtimecmph/mtimecmp: 
 *     Real value is in EBR 0xf8/0xfc. 
 * mtimeh/mtime is exposed as a memory-mapped machine-mode read/write register
 *     Real value is in EBR 0xe0/0xe4.
 * 
 *   Write adr
 *   3322222222221111111111            Write to           EBR Address
 *   10987654321098765432109876543210  register or bit    |    Reg. name    Side effect on write
 * 0b001xxxxxxxxxxxxxxx1xxxxx111000xx  register mtime     0xe0 mtime        Clears mtimeincip
 * 0b001xxxxxxxxxxxxxx1xxxxxx111011xx  register minstreth 0xec minstreth    Clears minstreth
 * 0b001xxxxxxxxxxxxx1xxxxxxx100000xx  bit mtip           0x80 __jj
 * 0b001xxxxxxxxxxxx1xxxxxxxx100000xx  register mstatus   0x80 __jj
 * 0b001xxxxxxxxxxx1xxxxxxxxx100000xx  register mie       0x80 __jj
 * 0b001xxxxxxxxxx1xxxxxxxxxx100000xx  register mip       0x80 __jj         Updates msip
 * 0b001xxxxxxxxx1xxxxxxxxxxx111110xx  register mtimecmp  0xf8 mtimecmp     Clears mtip
 * 0b001xxxxxxxxx1xxxxxxxxxxx111111xx  register mtimecmph 0xfc mtimecmph    Clears mtip
 * 
 * Read adr                            
 *   3322222222221111111111            
 *   10987654321098765432109876543210  Read register      
 * 0b010xxxxxxxxxxxxxxxxxxxxxxxxxxxxx  reserved for future extension
 * 0b01100xxxxxxxxxxxxxxxxxxxxxxxxxxx  All normal input frome external port
 * 0b01101xxxxxxxxxxxxxxxxxxxxxxxxxxx  mip
 * 0b01110xxxxxxxxxxxxxxxxxxxxxxxxxxx  mie
 * 0b01111xxxxxxxxxxxxxxxxxxxxxxxxxxx  mstatus
 * 
 * The reason for the change is that I will disallow read/write to EBR when executing in
 * SRAM. This protects the registers and constants. We may still access anything when
 * executing in EBR. The only way to get from SRAM to EBR will be via an exception or 
 * a CSR instruction.
 * 
 * Changes to get this to happen:
 * 1. FF that say "executes in SRAM":
 * 2. If executing in SRAM, and a write-attempt to __pc is made which is outside
 *    of SRAM, give exception instead. 
 * 3. If executing in SRAM, and a read or write attemt is done to EBR, give exception.
 * 
 * This is only an outline of the idea:
 * 
 * always @(posedge clk) begin
 *    if ( Wpc ) begin
 *       if ( EXECinSRAM == 0 ) begin
 *          EXECinSRAM <= B[31] | B[30];
 *       end else begin
 *          if ( isr_intoCSR || isr_intoTrap ) begin
 *             EXECinSRAM <= 0;
 *          end else if ( B[31] | B[30] ) begin
 *             exception_illegal_adr;
 *          end
 *       end
 *    end
 * end
 *
 * The FF is easy to implement. The decision to give illegal exception is more
 * tricky, and involves considerable work in microcode. 
 *
 * ===============================================================
 *
 * Layout of register:
 * -------------------
 * 31        18 17           16          15 12 11   10 8 7    6 4 3    2 0
 * 000000000000 mrinstretip  mtimeincip  0000  meip 000  mtip 000 msip 000  MIP
 * 000000000000 mrinstrettie mtimeincie  0000  meie 000  mtie 000 msie 000  MIE
 * 000000000000 0            0           0001  1    000  mpie 000 mie  000  MSTATUS
 * 
 * register MIP 
 * ------------
 * 31 19 17       16         15 12 11   10   9    8    7    6    5    4    3    2    1    0
 * WPRI  MRINSTIP MTIMEINCIP WPRI  MEIP WPRI SEIP UEIP MTIP WPRI STIP UTIP MSIP WPRI SSIP USIP
 * 
 * Field        Access     Contents/comment 
 * WPRI         Read-only  0
 * MRINSTRETIP  Read-only  x Retired instruction counter overflow of low 32 bits interrupt pending.
 *                           Set when mreinstl overflows. Cleared by a write to mrinsth. 
 * MTIMEINCIP   Read-only  x Request to increment mtime interrupt pending. Set when cyclecnt
 *                           increments to (1<<MTIMETAP). Cleared by any write to mtime.
 * MEIP         Read-only  x External interrupt pending. Set by external interrupt source.
 *                           Clearable by writing to external interrupt source
 * SEIP         Read-only  0
 * UEIP         Read-only  0
 * MTIP         Read/spes  x Time compare interrupt pending. Set by code in internal interrupt
 *                           when mtime >= mtimecmp. Should not be set by other user code.
 *                           Cleared when mtimecmp or mtimecmph is written.
 * STIP         Read-only  0
 * UTIP         Read-only  0
 * MSIP         Read/write x Software interrupt pending. Set.cleared by write to MSIPreg address.
 * SSIP         Read-only  0
 * USIP         Read-only  0
 * 
 * register MIE
 * ------------
 * 31 19 17          16         15 12 11   10   9    8    7    6    5    4    3    2    1    0
 * WPRI  MRINSTRETIE MTIMEINCIE WPRI  MEIE WPRI SEIE UEIE MTIE WPRI STIE UTIE MSIE WPRI SSIE USIE
 * 
 * Field        Access     Contents/Comment
 * WPRI         Read-only  0
 * MRINSTRETTIE Read/write x  Software controlled.           
 * MTIMEINCIE   Read/write x  Software controlled.           
 * MEIE         Read/write x  Software controlled
 * SEIE         Read-only  0
 * UEIE         Read-only  0
 * MTIE         Read/write x  Software controlled
 * STIE         Read-only  0
 * UTIE         Read-only  0
 * MSIE         Read/write x  With only M-mode implemented, and only one hart, there is no real
 *                            sense to implement this bit in hardware. However, to be compatible
 *                            I implement it after all.
 * SSIE         Read-only  0
 * USIE         Read-only  0
 *
 * register MSTATUS
 * ----------------
 * 31 30 23 22  21 20  19  18  17   16 15   14 13   12:11    10 9 8   7    6    5    4    3   2    1   0
 * SD WPRI  TSR TW TVM MXR SUM MPRV XS[1:0] FS[1:0] MPP[1:0] WPRI SPP MPIE WPRI SPIE UPIE MIE WPRI SIE UIE
 * 
 * Field      Access     Contents/Comment
 * WPRI  
 * SD         Read-only  0 XS and FS hardwired to zero
 * TSR        Read-only  0 S-mode not supported
 * TW         Read-only  0 No modes less privileged than M-mode
 * TVM        Read-only  0 S-mode not supported
 * MXR        Read-only  0 S-mode not supported
 * SUM        Read-only  0 S-mode not supported
 * MPRV       Read-only  0 U-mode not supported
 * XS[1:0]    Read-only  0 No floating point
 * FS[1:0]    Read-only  0 No floating point
 * MPP[1:0]   Read-only  3 The only mode that is implemented is Machine-mode
 * SPP        Read-only  0
 * MPIE       Read/Write x
 * SPIE       Read-only  0
 * UPIE       Read-only  0
 * MIE        Read/write x  Global interrupt enable
 * SIE        Read-only  0
 * UIE        Read-only  0
 * 
 */
module m_status_and_interrupts
  # ( parameter HIGHLEVEL = 1,
      ucodeopt_HAS_MINSTRET = 0,
      ucodeopt_HAS_EBR_MINSTRET = 0      
      )
   (
    /* verilator lint_off UNUSED */
    input        clk,
    input        alu_tapout, //      True when ttime[MTIMETA] increments from 0 to 1, and isWttime is true
    input        alu_minstretofl, // True when minstret overflows in 32 bits.
    input [31:0] B, //               ALU result, used in "ij" 
    input [31:0] DAT_O, //           From EBR
    input [31:0] ADR_O, //           Address
    input        sa38, //              | Shows if we enters traps, executes "ij", or enters CSR emulation
    input        sa39, //              |
    input        meip, //            External interrupt pending
    input        ctrlreg_we, //      User code writes to EBR with address in ADR_O. To find out if we write to mtime, minstreth, mip,mie,mstatus or bit mtip
    output       mrinstretip, //       |
    output       mtimeincip, //        | These are all registers.
    output       mtip, //              |
    output       msip, //              |
    output       mrinstretie, //       |
    output       mtimeincie, //        |
    output       meie, //              |
    output       mtie, //              |
    output       msie, //              |
    output       mpie, //              |
    output       mie, //               | 
    output       qualint, //         qualified interrupt pending
    output       m_status_and_interrupts_killwarnings
    /* verilator lint_on UNUSED */
    );

   reg           r_incsr;

   assign m_status_and_interrupts_killwarnings = &B | &DAT_O | &ADR_O;
`ifdef verilator   
   function [12:0] get_interruptinfo;
      // verilator public
     get_interruptinfo = {msie,msip,mtie,mtip,meie,meip,mtimeincie,mtimeincip,mrinstretie,mrinstretip,mpie,mie,r_incsr};
   endfunction
`endif
   
   generate
      if ( HIGHLEVEL ) begin
         // =============================================================================
         // HIGHLEVEL
         // =============================================================================

         /* mtimeincip is set when the cycle counter increments to (1<<MTIMETAP).
          * When user code writes mtime, mtimeincip is cleared
          */
         wire       write_to_mtime = ctrlreg_we & ADR_O[13]; 
         reg        r_mtimeincip;
         always @(posedge clk)
           r_mtimeincip <= ( alu_tapout | r_mtimeincip)  & ~write_to_mtime;
         
         /* minstrethip is set when the retired instruction counter overflows in 32 bits.
          * When user code write minstreth, minstretip is cleared
          */
         wire       the_r_minstrethip;
         if ( ucodeopt_HAS_EBR_MINSTRET || ucodeopt_HAS_EBR_MINSTRET ) begin
            reg        r_minstrethip;
            wire       write_to_minstreth = ctrlreg_we & ADR_O[14];
            wire       cmb_minstrethip = (alu_minstretofl | r_minstrethip ) & ~write_to_minstreth;
            always @(posedge clk)         
              r_minstrethip <= cmb_minstrethip;
            assign the_r_minstrethip = r_minstrethip;
         end else begin
            assign the_r_minstrethip = 1'b0;
         end
         
         /* MTIP is set under software control, this should only be used
          * by the internal interrupt routine that increments {mtimeh,mtime}. 
          * It is cleared when mtimecmp or mtimecmph is written. 
          */
         reg        r_mtip;
         wire       write_to_mtip      = ctrlreg_we & ADR_O[15];
         wire       write_to_mtimecmpx = ctrlreg_we & ADR_O[19];
         wire       cmb_mtip = (write_to_mtip | r_mtip) & ~write_to_mtimecmpx;
         always @(posedge clk) 
            r_mtip <= cmb_mtip;
         
         /* MSIP is only under software control. This is possible because we have only one hart.
          */
         wire       write_to_msip =  ctrlreg_we & ADR_O[18];
         reg        r_msip;
         always @(posedge clk)
           r_msip <= (~write_to_msip & r_msip) | (write_to_msip & DAT_O[3]);
         
         /* Selective interrupt enable bits in mie are implemented in a straight forward fashion
          */
         wire       write_to_mie = ctrlreg_we & ADR_O[17];
         reg        r_mrinstretie,r_mtimeincie,r_meie,r_mtie,r_msie;
         always @(posedge clk) begin
            r_mrinstretie <= (~write_to_mie & r_mrinstretie) | ( write_to_mie & DAT_O[17] );
            r_mtimeincie  <= (~write_to_mie & r_mtimeincie ) | ( write_to_mie & DAT_O[16] );
            r_meie        <= (~write_to_mie & r_meie       ) | ( write_to_mie & DAT_O[11] );
            r_mtie        <= (~write_to_mie & r_mtie       ) | ( write_to_mie & DAT_O[7] );
            r_msie        <= (~write_to_mie & r_msie       ) | ( write_to_mie & DAT_O[3] );      
         end
         
         /* Register mpie is involved. 
          *   o The user code can write it.
          *     Here we must see if we have (writeIO & ADR_O[2])
          *   o When an interrupt is taken, mpie <= mie
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When a trap occurs, mpie <= mie
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When MRET is executed, mpie <= 1
          *     Instruction "ij" will have B[1] == 1 in this case, and sa[39:38] is isr_use_ij
          *   o When accessing an illegal CSR and transferring control to a trap, mpie <= mie
          *     Instruction "ij" will have B[0] == 1 in this case, and sa[39:38] is isr_use_ij
          */
         wire write_to_mstatus = ctrlreg_we & ADR_O[16];
         reg  r_mpie,r_mie;
         wire isr_use_ij = ~sa39 & sa38;
         wire isr_intoCSR = sa39 & ~sa38;
         wire isr_intoTrap = sa39 & sa38;
         wire update_mpie = 
              write_to_mstatus    |
              isr_intoTrap        | 
              (isr_use_ij & B[1]) |
              (isr_use_ij & B[0]);
         wire value_new_mpie = 
              (write_to_mstatus & DAT_O[7]) | 
              (isr_intoTrap & r_mie)    |
              (isr_use_ij & B[1] )      |
              (isr_use_ij & B[0] & r_mie);
         always @(posedge clk)
           if ( update_mpie )
             r_mpie <= value_new_mpie;
         
         /* Register mie is involved.
          *   o The user code can write it.
          *     Here we must see if we have (writeIO & ADR_O[2])
          *   o When an interrupt is taken, mie <= 0
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When a trap occurs, mie <= 0
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When MRET is executed, mie <= mpie
          *     Instruction "ij" will have B[1] == 1 in this case, and sa[39:38] is isr_use_ij
          *   o When accessing an illegal CSR and transferring control to a trap, mie <= 0
          *     Instruction "ij" will have B[0] == 1 in this case, and sa[39:38] is isr_use_ij
          */
         wire update_mie = update_mpie;
         wire value_new_mie =
              (write_to_mstatus & DAT_O[3]) |
              (isr_intoTrap & 1'b0)     |
              (isr_use_ij & B[1] & r_mpie) |
              (isr_use_ij & B[0] & 1'b0);
         always @(posedge clk)
           if (update_mie)
             r_mie <= value_new_mie;
         
         /* An internal register is set while we are in a CSR emulation routine
          */
         always @(posedge clk)
           r_incsr <= isr_intoCSR | (r_incsr & ~isr_use_ij);
         
         /*                                               __     _
          * mie -----------------------------------------|  |---| |-- qualint
          * r_incsr ------------------------------------o|  |   >_|
          *                                    ____      |  |
          * mrinstretip --| |-----------------|    |-----|__|
          * mrinstretie --|&|  +--------------|    |
          *                    |  +-----------| or |
          * mtimeincip ---| |--+  |  +--------|    |
          * mtimeincie ---|&|     |  |  +-----|____|
          *                       |  |  |
          * meip ---------| |-----+  |  |
          * meie ---------|&|        |  |
          *                          |  |
          * mtip ---------| |--------+  |
          * mtie ---------|&|           |
          *                             |
          * msip ---------| |-----------+
          * msie ---------|&|
          */ 
         wire possible_interrupt = 
              (mrinstretip & mrinstretie) |        
              (mtimeincip  & mtimeincie ) |
              (meip        & meie       ) |
              (mtip        & mtie       ) |
              (msip        & msie       );  
         wire cmb_qualint = possible_interrupt & r_mie & ~r_incsr;
         reg  r_qualint;
         always @(posedge clk)
           r_qualint <= cmb_qualint;
         assign qualint = r_qualint;
         
         /* Registers that can be read by user code are output from this module
          */
         // In register mip
         // -----------------------------------------
         assign mrinstretip = the_r_minstrethip;
         assign mtimeincip  = r_mtimeincip;
         //     meip          comes from the outside
         assign mtip        = r_mtip;
         assign msip        = r_msip;
         // In register mie
         // -----------------------------------------
         assign mrinstretie= r_mrinstretie;
         assign mtimeincie = r_mtimeincie;
         assign meie       = r_meie;
         assign mtie       = r_mtie;
         assign msie       = r_msie;
         // In register mstatus
         // -----------------------------------------
         assign mpie       = r_mpie;
         assign mie        = r_mie;
         
      end else begin
         // =============================================================================
         // LOWLEVEL
         // =============================================================================
         reg  r_mie;

         
         /* mtimeincip is set when the cycle counter increments to (1<<MTIMETAP).
          * When user code writes mtime, mtimeincip is cleared
          */
         //wire       write_to_mtime = ctrlreg_we & ADR_O[13]; 
         //reg        r_mtimeincip;
         //always @(posedge clk)
         //  r_mtimeincip <= ( alu_tapout | r_mtimeincip)  & ~write_to_mtime;
         wire cmb_mtimeincip, r_mtimeincip;
         SB_LUT4 #(.LUT_INIT(16'h0eee)) mtimeincip_l( .O(cmb_mtimeincip), .I3(ctrlreg_we), .I2(ADR_O[13]), .I1(r_mtimeincip), .I0(alu_tapout));         
         SB_DFF mtimeincip_reg( .Q(r_mtimeincip), .C(clk), .D(cmb_mtimeincip) );
         
         /* minstrethip is set when the retired instruction counter overflows in 32 bits.
          * When user code write minstreth, minstretip is cleared
          */
//         wire       write_to_minstreth = ctrlreg_we & ADR_O[14];
//         wire       cmb_minstrethip = (alu_minstretofl | r_minstrethip ) & ~write_to_minstreth;
//         always @(posedge clk)         
//           r_minstrethip <= cmb_minstrethip;
         wire r_minstrethip;
         if ( ucodeopt_HAS_EBR_MINSTRET || ucodeopt_HAS_EBR_MINSTRET ) begin
            wire cmb_minstrethip;
            SB_LUT4 #(.LUT_INIT(16'h0eee)) minstrethip_l( .O(cmb_minstrethip), .I3(ctrlreg_we), .I2(ADR_O[14]), .I1(r_minstrethip), .I0(alu_minstretofl));         
            SB_DFF minstrethip_reg( .Q(r_minstrethip), .C(clk), .D(cmb_minstrethip) );
         end else begin
            assign r_minstrethip = 1'b0;
         end
         
         /* MTIP is set under software control, this should only be used
          * by the internal interrupt routine that increments {mtimeh,mtime}. 
          * It is cleared when mtimecmp or mtimecmph is written. 
          */
         // wire write_to_mtip      = ctrlreg_we & ADR_O[15];
         // wire write_to_mtimecmpx = ctrlreg_we & ADR_O[19];
         // wire cmb_mtip = (write_to_mtip | r_mtip) & ~write_to_mtimecmpx;
         // always @(posedge clk) begin
         //    r_mtip <= cmb_mtip;
         wire cmb_mtip,r_mtip;
         SB_LUT4 #(.LUT_INIT(16'h0caa)) mtip_l( .O(cmb_mtip), .I3(ctrlreg_we), .I2(ADR_O[19]), .I1(ADR_O[15]), .I0(r_mtip));         
         SB_DFF mtip_reg( .Q(r_mtip), .C(clk), .D(cmb_mtip) );
         
         /* MSIP is only under software control. This is possible because we have only one hart.
          */
         //wire       write_to_msip =  ctrlreg_we & ADR_O[18];
         //reg        r_msip;
         //always @(posedge clk)
         //  r_msip <= (~write_to_msip & r_msip) | (write_to_msip & DAT_O[3]);
         wire cmb_msip,r_msip;
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) msip_l( .O(cmb_msip), .I3(ctrlreg_we), .I2(ADR_O[18]), .I1(DAT_O[3]), .I0(r_msip));         
         SB_DFF msip_reg( .Q(r_msip), .C(clk), .D(cmb_msip) );
         
         /* Selective interrupt enable bits in mie are implemented in a straight forward fashion
          */
         //wire       write_to_mie = ctrlreg_we & ADR_O[17];
         //reg        r_mrinstretie,r_mtimeincie,r_meie,r_mtie,r_msie;
         //always @(posedge clk) begin
         //   r_mrinstretie <= (~write_to_mie & r_mrinstretie) | ( write_to_mie & DAT_O[17] );
         //   r_mtimeincie  <= (~write_to_mie & r_mtimeincie ) | ( write_to_mie & DAT_O[16] );
         //   r_meie        <= (~write_to_mie & r_meie       ) | ( write_to_mie & DAT_O[11] );
         //   r_mtie        <= (~write_to_mie & r_mtie       ) | ( write_to_mie & DAT_O[7] );
         //   r_msie        <= (~write_to_mie & r_msie       ) | ( write_to_mie & DAT_O[3] );      
         //end
         wire r_mrinstretie,cmb_mrinstretie,r_mtimeincie,cmb_mtimeincie,r_meie,cmb_meie,r_mtie,cmb_mtie,r_msie,cmb_msie;         
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) mrinstretie_l( .O(cmb_mrinstretie), .I3(ctrlreg_we), .I2(ADR_O[17]), .I1(DAT_O[17]), .I0(r_mrinstretie));         
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) mtimeincie_l ( .O(cmb_mtimeincie ), .I3(ctrlreg_we), .I2(ADR_O[17]), .I1(DAT_O[16]), .I0(r_mtimeincie ));         
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) meie_l       ( .O(cmb_meie       ), .I3(ctrlreg_we), .I2(ADR_O[17]), .I1(DAT_O[11]), .I0(r_meie       ));         
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) mtie_l       ( .O(cmb_mtie       ), .I3(ctrlreg_we), .I2(ADR_O[17]), .I1(DAT_O[ 7]), .I0(r_mtie       ));         
         SB_LUT4 #(.LUT_INIT(16'hcaaa)) msie_l       ( .O(cmb_msie       ), .I3(ctrlreg_we), .I2(ADR_O[17]), .I1(DAT_O[ 3]), .I0(r_msie       ));         
         SB_DFF mrinstretie_reg( .Q(r_mrinstretie), .C(clk), .D(cmb_mrinstretie) );
         SB_DFF mtimeincie_reg ( .Q(r_mtimeincie ), .C(clk), .D(cmb_mtimeincie ) );
         SB_DFF meie_reg       ( .Q(r_meie       ), .C(clk), .D(cmb_meie       ) );
         SB_DFF mtie_reg       ( .Q(r_mtie       ), .C(clk), .D(cmb_mtie       ) );
         SB_DFF msie_reg       ( .Q(r_msie       ), .C(clk), .D(cmb_msie       ) );
         
         /* Register mpie is involved. 
          *   o The user code can write it.
          *     Here we must see if we have write to mstatus, ctrlreg_we & ADR_O[16]
          *   o When an interrupt is taken, mpie <= mie
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When a trap occurs, mpie <= mie
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When MRET is executed, mpie <= 1
          *     Instruction "ij" will have B[1] == 1 in this case, and sa[39:38] is isr_use_ij
          *   o When accessing an illegal CSR and transferring control to a trap, mpie <= mie
          *     Instruction "ij" will have B[0] == 1 in this case, and sa[39:38] is isr_use_ij
          */
         //wire write_to_mstatus = ctrlreg_we & ADR_O[16];
         //reg  r_mpie,r_mie;
         //wire isr_use_ij = ~sa39 & sa38;
         //wire isr_intoTrap = sa39 & sa38;
         //wire update_mpie = 
         //     write_to_mstatus    |
         //     isr_intoTrap        | 
         //     (isr_use_ij & B[1]) |
         //     (isr_use_ij & B[0]);
         //wire value_new_mpie = 
         //     (write_to_mstatus & DAT_O[7]) | 
         //     (isr_intoTrap & r_mie)    |
         //     (isr_use_ij & B[1] )      |
         //     (isr_use_ij & B[0] & r_mie);
         //always @(posedge clk)
         //  if ( update_mpie )
         //    r_mpie <= value_new_mpie;
         wire write_to_mstatus,isr_intoTrap,isr_use_ij;
         wire update_mie_mpie;
         SB_LUT4 #(.LUT_INIT(16'h8888)) write_to_mstatus_l(.O(write_to_mstatus), .I3(1'b0), .I2(1'b0), .I1(ctrlreg_we), .I0(ADR_O[16]));
         SB_LUT4 #(.LUT_INIT(16'h8888)) isr_intoTrap_l(.O(isr_intoTrap), .I3(1'b0), .I2(1'b0), .I1(sa39), .I0(sa38));
         SB_LUT4 #(.LUT_INIT(16'h2222)) isr_use_ij_l(  .O(isr_use_ij),   .I3(1'b0), .I2(1'b0), .I1(sa39), .I0(sa38));         
         wire tmp = B[1] | B[0];
         SB_LUT4 #(.LUT_INIT(16'hfeee)) update_mie_mpie_l(  .O(update_mie_mpie), .I3(tmp), .I2(isr_use_ij), .I1(isr_intoTrap), .I0(write_to_mstatus));         

         wire mpiea; //  = (isr_use_ij & B[1] ) | (isr_use_ij & B[0] & r_mie);
         wire mpieb; //  = (write_to_mstatus & DAT_O[7]) | (isr_intoTrap & r_mie);
         wire r_mpie; // if ( update_mie_mpie ) r_mpie = mpiea ? 1 : mpieb;
         SB_LUT4 #(.LUT_INIT(16'hf800)) mpiea_l(  .O(mpiea), .I3(isr_use_ij), .I2(B[1]), .I1(B[0]), .I0(r_mie));
         SB_LUT4 #(.LUT_INIT(16'hf888)) mpieb_l(  .O(mpieb), .I3(write_to_mstatus), .I2(DAT_O[7]), .I1(isr_intoTrap), .I0(r_mie));         
         SB_DFFESS reg_mpie( .Q(r_mpie), .C(clk), .E(update_mie_mpie), .S(mpiea), .D(mpieb));
         
         /* Register mie is involved.
          *   o The user code can write it.
          *     Here we must see if we have write to mstatus
          *   o When an interrupt is taken, mie <= 0
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When a trap occurs, mie <= 0
          *     Microcode sets sa[39:38] to isr_intoTrap
          *   o When MRET is executed, mie <= mpie
          *     Instruction "ij" will have B[1] == 1 in this case, and sa[39:38] is isr_use_ij
          *   o When accessing an illegal CSR and transferring control to a trap, mie <= 0
          *     Instruction "ij" will have B[0] == 1 in this case, and sa[39:38] is isr_use_ij
          */
// With this: Size 361 LUTs
         wire value_new_mie =
              (write_to_mstatus & DAT_O[3]) |
              (isr_use_ij & B[1] & r_mpie);
         always @(posedge clk)
           if (update_mie_mpie)
             r_mie <= value_new_mie;
         
// With this: Size 365 LUTs even though it was a reverse engineering of the above.
// Completely baffeled here         
//         wire miea; // = isr_use_ij & B[1] & r_mpie;
//         wire mieb; // = miea | (write_to_mstatus & DAT_O[3]);
//         wire r_mie; // = if ( update_mie ) r_mie = mieb;
//         SB_LUT4 #(.LUT_INIT(16'hc000)) miea_l(  .O(miea), .I3(r_mpie), .I2(isr_use_ij), .I1(B[1]), .I0(update_mie_mpie));
//         SB_LUT4 #(.LUT_INIT(16'h8888)) mieb_l(  .O(mieb), .I3(1'b0), .I2(1'b0), .I1(write_to_mstatus), .I0(DAT_O[3]));         
//         SB_DFFESS reg_mie( .Q(r_mie), .C(clk), .E(update_mie_mpie), .S(miea), .D(mieb)); // Different PLB than SB_DFFESS above.
         
         
         /* An internal register is set while we are in a CSR emulation routine
          */
         //wire isr_intoCSR = sa39 & ~sa38;
         //always @(posedge clk)
         //  r_incsr <= isr_intoCSR | (r_incsr & ~isr_use_ij);
         wire cmb_incsr,rr_incsr;
         SB_LUT4 #(.LUT_INIT(16'h4f44)) incsr_l(  .O(cmb_incsr), .I3(sa39), .I2(sa38), .I1(rr_incsr), .I0(isr_use_ij));
         SB_DFF reg_incsr( .Q(rr_incsr), .C(clk), .D(cmb_incsr));
         always @(*)
           r_incsr = rr_incsr;
         /*                                               ___           __
          * mie -----------------------------------------|   |---------|  |-- qualint
          * r_incsr ------------------------------------o| & |         >__|
          * meip ---------| |-----------------|    |-----|___|          
          * meie ---------|&|         +-------| or |         
          *                           | +-----|____|
          * mrinstretip---| |----|  |-+ |
          * mrinstretie---|&|  +-|or|   |
          *                    |        |
          * mtimeincip ---| |--+        |
          * mtimeincie ---|&|           |
          *                             |
          * mtip ---------| |----|  |---+
          * mtie ---------|&|  +-|or|
          *                    |
          * msip ---------| |--+
          * msie ---------|&|
          */ 
         //wire possible_interrupt = 
         //     (mrinstretip & mrinstretie) |        
         //     (mtimeincip  & mtimeincie ) |
         //     (meip        & meie       ) |
         //     (mtip        & mtie       ) |
         //     (msip        & msie       );  
         //wire cmb_qualint = possible_interrupt & r_mie & ~r_incsr;
         //reg  r_qualint;
         //always @(posedge clk)
         //  r_qualint <= cmb_qualint;
         //assign qualint = r_qualint;
         wire pia,pib,pic,cmb_qualint;
         SB_LUT4 #(.LUT_INIT(16'hf888)) pia_l( .O(pia       ), .I3(msie      ), .I2(msip      ), .I1(mtip       ), .I0(mtie       ));         
         SB_LUT4 #(.LUT_INIT(16'hf888)) pib_l( .O(pib       ), .I3(mtimeincie), .I2(mtimeincip), .I1(mrinstretip), .I0(mrinstretie));
         SB_LUT4 #(.LUT_INIT(16'hfeee)) pic_l( .O(pic), .I3(meie), .I2(meip), .I1(pia), .I0(pib));
         SB_LUT4 #(.LUT_INIT(16'h4040)) qualint_l( .O(cmb_qualint), .I3(1'b0), .I2(pic), .I1(mie), .I0(r_incsr));         
         SB_DFF qualint_reg( .Q(qualint), .C(clk), .D(cmb_qualint) );
         
         
         /* Registers that can be read by user code are output from this module
          */
         // In register mip
         // -----------------------------------------
         assign mrinstretip = r_minstrethip;
         assign mtimeincip  = r_mtimeincip;
         //     meip          comes from the outside
         assign mtip        = r_mtip;
         assign msip        = r_msip;
         // In register mie
         // -----------------------------------------
         assign mrinstretie= r_mrinstretie;
         assign mtimeincie = r_mtimeincie;
         assign meie       = r_meie;
         assign mtie       = r_mtie;
         assign msie       = r_msie;
         // In register mstatus
         // -----------------------------------------
         assign mpie       = r_mpie;
         assign mie        = r_mie;
         
      end   
   endgenerate
endmodule
