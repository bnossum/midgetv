/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 *
 * The following is definition of fields of microcode
 * -----------------------------------------------------------------------------
 */

#define MCLR               ( II << MCLRpos ) // Transfer M to rDee, clearM
#define MLD                ( IO << MCLRpos ) // ceM==1 clrM==0, sa14 == 0, so loads
#define MSL                ( IO << MCLRpos ) // ceM==1 clrM==0, sa14 == 1, so shifts
#define CH                 ( OI << MCLRpos ) // ceM==0 clrM==1 conditional hold
#define CH13  ( I << Mbranchpos)                     // Branch on INSTR[13] to distinguish DIV[U] and MOD[U]
#define bsign ( I << Mbranchpos) | ( IO << MCLRpos ) // Branch on sign of DAT_O[31]


/* The ALU and cycle counter control.
 * Observation: s_alu[2] could be represented by a combination of 
 *              s_alu[1:0] and s_alu_carryin to save one column in the
 *              control table. Optimalization not done now.
 *
 *                                                            Cyclecnt etc   
 *                                                            sa17           s_alu[2:0]
 *                                                            |sa16          |||s_alu_carryin[1:0]
 *                                                            ||             |||||         */
#define A_nearXOR                                           ( IO << 18 ) | ( OOOxx << 9 )  // B = D^(~Q)                               
#define A_iszero                                            ( IO << 18 ) | ( OOOII << 9 )  // Used in DIV to test for zero in a particular setting
#define A_passd                                             ( IO << 18 ) | ( OOIxx << 9 )  // D
#define A_invq                                              ( IO << 18 ) | ( OIOxx << 9 )  // ~Q
#define A_nearAND                                           ( IO << 18 ) | ( OIIxx << 9 )  // D&(~Q)           
#define A_addDQ                            (I<<MCLRpos) |   ( IO << 18 ) | ( IOOOO << 9 )  // D+Q         subtle interaction between MULDIV and branch, need (I<<42)
#define A_cycnt                            (I<<MCLRpos) |   ( II << 18 ) | ( IOOOO << 9 )  // D+cyclecnt  subtle
#define A_a1                                                ( IO << 18 ) | ( IOOII << 9 )  // D+Q+1 Chasing an error in update of Q in ILL_4. This seems to do the trick. Is it needed elsewhere ? (problem was that Q was held when it should not have been)
#define A_add1                             (I<<MCLRpos) |   ( IO << 18 ) | ( IOOII << 9 )  // D+Q+1
#define A_add3                             (I<<MCLRpos) |   ( OO << 18 ) | ( IOOOO << 9 )  // D+(Q|3)+0   subtle, needed see test prog t154.S                                  
#define A_add4                            (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII << 9 )  // D+(Q|3)+1
#define A_add3w                            (I<<MCLRpos) |   ( OO << 18 ) | ( IOOOO << 9 )  // D+(Q|3)+0   subtle, needed see test prog t154.S Revise all use of this
#define A_add4w                           (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII << 9 )  // D+(Q|3)+1   REVISE all use of this
#define A_add2or4 (I<<RVCpcincctrlpos) |  (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII << 9 )  // D+(Q|((~rvc_pcinc<<1,1))+1 

#define A_shlq                          ( IO <<18 ) | ( IOIOO <<9 )  // B = (QQ<<1)|cin (with D=0xffffffff)
#define A_shlqdiv                       ( IO <<18 ) | ( IOIIO <<9 )  // B = (QQ<<1)|M[0] (with D=0xffffffff)
#define A_nearOR                        ( IO <<18 ) | ( IIIOO <<9 )  // (~D)|Q
#define A_passq                         ( IO <<18 ) | ( IIOOO <<9 )  // Let through Q
#define A_passq4                        ( OO <<18 ) | ( IIOII <<9 )  // Let through (Q|3)+1
#define A_pasq2or4  (I<<Mbranchpos) |   ( OO <<18 ) | ( IIOII <<9 )  // Let through (Q|1)+1 or (Q|3)+1
#define A_passq_F                       ( IO <<18 ) | ( IIOOI <<9 )  // Let through Q+flgF
#define A_xx                            ( xO <<18 ) | ( xxxxx <<9 )  // ALU is don't care

