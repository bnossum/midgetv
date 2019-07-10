/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 
 * If we have MTIMETAP > 13, interrupts and mtime is implemented in midgetv
 * From user code, the following holds:
 * Write adr                            Write to
 *   33 22222222221111111111            register           
 *   10 987654321098765432109876543210  or bit             EBR address 
 * 0b00 1xxxxxxxxxxxxxxx1xxxxx111000xx  register mtime     0xe0 mtime
 * 0b00 1xxxxxxxxxxxxxx1xxxxxx111111xx  register minstreth 0xec minstreth
 * 0b00 1xxxxxxxxxxxxx1xxxxxxx100000xx  bit mtip           0x80 __jj
 * 0b00 1xxxxxxxxxxxx1xxxxxxxx100000xx  register mstatus   0x80 __jj
 * 0b00 1xxxxxxxxxxx1xxxxxxxxx100000xx  register mie       0x80 __jj
 * 0b00 1xxxxxxxxxx1xxxxxxxxxx100000xx  register mip       0x80 __jj
 * 0b00 1xxxxxxxxx1xxxxxxxxxxx111110xx  register mtimecmp  0xf7 mtimecmp
 * 0b00 1xxxxxxxxx1xxxxxxxxxxx111111xx  register mtimecmph 0xf7 mtimecmph
 * 
 * Read adr                            
 *   33 22222222221111111111            
 *   10 987654321098765432109876543210  Read register      
 * 0b01 00xxxxxxxxxxxxxxxxxxxxxxxxxxxx  All real input in this address range
 * 0b01 01xxxxxxxxxxxxxxxxxxxxxxxxxxxx  mip
 * 0b01 10xxxxxxxxxxxxxxxxxxxxxxxxxxxx  mie
 * 0b01 11xxxxxxxxxxxxxxxxxxxxxxxxxxxx  mstatus
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
 *                             we implement it after all.
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
(
/* verilator lint_off UNUSED */
 input        clk,
 input        alu_tapout, //      True when ttime[MTIMETA] increments from 0 to 1, and isWttime is true
 input        alu_minstretofl, // True when minstret overflows in 32 bits.
 input [31:0] B, //               ALU result, used in "ij" 
 input [31:0] DAT_O, //            From EBR
 input [31:0] ADR_O, //             Address
 input        sa38, //            | Shows if we enters traps, executes "ij", or enters CSR emulation
 input        sa39, //            |
 input        meip, //            External interrupt pending
 input        ctrlreg_we, // User code writes to EBR with address in ADR_O. To find out if we write to mtime, minstreth, mip,mie,mstatus or bit mtip
 output       mrinstretip,
 output       mtimeincip,
 output       mtip,
 output       msip,
 output       mrinstretie,
 output       mtimeincie,
 output       meie,
 output       mtie,
 output       msie,
 output       mpie,
 output       mie, 
 output reg   qualint, //         qualified interrupt pending
 output       m_status_and_interrupts_killwarnings
/* verilator lint_on UNUSED */
 );
   assign m_status_and_interrupts_killwarnings = &B | &DAT_O | &ADR_O;
   
   /* mtimeincip is set when the cycle counter increments to (1<<MTIMETAP).
    * When user code writes mtime, mtimeincip is cleared
    */
   wire       write_to_mtime = ctrlreg_we & ADR_O[13]; 
   reg        r_mtimeincip;
   always @(posedge clk)
     r_mtimeincip <= ( (~r_mtimeincip & alu_tapout) | r_mtimeincip)  & ~write_to_mtime;

   /* minstrethip is set when the retired instruction counter overflows in 32 bits.
    * When user code write minstreth, minstretip is cleared
    */
   wire       write_to_minstreth = ctrlreg_we & ADR_O[14];
   reg        r_minstrethip;
   always @(posedge clk)
     if ( write_to_minstreth ) begin
        r_minstrethip <= 1'b0;
     end else if ( alu_minstretofl ) begin
        r_minstrethip <= 1'b1;
     end
        
   
//   always @(posedge clk)
//     r_minstrethip <= ( (~r_minstrethip & alu_minstretofl) | r_minstrethip) & ~write_to_minstreth;

   /* MTIP is set under software control, this should only be used
    * by the internal interrupt routine that increments {mtimeh,mtime}. 
    * It is cleared when mtimecmp or mtimecmph is written. 
    */
   wire       write_to_mtip = ctrlreg_we & ADR_O[15];
   wire       write_to_mtimecmpx = ctrlreg_we & ADR_O[19];
   reg        r_mtip;
   always @(posedge clk) begin
     if ( write_to_mtip ) begin
        r_mtip <= 1'b1;
     end else if ( write_to_mtimecmpx ) begin
        r_mtip <= 1'b0;
     end
   end
   
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

`ifdef verilator   
   function [12:0] get_interruptinfo;
      // verilator public
     get_interruptinfo = {msie,msip,mtie,mtip,meie,meip,mtimeincie,mtimeincip,mrinstretie,mrinstretip,mpie,mie,r_incsr};
   endfunction
`endif
   
   /* An internal register is set while we are in a CSR emulation routine
    */
   reg  r_incsr;
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
   always @(posedge clk)
     qualint <= cmb_qualint;

   
   /* Registers that can be read by user code are output from this module
    */
   // In register mip
   assign mrinstretip = r_minstrethip;
   assign mtimeincip  = r_mtimeincip;
   //sign meip comes from the outside
   assign mtip        = r_mtip;
   assign msip        = r_msip;
   // In register mie
   assign mrinstretie= r_mrinstretie;
   assign mtimeincie = r_mtimeincie;
   assign meie       = r_meie;
   assign mtie       = r_mtie;
   assign msie       = r_msie;
   // In register mstatus
   assign mpie       = r_mpie;
   assign mie        = r_mie;
   
   
     
endmodule