// Variants used in MUL/DIV
#define MA_nearXOR                   ( IO <<18 ) | ( OOOxx <<9 )  // B = D^(~Q)                               
#define MA_iszero                    ( IO <<18 ) | ( OOOII <<9 )  // Used in DIV to test for zero in a particular setting
#define MA_passd                     ( IO <<18 ) | ( OOIxx <<9 )  // D
#define MA_addDQ     (I<<MCLRpos) |  ( IO <<18 ) | ( IOOOO <<9 )  // D+Q                                         
#define MA_addDQm    (O<<MCLRpos) |  ( IO <<18 ) | ( IOOOO <<9 )  // D+Q  may be changed to a passQ by verilog              
#define MA_add1      (I<<MCLRpos) |  ( IO <<18 ) | ( IOOII <<9 )  // D+Q+1
#define MA_usub      (I<<MCLRpos) |  ( IO <<18 ) | ( IOOII <<9 )  // D+Q+1 (D previously inverted)
#define MA_shlqdiv                   ( IO <<18 ) | ( IOIIO <<9 )  // B = (QQ<<1)|M[0] (with D=0xffffffff)
#define MA_passq                     ( IO <<18 ) | ( IIOOO <<9 )  // Let through Q
#define MA_xx                        ( xO <<18 ) | ( xxxxx <<9 )  // ALU is don't care

        

#define nxtSTB (I <<40) // sa42 : Possibly STB_O or sram_stb to be set high next cycle
#define nxtWE  (I <<41) // sa43 : Possibly WE_O to be set high next cycle.

///* Write address and write enable. 
// */
////                      ssss         
////          sa41        2211         
////          |           1098         
#define Wnn   (I <<39) | (OOOO <<26) // No write. Set SEL_O = 4'b1111
#define Wbp   (I <<39) | (OOIO <<26) // Prepare write byte. Setup SEL_O as per B[1:0].
#define Whp   (I <<39) | (OOOI <<26) // Prepare write halfword. Setup SEL_O as per B[1]
#define WAQb             (OOIO <<26) // Write to MEM, adr in Q
#define WAQh             (OOOI <<26) // Write to MEM, adr in Q
#define WAQW             (OOII <<26) // Write to MEM, adr in Q
#define WTRG             (OIOO <<26) // Write target reg. 
#define Wjj              (IOOO <<26) // Write to jj
#define Wrinst           (IOOI <<26) // Write to rinst
#define Wpc              (IOIO <<26) // Write B to PC
#define Wttime           (IOII <<26) // Write to tinytime
#define Wyy              (IIOO <<26) // Write to scratch register yy
#define Wmepc            (IIOI <<26) // Write to mepc
#define Wmcaus           (IIIO <<26) // Write to mcause
#define Wmtval           (IIII <<26) // Write to mtval

///* Read address
// */
////                                        sa34: Controls read of r00000000 or rFFFFFFFF in last cycle memory/io read
////                                        |        sa23
////                                        |        |sa22
////                                        |        ||sa21
////                                        |        |||sa20
#define Rjj        ( ( O <<38 ) |   ( O <<35 ) | ( OOOO <<22  ) )  // Scratch register JJ
#define Rrinst     ( ( O <<38 ) |   ( O <<35 ) | ( OOOI <<22  ) )  // noinstret_base
#define Rpc        ( ( O <<38 ) |   ( O <<35 ) | ( OOIO <<22  ) )  // PC
#define rttime     ( ( O <<38 ) |   ( O <<35 ) | ( OOII <<22  ) )  // 
#define NMIorInInt ( ( O <<38 ) |   ( O <<35 ) | ( OIOO <<22  ) )  // 
#define rFFFFFF7F  ( ( O <<38 ) |   ( O <<35 ) | ( OIOI <<22  ) )  // 
#define r000000FF  ( ( O <<38 ) |   ( O <<35 ) | ( OIIO <<22  ) )  // 
#define r0000FFFF  ( ( O <<38 ) |   ( O <<35 ) | ( OIII <<22  ) )  // 
#define rFFFF7FFF  ( ( O <<38 ) |   ( O <<35 ) | ( IOOO <<22  ) )  // 
#define rmtvec     ( ( O <<38 ) |   ( O <<35 ) | ( IOOI <<22  ) )  // trap vector  
#define r00000000  ( ( O <<38 ) |   ( O <<35 ) | ( IOIO <<22  ) )  // 
#define rFFFFFFFF  ( ( O <<38 ) |   ( O <<35 ) | ( IOII <<22  ) )  // 
#define Ryy        ( ( O <<38 ) |   ( O <<35 ) | ( IIOO <<22  ) )  // Scratch register YY
#define Ralu       ( ( O <<38 ) |   ( O <<35 ) | ( IIOI <<22  ) )  // ALU result is internal read address.
#define RS2        ( ( O <<38 ) |   ( O <<35 ) | ( IIIO <<22  ) )  // Read register specified in registered rs2 field of instruction
#define RS1        ( ( O <<38 ) |   ( O <<35 ) | ( IIII <<22  ) )  // Read register specified in registered rs1 field of instruction
#define r_xx       ( ( O <<38 ) |   ( O <<35 ) | ( xxxx <<22  ) )  // Read address is dont care. 
#define rHorL      ( ( O <<38 ) |   ( I <<35 ) | ( IOII <<22  ) )  // 
#define rHorPC     ( ( I <<38 ) |   ( O <<35 ) | ( IOII <<22  ) )  // 
#define rHorTtime  ( ( I <<38 ) |   ( I <<35 ) | ( IOII <<22  ) )  // 
//                          |
//                          sa40 extra select signal for Rai

///* The Q register
// */
////                                                                 
////                Shift right  Part of enable to Q (sa32)     
////                |            |             Part of enable to Q (sa15)
/////               |            |             |nReset Q (sa14)
////                |            |             ||
#define Qu        ( O << 8 ) |  (O << 33 ) | ( II << 16)  // 0010 Q = B
#define Qeu       ( O << 8 ) |  (I << 33 ) | ( OI << 16)  // Nearly Qu, but a variant to distinguish SRAM operand fetch
#define Qs        ( O << 8 ) |  (I << 33 ) | ( II << 16)  // 0110 If rack==0, Q hold. If rack==1, sample B
#define Qshr      ( I << 8 ) |  (O << 33 ) | ( II << 16)  // 0010 Q == (msbshr<<31) | (Q>>1)
#define Qz        ( O << 8 ) |  (O << 33 ) | ( IO << 16)  // 0011 Q = 0
#define Qcndz     ( O << 8 ) |  (I << 33 ) | ( IO << 16)  // 0101 Q = 0 if rack==1
//#define QzCYZ   ( O << 8 ) |  (O << 33 ) | ( IO << 16)  // 0011 Q = 0, s11 must be high for zero-find. Todo - check that this is the case, delete
#define Qzh       ( O << 8 ) |  (O << 33 ) | ( IO << 16)  // 0xx1 Q = 0 or Q hold (assumes it was zero beforehand). Changed to Q = 0
#define Qudec     ( O << 8 ) |  (O << 33 ) | ( II << 16)  // 1010 Q = decoded immediate
#define Qhld      ( O << 8 ) |  (O << 33 ) | ( OI << 16)  // x001 Q unchanged. sa14 must be 1 here. Don't understand why it is not don't care
#define Qx        ( O << 8 ) |  (O << 33 ) | ( Ox << 16)  // xxxx Q don't care
#define psa00     ( I << 8 )



///* The shift counter
//*/
////               ss
////               11
////               32                                        
#define srImm    ( OO << 20 ) // shregcnt = B[4:0]                   B[1:0] BB[1:0]       
#define srDec    ( OI << 20 ) // Decrement shift count               01     11         
#define sr_h     ( II << 20 ) // shregcnt hold
#define sr43a    ( IO << 20 ) // shregcnt = {B[1:0],3'b000}          00     00         



//                                                Read into    ADR1Mustbe0
//                      use_brcond  shrep         Instruction  |Adr0Mustbe0
//                      |           |     sa33    |            ||use_dinx
#define use_dinx      ( O << 14) | ( O << 34) | ( O << 15) | ( xxI << 30) // dinx determines where to start microcode
#define u_cont        ( O << 14) | ( O << 34) | ( O << 15) | ( OOO << 30) // rinx determines next microcode instruction
#define u_io_i_latch  ( O << 14) | ( O << 34) | ( I << 15) | ( OOO << 30) // 
#define u_io_i        ( O << 14) | ( O << 34) | ( O << 15) | ( OOO << 30) // Repeat until read SRAM/IO succeeds. Then use rinx to find next ucodeinstr.
#define u_io_o        ( O << 14) | ( O << 34) | ( O << 15) | ( OOO << 30) // Repeat write data out until WACK
#define u_shrep       ( O << 14) | ( I << 34) | ( O << 15) | ( OOO << 30) // Repeat shift operation until shiftcounter == 0 
#define usebcond      ( I << 14) | ( O << 34) | ( O << 15) | ( OOO << 30) // rinx determines next microcode instruction, but with lsb determined by condition
#define wordaligned   ( O << 14) | ( O << 34) | ( O << 15) | ( IIO << 30) // 
#define hwordaligned  ( O << 14) | ( O << 34) | ( O << 15) | ( OIO << 30) // 



        
#define isr_none      ( OO << 36 ) // No trap or CSR entry or exit
#define isr_use_ij    ( OI << 36 ) // inCSR = 0; ij bit 1 determines if we are to do MIE = MPIE; MPIE = 1.
#define isr_intoCSR   ( IO << 36 ) // inCSR = 1;
#define isr_intoTrap  ( II << 36 ) // MPIE = MIE; MIE = 0;
#define isr_xx        ( xx << 36 )

#define n(x) (((uint64_t)x) & 255 ) 

