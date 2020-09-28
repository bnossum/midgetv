/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
  The microcode of midgetv.
  Switches in midgetv_ucodeoptions.h affects generated ucode.

 */

#include "midgetv_ucodeoptions.h"
#if HAS_MINSTRET == 0 && HAS_EBR_MINSTRET == 1
#error Can not do this, see comment in "midgetv_ucodeoptions.h"
#endif

/* Some analysis of microcode is done easier by
   defining value fields that are in use.
*/
#define I 0b1ull
#define O 0b0ull

#define OO 0b00ull
#define OI 0b01ull
#define IO 0b10ull
#define II 0b11ull

#define OOO 0b000ull
#define OOI 0b001ull
#define OIO 0b010ull
#define OII 0b011ull
#define IOO 0b100ull
#define IOI 0b101ull
#define IIO 0b110ull
#define III 0b111ull

#define OOOO 0b0000ull
#define OOOI 0b0001ull
#define OOIO 0b0010ull
#define OOII 0b0011ull
#define OIOO 0b0100ull
#define OIOI 0b0101ull
#define OIIO 0b0110ull
#define OIII 0b0111ull
#define IOOO 0b1000ull
#define IOOI 0b1001ull
#define IOIO 0b1010ull
#define IOII 0b1011ull
#define IIOO 0b1100ull
#define IIOI 0b1101ull
#define IIIO 0b1110ull
#define IIII 0b1111ull

#define OOOOO 0b00000ull
#define OOOOI 0b00001ull
#define OOOIO 0b00010ull
#define OOOII 0b00011ull
#define OOIOO 0b00100ull
#define OOIOI 0b00101ull
#define OIIOO 0b01100ull
#define IOIOO 0b10100ull
#define IOOOO 0b10000ull
#define IOOOI 0b10001ull
#define IOOII 0b10011ull
#define IOIOI 0b10101ull
#define IOIIO 0b10110ull
#define IOIII 0b10111ull
#define IIOOO 0b11000ull
#define IIOOI 0b11001ull
#define IIOIO 0b11010ull
#define IIOII 0b11011ull
#define IIIOO 0b11100ull
#define IIIOI 0b11101ull
#define IIIIO 0b11110ull
#define IIIII 0b11111ull

#define OOIOOO 0b001000ull
#define OOIOOI 0b001001ull
#define OOIOIO 0b001010ull
#define OIIOOO 0b011000ull
#define IOIOOO 0b101000ull
#define IIIOOO 0b111000ull
#define IIIOII 0b111011ull
#define IIIIIO 0b111110ull

/* To get out don't care values I use some value fields where the 'x'
 * can be changed to 0b0/0b1 at will in the program that uses this include file 
 */
#ifndef x
#define x 0b0ull
#endif

#define xO (0b00ull     | ((x) << 1) )
#define xI (0b01ull     | ((x) << 1) )
#define Ox (0b00ull     | ((x) << 0) )
#define xx (((x)<<1) | (x))

#define xxI (((xx)<<1)| 1ull << 0)

#define xxxx  (((xx)<<2) | (xx))
#define Oxxx  ((0b0000)   | ( ((xx)<<1) | (x)))
#define OOIx  (0b0010ull | (x))
#define OIIx  (0b0110ull | (x))
#define IOIx  (0b1010ull | (x))

#define OOOxx (0b00000ull | (xx))
#define OOIxx (0b00100ull | (xx))     
#define OIOxx (0b01000ull | (xx))     
#define OIIxx (0b01100ull | (xx))
#define xxxxx (((x)<<4) | (xxxx))  

/* Locations that are unused in the table should never be accessed.
   If they are, the controller have a fatal error. To make debugging
   in such a case a bit easier, I should ensure there is no loops in
   these cases. 
 */
//#define unx StdIncPc
#define x8 ((xxxx<<4) | xxxx )
#define x16 ((x8<<8)|x8)
#define unx ( ((x16<<15) | x16) | n(Fetch) )

/* =============================================================================
   The number of control equations depends on what options are included.
   At the high end of the table, position of a few variables depends on
   what extensions are included. Together with MIDGETV_UCODE_NREQ this
   ensure a table with "no holes" for later optimalization.
*/

#define MIDGETV_UCODE_NREQ                      \
        (ucodeopt_MULDIV ?                      \
         (ucodeopt_RVC ? 46 : 45   ) :          \
         (ucodeopt_RVC ? 43 : 42   ))

#if (ucodeopt_MULDIV == 0) && (ucodeopt_RVC == 1 )
#define extCbase 42
#define extMbase 43
#else
// For cores rv32i,rv32im,rv32imc:
#define extMbase 42
#define extCbase 45
#endif


/* 3 extra variables when MULDIV */
#define MCLRpos    extMbase
#define Mbranchpos (extMbase+2)

/* 1 extra variable when RVC */
#define RVCpcincctrlpos extCbase

/* =============================================================================
 * The following is definition of fields of microcode
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
#define A_nearXOR                                           ( IO << 18 ) | ( OOOxx <<9 )  // B = D^(~Q)                               
#define A_iszero                                            ( IO << 18 ) | ( OOOII <<9 )  // Used in DIV to test for zero in a particular setting
#define A_passd                                             ( IO << 18 ) | ( OOIxx <<9 )  // D
#define A_invq                                              ( IO << 18 ) | ( OIOxx <<9 )  // ~Q
#define A_nearAND                                           ( IO << 18 ) | ( OIIxx <<9 )  // D&(~Q)           
#define A_addDQ                            (I<<MCLRpos) |   ( IO << 18 ) | ( IOOOO <<9 )  // D+Q         subtle interaction between MULDIV and branch, need (I<<42)
#define A_cycnt                            (I<<MCLRpos) |   ( II << 18 ) | ( IOOOO <<9 )  // D+cyclecnt  subtle
#define A_add1                             (I<<MCLRpos) |   ( IO << 18 ) | ( IOOII <<9 )  // D+Q+1
#define A_add3                             (I<<MCLRpos) |   ( OO << 18 ) | ( IOOOO <<9 )  // D+(Q|3)+0   subtle, needed see test prog t154.S                                  
#define A_add4                            (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII <<9 )  // D+(Q|3)+1
#define A_add3w                            (I<<MCLRpos) |   ( OO << 18 ) | ( IOOOO <<9 )  // D+(Q|3)+0   subtle, needed see test prog t154.S Revise all use of this
#define A_add4w                           (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII <<9 )  // D+(Q|3)+1   REVISE all use of this
#define A_add2or4 (I<<RVCpcincctrlpos) |  (II<<MCLRpos) |   ( OO << 18 ) | ( IOOII <<9 )  // D+(Q|((~rvc_pcinc<<1,1))+1 

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
////                       ssss         
////          sa41         2211         
////          |            1098         
#define Wnn   (I <<39) | (OOOO <<26) // No write. Set SEL_O = 4'b1111
#define Wbp   (I <<39) | (OOIO <<26) // Prepare write byte. Setup SEL_O as per B[1:0].
#define Whp   (I <<39) | (OOOI <<26) // Prepare write halfword. Setup SEL_O as per B[1]
#define WAQb              (OOIO <<26) // Write to MEM, adr in Q
#define WAQh              (OOOI <<26) // Write to MEM, adr in Q
#define WAQW              (OOII <<26) // Write to MEM, adr in Q
#define WTRG              (OIOO <<26) // Write target reg. 
#define Wjj               (IOOO <<26) // Write to jj
#define Wrinst            (IOOI <<26) // Write to rinst
#define Wpc               (IOIO <<26) // Write B to PC
#define Wttime            (IOII <<26) // Write to tinytime
#define Wyy               (IIOO <<26) // Write to scratch register yy
#define Wmepc             (IIOI <<26) // Write to mepc
#define Wmcaus            (IIIO <<26) // Write to mcause
#define Wmtval            (IIII <<26) // Write to mtval

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



//                                               Read into   ADR1Mustbe0
//                      use_brcond  shrep        Instruction |Adr0Mustbe0
//                      |           |    sa33    |           ||use_dinx
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


/* =============================================================================
 * This file works by repeated inclusion (x-macros).  Default
 * expansion of the below is the constants that make up a ucode
 * instruction
 */
#ifndef Y
#define Y(fixedpos, paired, ...) X(__VA_ARGS__) /* X-macro expansion help */
#endif

/* =============================================================================
 *
 * Simplified diagrams of some bus cycles. Do not use blindly, look at definitions.
 *
 * Reading from EBR
 * 
 * executes ucode:     LW_0        LW_1        StdIncPc
 * nextucode| LW_0   | LW_1      | StdIncPc  | Fetch
 * B       ||        | [RS1]+imm |  data     | pc+4        |
 * DAT_O   ||        | [RS1]     | data      | pc          |
 * ADR_O   ||        | imm       | [RS1]+imm | 0
 *         || _______             _________________________
 * iwe     ||        \ __________/                         \

 * All the rest wrong.
 *
 * Reading from SRAM (reading from input is similar)
 * B       || adr    |           |             |   data      |
 * ADR_O   ||        | adr       | adr         |  /          |
 * SRAMout ||        |           | data        | /           |
 * rDee    ||        |           |             | data        |
 *                    _________________________
 * STB_O ____________/            _____________\______________
 * ACK_I ________________________/             \______________
 *
 * Executing from EBR, no retired instruction counter
 *                                               1st instr
 *         ||StdIncPc| Fetch     | Fetch2      | ucode
 * I       ||        | op        | op          | op
 * B       || pc+4   |           | ttime+cycnt | 
 * DAT_O   ||        | op        | ttime       | [RS1]
 * ADR_O   ||        | pc+4      | 0           | Imm
 * 
 * Executing from EBR, with retired instruction counter
 *                                                            1st instr
 *         ||StdIncPc| Fetch     | Fetch2      | Fetch3      | ucode
 * I       ||        | op        | op          | op          | op
 * B       || pc+4   |           | ttime+cycnt | rinst+1     | 
 * DAT_O   ||        | op        | ttime       | rinst       | [RS1]
 * ADR_O   ||        | pc+4      | 0           |             | Imm
 * 
 * Executing from SRAM, no retired instruction counter
 *                                                                           1st instr
 *         ||StdIncPc| eFetch(1) | eFetch(2)   | eFetch(3)   | eFetch2     | ucode
 * I       ||        |           |             |             | op          | op
 * B       || pc+4   |           |             |             | ttime+cycnt |   
 * DAT_O   ||        |           | FFFFFFFF    | FFFFFFFF    | ttime       | [RS1]
 * ADR_O   ||        | pc+4      | pc+4        |             | 0           | Imm
 * SRAMout ||        |           | op          |             |             |
 * rDee    ||        |           |             |             | op          |
 *                    _________________________
 * STB_O ____________/            _____________\______________
 * ACK_I ________________________/             \______________
 *
 *
 */

//                                                                                  ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  action       | op          adr/en  read adr    op     op      operation        ucode
#define _jFault   jFault,  " err   Fetch access fault. Faulting adr to mtval",      isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(jFault_1)  // [6] Must be after [5]
#define _jFault_1 jFault_1,"       Store 1 to mcause",                              isr_none     | A_add1    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//efine _LDAF_3   LDAF_3,  "       PC to mepc",                                     
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             

#if   ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 0

#if ucodeopt_RVC == 0
#define _StdIncPc StdIncPc," Fr00  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr00  Read and latch instruction",                     isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr00  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx      
#define _eFetch   eFetch,  " Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2 )   // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr00  Not in use",                                     unx
#define _eFetch3  eFetch3, " Fr00  Not in use",                                     unx
#else
/* When RVC is implemented, I ran into a problem with unaligned 32-bit instructions.
 * The essential problem was that pc may be incremented to straddle the two words
 * that contain the 32-bit instruction, but then PC is too large (by 2) for
 * instructions that uses PC as an addres. This is at least AUIPC, BEQ,BNE, etc
 */
#define _StdIncPc StdIncPc," Fr00  IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr00  Read and latch instruction",                     isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to jj
#define _Fetch2   Fetch2,  " Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned ", isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // [5] Must be at even ucode adr. At unaligned 32-bit instr goto unalignd, else done.
#define _eFetch   eFetch,  " Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#define _unalignd unalignd," Fr00u Unaligned pc, prep read high hword",             isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr
#define _straddle straddle," Fr00u IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // [1] Must be at even ucode adr. Goes to either Fetchu or eFetchu. 
#define _Fetchu   Fetchu , " Fr00u Read and latch instruction",                     isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to yy
#define _eFetchu  eFetchu, " Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM

#define _eFetch2  _unalignd // Reused
#define _eFetch3  _straddle // Reused

#endif

#elif ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 0

#if ucodeopt_RVC == 0
#define _StdIncPc StdIncPc," Fr10  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr10  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr10  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      // [5] Must be at even ucode adr. 
#define _eFetch   eFetch,  " Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr10  Update ttime",                                   isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )
#define _eFetch3  eFetch3, " Fr10  Update minstret, Q=immediate. Use dinx",         isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx
#else
#define _StdIncPc StdIncPc," Fr10  IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr10  Read and latch instruction",                     isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr10  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // [5] Must be at even ucode adr. At unaligned 32-bit instr goto unalignd, else done
#define _eFetch   eFetch,  " Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr10  Update ttime",                                   isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )
#define _eFetch3  eFetch3, " Fr10  Update minstret, Q=immediate. Use dinx",         isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  //  At unaligned 32-bit instr goto unalignd, else done

#define _unalignd unalignd," Fr10u Unaligned pc, prep read high hword",             isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr
#define _straddle straddle," Fr10u IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // [1] Must be at even ucode adr. Goes to either Fetchu or eFetchu. 
#define _Fetchu   Fetchu , " Fr10u Read and latch instruction",                     isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to yy
#define _eFetchu  eFetchu, " Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#endif

#elif ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 1

#if ucodeopt_RVC == 0
#define _StdIncPc StdIncPc," Fr11  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr11  Read and latch instruction",                     isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr11  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )  // [5] Must be at even ucode adr. 
#define _eFetch   eFetch,  " Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#define _eFetch2  eFetch2, " Fr11  Not in use",                                     unx
#define _eFetch3  eFetch3, " Fr11  Write minstret. Update I. Q=immediate, use dinx",isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx
#else
#define _StdIncPc StdIncPc," Fr11  IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr11  Read and latch instruction",                     isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr11  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )  // [5] Must be at even ucode adr. 
#define _eFetch   eFetch,  " Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#define _eFetch2  _Fetch2u // Reused
#define _Fetch2u  Fetch2u, " Fr11  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      //  
#define _eFetch3  eFetch3, " Fr11  Write minstret. Update I. Q=immediate, use dinx",isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // At unaligned 32-bit instr goto unalignd, else done

#define _unalignd unalignd," Fr10u Unaligned pc, prep read high hword",             isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr
#define _straddle straddle," Fr10u IncPC, OpFetch",                                 nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // [1] Must be at even ucode adr. Goes to either Fetchu or eFetchu. 
#define _Fetchu   Fetchu , " Fr10u Read and latch instruction",                     isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2u )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to yy
#define _eFetchu  eFetchu, " Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2u )  // [4]] Must be at address after [3]. Fetch from SRAM
#endif

#else
#error Que?
#endif                                                                                                                                                               


#define _aFault   aFault,  " err   Load access fault. Faulting adr to mtval",       isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [2] Must be after [1]
#define _aFault_1 aFault_1,"       Q = 4",                                          isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aFault_2)
#define _aFault_2 aFault_2,"       Store 5 to mcause",                              isr_intoTrap | A_add1    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//efine _LDAF_3   LDAF_3,  "       PC to mepc",                                     
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             

/* Note. It is legal to read a byte from input devices. Seen from the
 * side of the input device, a word read access is performed.
 */                                                                                                                                                                 
#define _LB_0     LB_0    ,"LB     Load byte. q = rdadr=RS1+0fs",                   nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr43a | u_cont         | n(LB_1    )  
#define _LB_1     LB_1    ,"       Read until q=mem[rs1+ofs) & ~3u]",               isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LB_2    )
#define _LB_2     LB_2    ,"       Repeat shr until shreg == 0 (0,8,16,24 times)",  isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LB_3    )  // [gg] Must be even ucodeadr
#define _LB_3     LB_3    ,"       q = ~mem[rs1+ofs]",                              isr_none     | A_invq    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(LB_4    )  
#define _LB_4     LB_4    ,"       q = (uint8_t) mem[rs1+Iimm]",                    isr_none     | A_nearAND | Wnn   | rFFFFFF7F | Qu   | sr_h  | u_cont         | n(LB_5    )  
#define _LB_5     LB_5    ,"       q = D^0xffffffff^q = D^0x80",                    isr_none     | A_nearXOR | Wnn   | rFFFFFF7F | Qu   | sr_h  | u_cont         | n(LB_6    )
#define _LB_6     LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80",       isr_none|MLD | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIVU_5. Kluge to let add1 work in DIV instr
//                                                                                                                                                               
#define _aFaultd  aFaultd, " err   LB Load access fault. Faulting adr to mtval",    isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[hh] Must follow [gg]
//                                                                                                                                                               
#define _LBU_0    LBU_0,   "LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.",        nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr43a | u_cont         | n(LBU_1)     
#define _LBU_1    LBU_1   ,"       Read until q=mem[(rs1+ofs) & ~3u]",              isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LBU_2)     
#define _LBU_2    LBU_2   ,"       Repeat shr until shreg = 0 (0, 8 or 16 times)",  isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LBU_3)    // [ii] Must be even ucodeadr
#define _LBU_3    LBU_3   ,"       Invert q. Prepare read mask",                    isr_none     | A_invq    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//efine _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                
//efine _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                                 
#define _aFaulte  aFaulte, " err   LBU Load access fault. Faulting adr to mtval",   isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[jj] Must follow [ii]
//                                                                                                                                                               
/*
 * For word in SRAM or Input
 * LW_0 Address out of ALU, into Q
 * LW_1 No ACK: Data written to targetregister. Prepare read 0xFFFFFFFF. Q held. Repeat
 * LW_1 ACK:    Data written to targetregister. Prepare PC read. Q clear. 
 *
 * For word in ebr, we try to modify the about the least possible.
 * LW_O Address out of ALU. into Q
 * LW_1 Data written to targetregister. Prepare PC read. Q clear.
 *
 */
#define _LW_0     LW_0,    "LW     Load word. Q=yy=rdadr=RS1+Iimm",                 nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | wordaligned    | n(LW_1)      
#define _LW_1     LW_1,    "       Read until d=mem[(rs1+ofs) & ~3u]",              isr_none     | A_passd   | WTRG  | rHorPC    | Qcndz| sr_h  | u_io_i         | n(StdIncPc)       // [aa] Just before [bb]
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _LHU_0    LHU_0,   "LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.",       nxtSTB       | A_addDQ   | Wyy   | Ralu      | Qu   | sr43a | hwordaligned   | n(LHU_1)     
#define _LHU_1    LHU_1,   "       Read until q=mem[(rs1+ofs) & ~3u]",              isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LHU_2 )    // Even ucodeadr
#define _LHU_2    LHU_2,   "       Repeat shr until shreg = 0 (0, 8 or 16 times)",  isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LHU_3 )    // [ee] Must be even ucodeadr
#define _LHU_3    LHU_3,   "       Invert q. Prepare read mask",                    isr_none     | A_invq    | Wnn   | r0000FFFF | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//efine _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                isr_none     | A_nearAND | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//
#define _aFaultc  aFaultc, " err   LHU Load access fault. Faulting adr to mtval",   isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[ff] Must follow [ee]
//                                                                                                                                                               
#define _LDAF(x)  x,       " err   LD AlignFault. Faulting adr to mtval",           isr_none     | A_passq   | Wmtval| r00000000 | Qhld | sr_h  | u_cont         | n(LDAF_a)    // [bb] Just after [aa]
#define _LDAF_a   LDAF_a,  "       Extra cycle after error detected write mtval",   isr_none     | A_xx      | Wnn   | r00000000 | Qz   | sr_h  | u_cont         | n(LDAF_2)
#define _LDAF_2   LDAF_2,  "       Store 4 to mcause",                              isr_intoTrap | A_add4w   | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)    
#define _LDAF_3   LDAF_3,  "       PC to mepc",                                     isr_none     | A_passd   | Wmepc | rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             
//                                                                                                                                                               
#define _LH_0     LH_0,    "LH     Load hword. Q = rdadr=RS1+Iimm.",                nxtSTB       | A_addDQ   | Wyy   | Ralu      | Qu   | sr43a | hwordaligned   | n(LH_1)      
#define _LH_1     LH_1,    "       Read until q=mem[(rs1+ofs) & ~3u]",              isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LH_2)      // Even ucodeadr
#define _LH_2     LH_2,    "       Repeat shr until shreg = 0 (0, 8 or 16 times)",  isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LH_3)      // [cc] Must be even ucodeadr
#define _LH_3     LH_3,    "       q = ~mem[rs1+ofs]",                              isr_none     | A_invq    | Wnn   | r0000FFFF | Qu   | sr_h  | u_cont         | n(LH_4)      
#define _LH_4     LH_4,    "       q = (uint16_t) mem[rs1+Iimm]",                   isr_none     | A_nearAND | Wnn   | rFFFF7FFF | Qu   | sr_h  | u_cont         | n(LH_5)      
#define _LH_5     LH_5,    "       q = D^0xffffffff^q = D ^ 0x00008000",            isr_none     | A_nearXOR | Wnn   | rFFFF7FFF | Qu   | sr_h  | u_cont         | n(LB_6)      
//efine _LB_6     LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80 (join)",isr_none     | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//efine _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//
#define _aFaultb  aFaultb, " err   LH Load access fault. Faulting adr to mtval",    isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[dd] Must follow [cc]
//
#define _BEQ      BEQ,     "BEQ    Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BNE      BNE,     "BNE    Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BLT      BLT,     "BLT    Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )   
#define _BGE      BGE,     "BGE    Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BLTU     BLTU,    "BLTU   Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BGEU     BGEU,    "BGEU   Conditional Branch. Offset to Ryy",              isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )
//
#if ucodeopt_RVC == 0        
#define _condb_2  condb_2, "       ~RS2 in Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(condb_3 )  
#define _condb_3  condb_3, "       Calculate RS1+~RS2+1",                           isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(condb_4 )  
#define _condb_4  condb_4, "       Branch on condition",                            isr_none     | A_passd   | Wnn   | Ryy       | Qu   | sr_h  | usebcond       | n(condb_5 )  
#define _condb_5  condb_5, "       Branch not taken.",                              nxtSTB       | A_passq4  | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  /* Must be placed at even ucode adr. Goes to either Fetch or eFetch     */
#define _condb_5t condb_5t,"       Branch taken.",                                  nxtSTB       | A_addDQ   | Wpc   | Ralu      | Qu   | sr_h  | wordaligned    | n(BrOpFet )  /* Must be placed at the next ucode adr */
#else
#define _condb_2  condb_2, "       ~RS2 in Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(condb_3 )  
#define _condb_3  condb_3, "       Calculate RS1+~RS2+1",                           isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(condb_4 )  // next Get back the offset
#define _condb_4  condb_4, "       Branch on condition",                            isr_none     | A_passd   | Wnn   | Rjj       | Qu   | sr_h  | usebcond       | n(condb_5 )  // next get back PC for next consequtive instr
#define _condb_5  condb_5, "       Branch not taken.",                              isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  /* Must be placed at even ucode adr. Goes to either Fetch or eFetch     */
#define _condb_5t condb_5t,"       Branch taken.",                                  nxtSTB       | A_addDQ   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   ) 
#endif

#if ucodeopt_RVC == 0
#define _BrOpFet  BrOpFet ,"NewOp2 Read until instruction latched",                 isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  /* Must be placed at even ucode adr     */ 
#define _BAlignEr BAlignEr," Err   Branch target instruction address misaligned",   isr_none     | A_xx      | Wnn   | Rpc       | Qx   | sr_h  | u_cont         | n(BAERR_1)   /* Must be placed at the next ucode adr */
#define _BAERR_1  BAERR_1, "       Faultadr to mtval. Prepare get offset",          isr_none     | A_passd   | Wmtval| Ryy       | Qz   | sr_h  | u_cont         | n(BAERR_2)   
#define _BAERR_2  BAERR_2, "       ~offset to Q. Prep read (origPC+offset)",        isr_none     | A_nearXOR | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(BAERR_3)   
#define _BAERR_3  BAERR_3, "       origPC to mepc. Prep read 0",                    isr_none     | A_add1    | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
#define _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    isr_intoTrap | A_passd   | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)   
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
#else
#define _BrOpFet  _unalignd // Reused
#define _BAlignEr _straddle // Reused
#define _BAERR_1  BAERR_1, "      not used",                                        unx
#define _BAERR_2  _Fetchu   // Reused   | These two must be consequtive
#define _BAERR_3  _eFetchu  // Reused   |
#define _BAERR_4  BAERR_4, "      not used",                                        unx
#endif

#define _SUB_0    SUB_0,   "SUB    Subtraction",                                    isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SUB_1  )    
#define _SUB_1    SUB_1,   "       Q = ~RS2",                                       isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(LB_6   )    
//      _LB_6     LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80 (join)",isr_none     | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                  isr_none     |                                                                              
#define _ANDI_0   ANDI_0,  "ANDI   And immediate. Q=~Iimm",                         isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(ANDI_1)    
#define _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                isr_none     | A_nearAND | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _ORI_0    ORI_0,   "ORI    Or immediate. jj=~Iimm",                         isr_none     | A_invq    | Wjj   | RS1       | Qzh  | sr_h  | u_cont         | n(ORI_1)     
#define _ORI_1    ORI_1,   "       Q = RS1",                                        isr_none     | A_passd   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(ORI_2   )  
#define _ORI_2    ORI_2,   "       rd = Iimm | RS1",                                isr_none     | A_nearOR  | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _XORI_0   XORI_0,  "XORI   Xor immediate. Q=~Iimm",                         isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(XORI_1)    
#define _XORI_1   XORI_1,  "       rd = Iimm ^ RS1",                                isr_none     | A_nearXOR | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _AND_0    AND_0,   "AND    And ",                                           isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(AND_1)     
#define _AND_1    AND_1,   "       RS1^0xffffffff to Q",                            isr_none     | A_nearXOR | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//efine _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                isr_none     | A_nearAND | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _OR_0     OR_0,    "OR     or",                                             isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(OR_1)      
#define _OR_1     OR_1,    "       RS1^0xffffffff to jj",                           isr_none     | A_nearXOR | Wjj   | RS2       | Qzh  | sr_h  | u_cont         | n(OR_2)      
#define _OR_2     OR_2,    "       Q = rs2",                                        isr_none     | A_addDQ   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(ORI_2)     
//efine _ORI_2    ORI_2,   "       rd = Iimm | RS1",                                isr_none     | A_nearOR  | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _XOR_0    XOR_0,   "XOR    xor",                                            isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(XOR_1)     
#define _XOR_1    XOR_1,   "       Q = RS1^0xFFFFFFFF",                             isr_none     | A_nearXOR | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(XORI_1)    
//efine _XORI_1   XORI_1,  "       rd = Iimm ^ RS1",                                isr_none     | A_nearXOR | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _SLTIU_0  SLTIU_0, "SLTIU  Set less than immediate (unsigned)",             isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
#define _SLTIX_1  SLTIX_1, "       RS1 - imm / RS1 - RS2",                          isr_none     | A_add1    | Wnn   | r_xx      | Qz   | sr_h  | u_cont         | n(SLTIX_2)   
#define _SLTIX_2  SLTIX_2, "       Registered ALU flag to rd",                      isr_none     | A_passq_F | WTRG  | Rpc       | Qzh  | sr_h  | u_cont         | n(StdIncPc)  

#define _SLTI_0   SLTI_0,  "SLTI   Set less than immediate (signed)",               isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   

#define _SLT_0    SLT_0,   "SLT    Set less than (signed)",                         isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    
#define _SLTX_1   SLTX_1,  "       ~rs2 to Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   

#define _SLTU_0   SLTU_0,  "SLTU   Set less than (unsigned)",                       isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    

// Have changed decode so I do not need 16 copies of _LUI_0, only 2
#define _LUI_0(x) x,       "LUI    q = imm20",                                      isr_none     | A_passq   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _ADDI_0   ADDI_0,  "ADDI   Add immediate. rd =RS1+Iimm (or joined)",        isr_none     | A_addDQ   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
#if ucodeopt_RVC == 0
#define _AUIPC_0(x) x,     "AUIPC  q = imm20 (copy x/8)",                           isr_none     | A_xx      | Wnn   | Rpc       | Qhld | sr_h  | u_cont         | n(ADDI_0)    
#else
#define _AUIPC_0(x) x,     "AUIPC  q = imm20+2 or imm20+4  (copy x/8)",             isr_none     | A_xx      | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(ADDI_0)
#endif

#define _ADD_0    ADD_0,   "ADD    add     Addition Q = RS1",                       isr_none     | A_passd   | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(ADDI_0)    
//efine _ADDI_0   ADDI_0,  "ADDI   Add immediate. rd =RS1+Iimm (or joined)",        isr_none     | A_addDQ   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#if ucodeopt_RVC == 0
//             In first cycle, must use A_passq because alignment is                                                                                             
//             determined from output of B. */                                                                                                                   
#define _JAL_0(x) x,       "JAL    J-imm is in q. Branch on alignfault",            isr_none     | A_passq   | Wnn   | Rpc       | Qhld | sr_h  | wordaligned    | n(JAL_1)
#else
#define _JAL_0(x) x,       "JAL    J-imm is in q.",                                 isr_none     | A_passq   | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(JAL_1)
#endif
#define _JAL_1    JAL_1,   "       Target adr to yy",                               isr_none     | A_addDQ   | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)     
#define _JAL_2    JAL_2,   "       Return address to TRG",                          isr_none     | A_add2or4 | WTRG  | Ryy       | Qx   | sr_h  | u_cont         | n(JAL_3)   /* [qq] JAL_2 must be at even ucodeadr */
#define _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             nxtSTB       | A_passd   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)   /* Goes to either Fetch or eFetch */

#if ucodeopt_RVC == 0
//                                                                                                                                                               
//             The first of these instructions must be placed directly                                                                                           
//             following the JAL_1 instruction                                                                                                                   
#define _JAERR_1  JAERR_1, " Err   JAL target adr misaligned, store to mtval",      isr_none     | A_addDQ   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(JAERR_2)   
#define _JAERR_2  JAERR_2, "       Store PC to mepc",                               isr_none     | A_passd   | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
//efine _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",
#else
#define _JAERR_1  JAERR_1, "       Not in use",                                     unx
#define _JAERR_2  JAERR_2, "       Not in use",                                     unx
#endif


//                                                                                                                                                               
#define _SLLI_0   SLLI_0,  "SLLI   Shift left immediate.",                          isr_none     | A_passq   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SLLI_1)    
#define _SLLI_1   SLLI_1,  "       Register to shift to Q (and TRG for shift 0)",   isr_none     | A_passd   | WTRG  | rFFFFFFFF | Qu   | srDec | u_cont         | n(SLLI_2  )  
#define _SLLI_2   SLLI_2,  "       Repeat Q = Q+Q until shregcnt == 0",             isr_none     | A_shlq    | WTRG  | rFFFFFFFF | Qu   | srDec | u_shrep        | n(FENCE   )  
//efine _FENCE(x) x,       "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
#define _SLL_0    SLL_0,   "SLL    Shift left",                                     isr_none     | A_xx      | Wnn   | RS2       | Qx   | sr_h  | u_cont         | n(SLL_1)     
#define _SLL_1    SLL_1,   "       Shiftamount was in low 5 bits of RS2",           isr_none     | A_passd   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SLLI_1)    
//efine _SLLI_1   SLLI_1,  "       Register to shift to Q (and TRG for shift 0)",   
//efine _SLLI_2   SLLI_2,  "       Repeat Q = Q+Q until shregcnt == 0",             
//efine _FENCE(x) x,       "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
#define _SRxI_0   SRxI_0,  "SRxI   Shift Right immediate (both logic/arith here)",  isr_none     | A_passq   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SRxI_1  )  
#define _SRxI_1   SRxI_1,  "       Register to shift to Q",                         isr_none     | A_passd   | WTRG  | r00000000 | Qu   | srDec | u_cont | psa00 | n(SRxI_2)    
#define _SRxI_2   SRxI_2,  "       Repeat Q >>= 1 until shregcnt == 0",             isr_none     | A_passd   | WTRG  | r00000000 | Qshr | srDec | u_shrep        | n(FENCE )    
//efine _FENCE(x) x,       "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
#define _SRx_0(x) x,       "SRx    Shift Right (both SRL and SRA)",                 isr_none     | A_xx      | Wnn   | RS2       | Qx   | sr_h  | u_cont         | n(SRx_1)     
#define _SRx_1    SRx_1,   "       Shiftamount in low 5 bits of RS2",               isr_none     | A_passd   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SRxI_1)    
//efine _SRxI_1   SRxI_1,  "       Register to shift to Q",                         
//efine _SRxI_2   SRxI_2,  "       Repeat Q >>= 1 until shregcnt == 0",             
//efine _SLLI_3   SLLI_3,  "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
#define _JALR_0   JALR_0,  "JALR   jj=RS1+imm",                                     isr_none     | A_addDQ   | Wjj   | r00000000 | Qz   | sr_h  | u_cont         | n(JALR_1)    
#define _JALR_1   JALR_1,  "       Q=1",                                            isr_none     | A_add1    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(JALR_2)    
#if ucodeopt_RVC == 0
#define _JALR_2   JALR_2,  "       Q = (RS1+imn) & 0xfffffffe",                     isr_none     | A_nearAND | Wyy   | Rpc       | Qz   | sr_h  | wordaligned    | n(JAL_2)
#else
#define _JALR_2   JALR_2,  "       Q = (RS1+imn) & 0xfffffffe",                     isr_none     | A_nearAND | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)
#endif
//                                                                                                                                                               
#if ucodeopt_RVC == 0
///* The next instruction must follow JAL_2 (no typo) */                                                                                                         
#define _JALRE1   JALRE1,  " err   Store pc to mepc",                               isr_none     | A_passd   | Wmepc | Ryy       | Qx   | sr_h  | u_cont         | n(JALRE2)    // [rr] follows [qq]
#define _JALRE2   JALRE2,  "       mtval is target",                                isr_none     | A_passd   | Wmtval| r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
//efine _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
#else
#define _JALRE1   JALRE1,  "       Not in use",                                     unx
#define _JALRE2   JALRE2,  "       Not in use",                                     unx
#endif        
//                                                                                                                                                               
#define _SW_0(x)  x,       "SW     Store word. Q=wradr=RS1+Simm",                   nxtSTB |nxtWE| A_addDQ   | Wnn   | RS2       | Qu   | sr_h  | wordaligned    | n(SW_1)      
#define _SW_1     SW_1,    "       Write d to a+k until accepted",                  isr_none     | A_passd   | WAQW  | RS2       | Qhld | sr_h  | u_io_o         | n(SW_2)      // [A] even ucode adr 
#define _SW_2     SW_2,    "       Prepare read PC",                                isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // [C] even ucode adr   
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//
#define _aF_SW    aF_SW,   " err   SW/SH/SB access fault. Rest to set SEL_O=4'hf",  isr_none     | A_xx      | Wnn   | r_xx      | Qhld | sr_h  | u_cont         | n(aF_SW_1)   // [D] directly following [C]
#define _aF_SW_1  aF_SW_1, " err   SW Store access fault. Faulting adr to mtval",   isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aF_SW_2)
#define _aF_SW_2  aF_SW_2, "       Q = 4",                                          isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aF_SW_3)
#define _aF_SW_3  aF_SW_3, "       Store 7 to mcause",                              isr_intoTrap | A_add3w   | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//efine _LDAF_3   LDAF_3,  "       PC to mepc",                                     
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             
//
#define _SW_E1(x) x,       "       Store faulting address alignment to mtval",      isr_none     | A_passq   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(SW_E2)     // [B] directly following [A]
#define _SW_E2    SW_E2,   "       Store address that faulted",                     isr_none     | A_passd   | Wmepc | rFFFFFFFF | Qz   | sr_h  | u_cont         | n(SW_E3)     
#define _SW_E3    SW_E3,   "       Q = 3",                                          isr_none     | A_add4w   | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(SW_E4)     
#define _SW_E4    SW_E4,   "       Store 6 to mcause",                              isr_intoTrap | A_shlq    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
#define _SH_0(x)  x,       "SH     Store halfword. jjw=wradr=RS1+Simm",             isr_none     | A_addDQ   | Wjj   | RS2       | Qu   | sr43a | hwordaligned   | n(SH_1)      
#define _SH_1     SH_1,    "       Write d to Q and yy (for sh 0). Prep shift",     isr_none     | A_passd   | Wyy   | rFFFFFFFF | Qu   | srDec | u_cont         | n(SH_2)      
#define _SH_2     SH_2,    "       Repeat shl until shreg = 0 (0,8 or 24 times)",   isr_none     | A_shlq    | Wyy   | rFFFFFFFF | Qu   | srDec | u_shrep        | n(SH_3)      
#define _SH_3     SH_3,    "       Prepare get back address to use ",               isr_none     | A_passq   | Wnn   | Rjj       | Qz   | sr_h  | u_cont         | n(SH_4)      
#define _SH_4     SH_4,    "       Address back to Q. Prepare get item to write",   nxtSTB |nxtWE| A_passd   | Whp   | Ryy       | Qu   | sr_h  | u_cont         | n(SH_5)      
#define _SH_5     SH_5,    "       Write d to a+k until accepted",                  isr_none     | A_passd   | WAQh  | Ryy       | Qhld | sr_h  | u_io_o         | n(SW_2)
//efine _SW_2     SW_2,    "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 


#if ucodeopt_MULDIV

#define _MULHU_0  MULHU_0, "MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--",  isr_none     |MA_passd   | Wyy   | RS2       | Qz   | srDec | u_cont         | n(MULHU_1)
#define _MULHU_1  MULHU_1, "       rM<=RS2,  Rjj<=Q=0. next read RS1. ",            isr_none|MLD |MA_passq   | Wjj   | RS1       | Qz   | sr_h  | u_cont         | n(MULHU_2)   // sa14 == 0 so this loads rM. Also clears rF
#define _MULHU_2  MULHU_2, "       Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar",        isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | srDec | u_cont | psa00 | n(MULHU_3)   // (Must be even ucode adr). Either ADD or PASSQ
#define _MULHU_3  MULHU_3, "       Shift Q and rM. Prepare read rs1",               isr_none|MSL |MA_passd   | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(MULHU_2)   // xxxxxxxxxxxxxxxxxxxxxxxxxxxx document me. Loops
#define _MULHU_4  MULHU_4, "       Prepare read Rjj.",                              isr_none     |MA_nearXOR | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(MULHU_5)   // Must follow MULHU_2
#define _MULHU_5  MULHU_5, "       Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy",       isr_none     |MA_addDQm  | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(MULHU_6)
#define _MULHU_6  MULHU_6, "       Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar",   isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | sr_h  | u_cont | psa00 | n(MULHU_7)
#define _MULHU_7  MULHU_7, "       Last shift.",                                    isr_none|MSL |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)   // Investigate - MSL will work as a MLD here, I don't think it matters but it is confusing
                                                                                                  
#define _MULHSU_0 MULHSU_0,"MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--",    isr_none     |MA_passd   | Wyy   | RS2       | Qz   | srDec | u_cont         | n(MULHU_1)
                                                                                                  
#define _MULH_0   MULH_0,  "MULH   Store rs1 to Q. Prep read 0, shcnt--",           isr_none     |MA_passd   | Wnn   | r00000000 | Qu   | srDec | u_cont         | n(MULH_1)
#define _MULH_1   MULH_1,  "       Store ~rs1 to Ryy. Prep construct 1.",           isr_none     |MA_nearXOR | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(MULH_2)
#define _MULH_2   MULH_2,  "       Store 1 to Rjj. next read rs2, Q=0",             isr_none     |MA_add1    | Wjj   | RS2       | Qzh  | sr_h  | u_cont         | n(MULH_3)
#define _MULH_3   MULH_3,  "       rM<=RS2, Q = 0. next read RS1. Join.",           isr_none|MLD |MA_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(MULHU_2)
                                                                                                  
#define _MUL_0    MUL_0,   "MUL    Store rs1 tp rM. Next read rs2. Q clear",        isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(MUL_1)
#define _MUL_1    MUL_1,   "       Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar",        isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | srDec | u_cont | psa00 | n(MUL_2)     // Must be even ucode adr
#define _MUL_2    MUL_2,   "       Shift Q and rM. Prepare read rs2",               isr_none|MSL |MA_passd   | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(MUL_1)     // Loops
#define _MUL_3    MUL_3,   "       Transfer rM to rDee",                            isr_none|MCLR|MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont | psa00 | n(ANDI_1)    // Must follow MUL_1
                                                                                                                                                                               
#define _DIVU_0   DIVU_0,  "DIVU   Store rs1 to rM. Q=0. Prepare invert rs2",       isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | srDec | u_cont         | n(DIVU_1)    
#define _DIVU_1   DIVU_1,  "       Store inverted rs2 to yy. Prepare shift",        isr_none     |MA_nearXOR | Wyy   | rFFFFFFFF | Qzh  | sr_h  | u_cont         | n(DIVU_2)    
#define _DIVU_2   DIVU_2,  "       Shift (Q,M) left. Prepare unsigned sub",         isr_none|MSL |MA_shlqdiv | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIVU_3)    // loops because ceM set and rlastshift clear
#define _DIVU_3   DIVU_3,  "       Conditionally subtract rs2. Update M[0]",        isr_none|CH  |MA_usub    | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont         | n(DIVU_2)    // Must be even ucode adr
#define _DIVU_4   DIVU_4,  "       Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]", isr_none|CH13|MA_usub    | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(DIVU_5)    // Must follow DIVU_3. 
#define _DIVU_5   DIVU_5,  "       Transfer rM to rDee",                            isr_none|MCLR|MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont | psa00 | n(ANDI_1)    // Must be even ucode adr
//efine _DIVU_6   DIVU_6,  "       Write Q to destination for REMU",                isr_none     |MA_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIVU_5  Is covered by _LB_6
                                                                                                  
#define _REMU_0   REMU_0,  "REMU   Store dividend to rM. Prepare read divisor.Q=0", isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | srDec | u_cont         | n(DIVU_1)
// 20 left?                                                                                       
/* First make abs(RS1) (dividend) and                                                             
 * ~abs(RS1) (divisor), if RS1 >= 0, ~abs(RS1) == ~RS1                                            
 *                      if RS1 < 0,  ~abs(RS1) = ~(~RS1+1)                                        
 */                                                                                               
#define _REM_0    REM_0,   "REM    Branch on sign dividend RS1",                    isr_none     |MA_passd   | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont | bsign | n(DIV_1)
                                                                                                  
#define _DIV_0    DIV_0,   "DIV    Branch on sign dividend RS1",                    isr_none     |MA_passd   | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont | bsign | n(DIV_1)
#define _DIV_1    DIV_1,   "       jj=abs(RS1). Next handle divisor",               isr_none     |MA_nearXOR | Wjj   | RS2       | Qz   | sr_h  | u_cont         | n(DIV_3)     // Even ucode adr
#define _DIV_2    DIV_2,   "       Dividend negative, make RS1-1",                  isr_none     |MA_addDQ   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(DIV_1)     // Must follow DIV_1
#define _DIV_3    DIV_3,   "       Branch on sign divisor RS2",                     isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont | bsign | n(DIV_4)
#define _DIV_4    DIV_4,   "       ~abs(divisor) to yy",                            isr_none     |MA_passq   | Wyy   | Rjj       | Qz   | sr_h  | u_cont         | n(DIV_6)     // Even ucode adr
#define _DIV_5    DIV_5,   "       Kluge to let add1 work in DIV instr",            isr_none|MLD |MA_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(DIV_3)     // Must follow DIV_4
#define _DIV_6    DIV_6,   "       Write M. Prepare shift",                         isr_none|MLD |MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont         | n(DIV_7)
#define _DIV_7    DIV_7,   "       Shift (Q,M) left. Prepare unsigned sub",         isr_none|MSL |MA_shlqdiv | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIV_8)     // loops because ceM set and rlastshift clear
#define _DIV_8    DIV_8,   "       Conditionally subtract rs2. Update M[0]",        isr_none|CH  |MA_usub    | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont         | n(DIV_7)     // Must be even ucode adr
#define _DIV_9    DIV_9,   "       Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]", isr_none|CH13|MA_usub    | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(DIV_A)     // Must follow DIV_8. 
                                                                                                  
/* rM == abs(rs1)/abs(rs2), must change sign if (RS1[31]^RS2[31]) && RS2 != 0                     
 * Q = abs(rs1) % abs(rs2), must cahnge sign if RS1 != 0                                          
*/                                                                                                
#define _DIV_A    DIV_A,   "       Transfer rM to rDee",                            isr_none|MCLR|MA_passd   | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont | psa00 | n(DIV_C)     // Must be even ucode adr  PROBLEM M_CLR
#define _DIV_B    DIV_B,   "       REM = Q to yy",                                  isr_none     |MA_passq   | Wyy   | RS1       | Qz   | sr_h  | u_cont         | n(DIV_10)    // Must follow DIV_A

#define _DIV_C    DIV_C,   "       rM to yy. Q=ffffffff",                           isr_none     |MA_passd   | Wyy   | RS2       | Qhld | sr_h  | u_cont         | n(DIV_e)     //
#define _DIV_e    DIV_e,   "       Calc carry of RS2+0xFFFFFFFF",                   isr_none     |MA_iszero  | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIV_D)     //
#define _DIV_D    DIV_D,   "       Is RS2 == 0?",                                   isr_none     |MA_passd   | Wnn   | RS2       | Qu   | sr_h  | usebcond       | n(DIV_E)     // Even ucode adr due to DIV_C
#define _DIV_E    DIV_E,   "       RS2 != 0. Check signs",                          isr_none     |MA_xx      | Wnn   | RS1       | Qx   | sr_h  | u_cont | bsign | n(DIV_10)    // Even ucode adr
#define _DIV_F    DIV_F,   "       RS2 == 0, return 0xffffffff",                    isr_none     |MA_passq   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIV_E

#define _DIV_10   DIV_10,  "       RS2 > 0. Branch on sign of RS1",                 isr_none     |MA_passd   | Wnn   | Ryy       | Qz   | sr_h  | u_cont | bsign | n(DIV_12)    // Even ucode adr
#define _DIV_11   DIV_11,  "       RS2 < 0. Branch on sign of RS1",                 isr_none     |MA_passd   | Wnn   | Ryy       | Qz   | sr_h  | u_cont | bsign | n(DIV_14)    // Must follow DIV_10

#define _DIV_12   DIV_12,  "       RS2 > 0, RS1 >= 0, yy is true result",           isr_none     |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Even ucode adr
#define _DIV_13   DIV_13,  "       RS2 > 0, RS1 < 0, change sign yy",               isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(LB_6)      // DIVU_6 is the same as LB_6 // Must follow DIV_12

#define _DIV_14   DIV_14,  "       RS2 < 0, RS1 >= 0, change sign yy",              isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(LB_6)      // DIVU_6 is the same as LB_6 // Even ucode adr
#define _DIV_15   DIV_15,  "       RS2 < 0, RS1 < 0, yy is true result",            isr_none     |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIV_14   


#else

#define _MULHU_0  _ILL_0(MULHU_0  )
#define _MULHU_1  _ILL_0(MULHU_1  )
#define _MULHU_2  _ILL_0(MULHU_2  )
#define _MULHU_3  _ILL_0(MULHU_3  )
#define _MULHU_4  _ILL_0(MULHU_4  )
#define _MULHU_5  _ILL_0(MULHU_5  )
#define _MULHU_6  _ILL_0(MULHU_6  )
#define _MULHU_7  _ILL_0(MULHU_7  )
#define _MULHSU_0 _ILL_0(MULHSU_0 )
#define _MULH_0   _ILL_0(MULH_0   )
#define _MULH_1   _ILL_0(MULH_1   )
#define _MULH_2   _ILL_0(MULH_2   )
#define _MULH_3   _ILL_0(MULH_3   )
#define _MUL_0    _ILL_0(MUL_0    )
#define _MUL_1    _ILL_0(MUL_1    )
#define _MUL_2    _ILL_0(MUL_2    )
#define _MUL_3    _ILL_0(MUL_3    )
#define _DIVU_0   _ILL_0(DIVU_0   )
#define _DIVU_1   _ILL_0(DIVU_1   )
#define _DIVU_2   _ILL_0(DIVU_2   )
#define _DIVU_3   _ILL_0(DIVU_3   )
#define _DIVU_4   _ILL_0(DIVU_4   )
#define _DIVU_5   _ILL_0(DIVU_5   )
#define _REMU_0   _ILL_0(REMU_0   )
#define _REM_0    _ILL_0(REM_0    )
#define _DIV_0    _ILL_0(DIV_0    )
#define _DIV_1    _ILL_0(DIV_1    )
#define _DIV_2    _ILL_0(DIV_2    )
#define _DIV_3    _ILL_0(DIV_3    )
#define _DIV_4    _ILL_0(DIV_4    )
#define _DIV_5    _ILL_0(DIV_5    )
#define _DIV_6    _ILL_0(DIV_6    )
#define _DIV_7    _ILL_0(DIV_7    )
#define _DIV_8    _ILL_0(DIV_8    )
#define _DIV_9    _ILL_0(DIV_9    )
#define _DIV_A    _ILL_0(DIV_A    )
#define _DIV_B    _ILL_0(DIV_B    )
#define _DIV_C    _ILL_0(DIV_C    )
#define _DIV_e    _ILL_0(DIV_e    )
#define _DIV_D    _ILL_0(DIV_D    )
#define _DIV_E    _ILL_0(DIV_E    )
#define _DIV_F    _ILL_0(DIV_F    )
#define _DIV_10   _ILL_0(DIV_10   )
#define _DIV_11   _ILL_0(DIV_11   )
#define _DIV_12   _ILL_0(DIV_12   )
#define _DIV_13   _ILL_0(DIV_13   )
#define _DIV_14   _ILL_0(DIV_14   )
#define _DIV_15   _ILL_0(DIV_15   )

#endif



//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
#define _SB_0(x)  x,       "SB     Store byte. wjj=wradr=RS1+Simm",                 isr_none     | A_addDQ   | Wjj   | RS2       | Qu   | sr43a | u_cont         | n(SB_1)      
#define _SB_1     SB_1,    "       Write d to Q and yy (for sh 0). Prep shift",     isr_none     | A_passd   | Wyy   | rFFFFFFFF | Qu   | srDec | u_cont         | n(SB_2)      
#define _SB_2     SB_2,    "       Repeat shl until shreg = 0 (0,8,16 or 24 times)",isr_none     | A_shlq    | Wyy   | rFFFFFFFF | Qu   | srDec | u_shrep        | n(SB_3)      
#define _SB_3     SB_3,    "       Prepare get back address to use ",               isr_none     | A_passq   | Wnn   | Rjj       | Qz   | sr_h  | u_cont         | n(SB_4)      
#define _SB_4     SB_4,    "       Address back to Q. Prepare get item to write",   nxtSTB |nxtWE| A_passd   | Wbp   | Ryy       | Qu   | sr_h  | u_cont         | n(SB_5)      
#define _SB_5     SB_5,    "       Write d to a+k until accepted",                  isr_none     | A_passd   | WAQb  | Ryy       | Qhld | sr_h  | u_io_o         | n(SW_2)     
//efine _SW_2     SW_2,    "       Prepare read PC",                                
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                               
// The following will be changed. Will write 0 into mtval because I will have problems
// with correctly writing mtval with the illegal instruction when said instruction is
// 16 bits (standard 'C' extension supported).
#define _ILL_0(i) i,       "Illegal instruction seen",                              isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )     
#define _ILLe     ILLe,    "Illegal",                                               isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(ILL_1)     
#define _ILL_1    ILL_1,   "       Store PC to mepc and Q for read of instr",       nxtSTB       | A_passd   | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     
#define _ILL_2    ILL_2,   "       Read until Q is offending instruction",          isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(ILL_3)     
#define _ILL_3    ILL_3,   "       Store illegal instruction to mtval",             isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(ILL_4)     
#define _ILL_4    ILL_4,   "       Q = 1",                                          isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ILL_5)     
#define _ILL_5    ILL_5,   "       Store 2 to mcause",                              isr_intoTrap | A_add1    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
#define _FENCE(x) x,       "f      Prepare read PC (FENCE)",                        isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//
//!! Should have a tighter decode. ECALL =0x00000073, so rs1=0, rd=0. Imm==0x000 checked
//!! Should have a tighter decode. EBREAK=0x00100073, so rs1=0, rd=0. Imm==0x001 checked
//!! Should have a tighter decode. WFI   =0x10500073, so rs1=0, rd=0. Imm==0x105 checked
#define _ECAL_BRK ECAL_BRK,"ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI",   isr_none     | A_passq   | Wnn   | rFFFFFFFF | Qhld | sr_h  | hwordaligned   | n(ECAL_RET)
#define _ECAL_RET ECAL_RET,"ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET",           isr_none     | A_passq   | Wnn   | rFFFFFFFF | Qhld | sr_h  | wordaligned    | n(ECALL_1) /* Must be at even ucode adr */
#define _ECALL_1  ECALL_1, "ECALL  Verify Imm==0x000",                              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(ECALL_2) /* Must be at even ucode adr */
#define _ECALL_2  ECALL_2, "       mepc = pc, prep store 0 to mtval",               isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | usebcond       | n(ECALL_3) 
#define _ECALL_3  ECALL_3, "       mtval = 0, now start the chore of 11 to mcause", isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(ECALL_4) /* Must be at odd ucode adr following a _ILL_0() */
#define _ECALL_4  ECALL_4, "       Q = 4",                                          isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_5)   
#define _ECALL_5  ECALL_5, "       Q = 8",                                          isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_6)   
#define _ECALL_6  ECALL_6, "       mcause = 11",                                    isr_intoTrap | A_add3w   | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
                                                                                                                                                               
#define _eILL0c   eILL0c,  "Illegal instruction seen",                              isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceeded _ECALL_3 */

#define _EBRKWFI1 EBRKWFI1,"EBREAK/WFI1 Prepare select EBREAK or WFI",              isr_none     | A_addDQ   | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(EBRKWFI2) /* Must follow _ECAL_RET */
#define _EBRKWFI2 EBRKWFI2,"EBREAK/WFI2 Select EBREAK or WFI",                      isr_none     | A_invq    | Wjj   | r000000FF | Qz   | sr_h  | usebcond       | n(EBREAK_1)
#define _EBREAK_1 EBREAK_1,"EBREAK mepc = pc, store 0 to mtval",                    isr_none     | A_passq   | Wmtval| Rpc       | Qz   | sr_h  | u_cont         | n(EBREAK_2) /* Must be at odd ucode adr */
#define _EBREAK_2 EBREAK_2,"       pc to mepc",                                     isr_none     | A_passd   | Wmepc | r00000000 | Qz   | sr_h  | u_cont         | n(ECALL_6)  
//efine _ECALL_6  ECALL_6, "       mcause = 11",                                    isr_intoTrap | A_add3    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 

#define _WFI_1    WFI_1,   "WFI    To check offset",                                isr_none     | A_add4w   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(WFI_2   ) /* This preceeds EBREAK_1  */
#define _WFI_2    WFI_2,   "       Check offset",                                   isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(WFI_3   )
#define _WFI_3    WFI_3,   "       More check offset",                              isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(WFI_4   )
#define _WFI_4    WFI_4,   "       Prepare read PC",                                isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | usebcond       | n(WFI_5   )
#define _WFI_5    WFI_5,   "       IncPC, OpFetch",                                 nxtSTB       | A_add4w   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   ) /* Must follow eILL0a.  */

#define _eILL0a   eILL0a,  "Illegal instruction seen",                              isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceede  _WFI_5 */

//!! Should have a tighter decode. MRET=0x30200073, so rs1=0 rd=0. Imm=0x302. 
#define _MRET_1   MRET_1,  "MRET   First save Imm, start build constant for check", isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(MRET_2)   /* Must follow _ECALL_1 */
#define _MRET_2   MRET_2,  "       0xff+3 = 0x102",                                 isr_none     | A_add3w   | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(MRET_3)
#define _MRET_3   MRET_3,  "       0x102 + 0xff + 1 = 0x202",                       isr_none     | A_add1    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(MRET_4)
#define _MRET_4   MRET_4,  "       0x202 + 0xff + 1 = 0x302",                       isr_none     | A_add1    | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(MRET_5)
#define _MRET_5   MRET_5,  "       ~302",                                           isr_none     | A_invq    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(MRET_6)
#define _MRET_6   MRET_6,  "       ~302 + origImm + 1 for branch decision",         isr_none     | A_add1    | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(MRET_7)
#define _MRET_7   MRET_7,  "       Prepare emulation entry point 0x104",            isr_none     | A_xx      | Wnn   | r000000FF | Qz   | sr_h  | usebcond       | n(MRET_8)  
#define _MRET_8   MRET_8,  "       Prep +4",                                        isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc) /* Must be at odd ucode adr following a _ILL_0()*/
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc

#define _eILL0b   eILL0b,  "Illegal instruction seen",                              isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceeded _MRET_8 */

//efine _xRET_1   xRET_1,  "(U/S/M)RET Prepare emulation entry point 0x104",        isr_none     | A_xx      | Wnn   | r000000FF | Qz   | sr_h  | u_cont         | n(xRET_2)  /* Must follow _ECALL_1 */
//efine _xRET_2   xRET_2,  "       Prep +4",                                        isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//
#if OLD        
//#define _CSRRW_0  CSRRW_0, "CSRRW  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
//#define _CSRRW_1  CSRRW_1, "       CSRRW sentinel 0x00000100",                      isr_none     | A_add1    | Wyy   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)   
//#define _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//#define _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
//#define _CSRRS_0  CSRRS_0, "CSRRS  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRS_1)   
//#define _CSRRS_1  CSRRS_1, "       CSRRS sentinel 0x00000102 or 0xffffff82",        isr_none     | A_add3    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)
////efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
////efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
////efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
//#define _CSRRC_0  CSRRC_0, "CSRRC  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRC_1)   
//#define _CSRRC_1  CSRRC_1, "       CSRRC sentinel 0x0000103",                       isr_none     | A_add4    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)   
////efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
////efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
////efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
//#define _CSRRWI_0 CSRRWI_0,"CSRRWI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRWI_1)  
//#define _CSRRWI_1 CSRRWI_1,"       CSRRWI sentinel 0xffffff80",                     isr_none     | A_add1    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)  
//#define _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
////efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
////efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
//#define _CSRRSI_0 CSRRSI_0,"CSRRSI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRS_1)  
////efine _CSRRS_1  CSRRS_1, "       CSRRS sentinel 0x00000102 or 0xffffff82",        isr_none     | A_add3    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)
////efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
////efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
////efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
//#define _CSRRCI_0 CSRRCI_0,"CSRRCI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRCI_1)  
//#define _CSRRCI_1 CSRRCI_1,"       CSRRCI sentinel 0xffffff83",                     isr_none     | A_add4    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)  // IMPROVE
////efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
////efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
////efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
////      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
////                                                                                                                                                               
#else
#define _CSRRW_0  CSRRW_0, "CSRRW  Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRW_1  CSRRW_1, "       Construct PC storage adr",                       isr_none     | A_add1    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(CSRRW_2)   
#define _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
#define _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(CSRRW_4)
#define _CSRRW_4  CSRRW_4, "       IncPC, OpFetch, but force +4",                   nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     
//                                                                                                                                                               
#define _CSRRS_0  CSRRS_0, "CSRRS  Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRC_0  CSRRC_0, "CSRRC  Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRWI_0 CSRRWI_0,"CSRRWI Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRSI_0 CSRRSI_0,"CSRRSI Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRCI_0 CSRRCI_0,"CSRRCI Decoded CSR adr in yy",                          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRS_1  CSRRS_1, "       Not in use",                                     unx
#define _CSRRC_1  _CSRRW_4 // Reused CSRRC_1 ,"       Not in use",                                     unx
#define _CSRRWI_1 CSRRWI_1,"       Not in use",                                     unx
#define _CSRRWI_2 CSRRWI_2,"       Not in use",                                     unx
#define _CSRRCI_1 CSRRCI_1,"       Not in use",                                     unx        
#endif        

#if ucodeopt_RVC == 0        
#define _IJ_0     IJ_0,    "IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0",            isr_use_ij   | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | hwordaligned   | n(IJ_1)
#define _IJ_1     IJ_1,    "       Read until q=mem[(rs1+ofs)&~3u]",                isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJ_2)     /* Must be placed at even ucode adr */
#define _IJ_2     IJ_2,    "       Read word is to be masked with 2 lsb = 00",      isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJ_3)
#define _IJ_3     IJ_3,    "       Construct Q = 3",                                isr_none     | A_add3w   | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJ_4)
#define _IJ_4     IJ_4,    "       Mask and use as PC",                             nxtSTB       | A_nearAND | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)    /* Goes to either Fetch or eFetch */
                                                                                                                                                                 
#define _IJT_1    IJT_1,   "       Exit CSR, enter trap",                           isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJT_2)    /* Ajacent to IJ_1 */
#define _IJT_2    IJT_2,   "       Read word is to be masked with ~3u",             isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJT_3)
#define _IJT_3    IJT_3,   "       Construct Q = 3",                                isr_none     | A_add3w   | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJT_4)
#define _IJT_4    IJT_4,   "       Mask and store to mepc and Q for read of instr", nxtSTB       | A_nearAND | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     
//efine _ILL_2    ILL_2,   "       Read until Q is offending instruction",          
//efine _ILL_3    ILL_3,   "       Store illegal instruction to mtval",             
//efine _ILL_4    ILL_4,   "       Q = 1",                                          
//efine _ILL_5    ILL_5,   "       Store 2 to mcause",                              
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
#else
#define _IJ_0     IJ_0,    "IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0",            isr_use_ij   | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | hwordaligned   | n(IJ_1)
#define _IJ_1     IJ_1,    "       Read until q=mem[(rs1+ofs)&~1u]",                isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJ_2)     /* Must be placed at even ucode adr */
#define _IJ_2     IJ_2,    "       Read word is to be masked with lsb = 0",         isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJ_3)
#define _IJ_3     IJ_3,    "       Construct Q = 1",                                isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJ_4)
#define _IJ_4     IJ_4,    "       Mask and use as PC",                             nxtSTB       | A_nearAND | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)    /* Goes to either Fetch or eFetch */
                                                                                                                                                                 
#define _IJT_1    IJT_1,   "       Exit CSR, enter trap",                           isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJT_2)    /* Ajacent to IJ_1 */
#define _IJT_2    IJT_2,   "       Read word is to be masked with ~1u",             isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJT_3)
#define _IJT_3    IJT_3,   "       Construct Q = 1",                                isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJT_4)
#define _IJT_4    IJT_4,   "       Mask and store to mepc and Q for read of instr", nxtSTB       | A_nearAND | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     
//efine _ILL_2    ILL_2,   "       Read until Q is offending instruction",          
//efine _ILL_3    ILL_3,   "       Store illegal instruction to mtval",             
//efine _ILL_4    ILL_4,   "       Q = 1",                                          
//efine _ILL_5    ILL_5,   "       Store 2 to mcause",                              
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
#endif

#define _QINT_0   QINT_0,  "INT    Get current PC",                                 isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(QINT_1)
#define _QINT_1   QINT_1,  "       Store pc to mepc.",                              isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(QINT_2)
#define _QINT_2   QINT_2,  "       mtval = 0.",                                     isr_intoTrap | A_passq   | Wmtval| NMIorInInt| Qz   | sr_h  | u_cont         | n(StdIncPc)
//efine _StdIncPc StdIncPc,"       PC = NMIorInInt+4",                              

#define _NMI_0    NMI_0,   "NMI    Get current PC",                                 isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(NMI_1)
#define _NMI_1    NMI_1,   "       Store pc to mepc.",                              isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(NMI_2)
#define _NMI_2    NMI_2,   "       mtval = 0.",                                     isr_intoTrap | A_passq   | Wmtval| NMIorInInt| Qz   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = NMIorInInt. OpFetch",                 

/*
 * Even in small implementations I must:
 *   o  control interrupt enable. 
 *   o  implement MRET.
 *   o  I also need to get back to normal code from my CSR stubs.
 *
 * Interrupt enable in midgetv
 * ---------------------------
 *   o  An interrupt occurs (asynchronous trap) and MIE == 1:
 *      MPIE <= MIE, MIE <= 0
 *      Handled by microcode instruction (field isr_intoTrap).
 *   o  A synchronous trap occurs:
 *      MPIE <= MIE, MIE <= 0
 *      Handled by microcode instruction (field isr_intoTrap).
 *   o  When MRET is executed:
 *      Want MIE <= MPIE, MPIE <= 1
 *      This is specified by bit 1 of the source adr in instruction "ij".
 *   o  During execution of a CSR instruction, interrupts are disabled:
 *      inCSR <= 1
 *      Handled by microcode instruction (field isr_intoCSR).
 *   o  Exit from CSR instruction must clear inCSR
 *      This is handled by microcode (instruction "ij")
 *   o  A special case, from CSR emulation to a synchronous trap:
 *      This is needed because unimplemented CSR addresses should
 *      lead to a trap on the CSR instruction. What we need to do is
 *      to get inCSR = 0, and MPIE = MIE, MIE = 0 without any possible
 *      interrupt source to intervene. We do this by the "ij" instruction
 *      where bit 0 of the source adr is used to get this behaviour.
 * 
 * inCSR  MIE  MPIE   Instruction     What the code should do
 * 0      -    -      ij 0,0x100+0,0  Exit from CSR instr. emu.    (a)
 * 0      0    MIE    ij 0,0x100+1,0  From CSR instr. emu. to trap (b)
 * 0      -    -      ij 0,0x0a4+0,0  From internal INT to trap    (c)
 * 0      MPIE 1      ij 0,0x0b4+2,0  Used in exit from trap       (d)
 *
 * In case (a), we jump to the address stored in location 0x100. The ucode
 * has stored the address of the CSR instruction there. The CSR emulation
 * code will have incremented the contents in location 0x100 by 4 to return
 * to the instruction following the CSR instruction.
 *
 * In case (b), microcode do "mepc = mem[0x100]" so that the normal trap
 * seems to have had an exception at the CSR instruction.
 *
 * In case (c), the instruction is only used to get from internalINT to
 * the trap address without touching registers.
 *
 * In case (d), the situation is as follows. Instructions URET, SRET and 
 * MRET are emulated starting at address 0x104. I treat URET and SRET as
 * an MRET in this implementation. The code at address 0x104 is simply
 * "ij 0,0x0b4+2,0", so execution continues at mepc.
 *
 * This implementation follows the riscv privileged spec with regards
 * to treatment of MPIE and MIE. We introduce an additional interrupt
 * disable by the inCSR FF. The reason for this is that a user program
 * that uses a CSR could otherwise be interrupted while emulating the 
 * CSR, and the interrupt handle will certainly use CSR instructions. 
 *
 * I add a custom-0 instruction "ij" of the following format:
 *
 *  | 332222222222 | 11111 | 111 | 11    | 
 *  | 109876543210 | 98765 | 432 | 10987 | 6543210
 *  | ofs          | rs1   | 000 | rd    | 0001011
 *
 * "ij" is used to implement MRET, and to exit CSR emulation.
 * When exiting CSR emulation, ((rs1+ofs) & 2) == 0
 * When emulating MRET,        ((rs1+ofs) & 2) == 2.
 * 
 * The "ij" instruction implements an indirect memory jump
 * instruction, perhaps usable by programs. If "ij" is not
 * hword aligned, it will lead to an illegal instruction
 * exception, but use the contents of the memory source as
 * the exception address. This is to cover the case where 
 * an illegal CSR address is encountered.
 *
 * "ij  rd,ofs(rs1)"   t = pc; 
 *                     d = rs1+ofs;
 *                     inCSR = 0;
 *                     tMIE = (d & 1) ? 0 : ((d & 2) ? MPIE : MIE);
 *                     MPIE = (d & 1) ? MIE : ((d & 2) ? 1 : MPIE);
 *                     MIE = tMIE;
 *                     pc = mem[(rs1+d)&~3u]; 
 *                     rd = t
 *
 * I have some difficulties with the macro syntax of gnu as, so I do:
 * "ij  rd,ofs(rs1)" written as "ij  rdnr,ofs,rs1nr". Examples:
 * MRET translates to    ij 0, 0x0b6,0
 * CSRRET translates to  ij 0, 0x100,0
 *
 * When microcode that enters an exception is executed, it automatically do 
 * MPIE <= MIE, MIE <= 0.
 * 
 * Microcode that decode CSR automatically do inCSR = 1.
 *
 * Whenever "ij" is executed, inCSR is always cleared. 
 */

/* -----------------------------------------------------------------------------
 * When a qualified interrupt occurs, the riscv specification
 * mandates that mepc = pc, mcause = interrupt number, mtval = 0,
 * MPIE = MIE, MIE = 0, and pc = mtvec.
 * 
 * To allow flexibility in implementation of interrupts on midgetv, we
 * instead do: mepc = pc, mcause = 0, mtval = 7, MPIE = MIE, MIE = 0
 * and pc = internalISR. The internalISR routine should massage
 * mcause to the correct value and jump to where mtvec points using
 * the "ij" instruction.
 */

/* =============================================================================
 * Here is the real data. A number of entries must be at fixed
 * locations due to decoding of the instruction. A number of entries
 * must be consecutive, because we can have a microcode branch. Some
 * entries may be reached by riscv instructions that are not
 * supported.  Remaining locations in the table are used for
 * instructions. Example: "addi" is decoded in such a way that
 * location 4 contains the first microcode instruction. From the
 * definition of _ADDI_0 we can see that the next microcode
 * instruction is StdIncPc, that we find in location 0xe6 below. We
 * can then follow the chain to Fetch and further on.
 *
 * The use of this table, apart from those microcodeinstructions that
 * must be in fixed positions, is entirely up to me. I simply fill it
 * out here. 
 *
 * reachability is used in simulation only. An entry where reachability == 1
 * during instruction decode must come from an instruction as shown in 
 * INSTR, with bits as specified by MASK. If reachability == 0, the line
 * should not be hit by __any__ decode. If reachability == 2, the line can
 * be hit by an instruction, that instruction should not be supported in 
 * RV32I, nor be any other instruction midgetv support.
 *
 *
 * Fixed and spes:
 * 0 : Freely available for any ucode line
 * 1 : Fixed. ucode line must be here
 */

/* When LAZY_DECODE == 0, we still hits those ucode indexes where reachability == 2.
 * When LAZY_DECODE == 1, we also hit indexes at lines commented below.
 * Lines that catch illegal instructions use the MASK as a count of the number of
 * times it should be hit.
 *
 */

//         Fixed  Paired
//         spes   spec                     reachability
//ORIGTAB  |      |                        |    MASK        INSTR     HITNR       // ENTRYPOINT               This comment is important, used by midgetv_ucode_linepermutate to find this data.
/* 00 */Y( 1,     0 , _LB_0              , 1, 0x0000707f, 0x00000003, (1<<22)    ) // LB                      
/* 01 */Y( 0,     0 , _LB_1              , 0, 0xffffffff, 0x00000000, 0          )                            
/* 02 */Y( 1,     0 , _IJ_0              , 1, 0x0000707f, 0x0000000b, (1<<22)    ) // custom-0 instruction    
/* 03 */Y( 1,     0 , _FENCE(FENCE)      , 1, 0x0000707f, 0x0000000f, (1<<22)    ) // FENCE                   Too lacy
/* 04 */Y( 1,     0 , _ADDI_0            , 1, 0x0000707f, 0x00000013, (1<<22)    ) // ADDI                    
/* 05 */Y( 1,     0 , _AUIPC_0(_L05)     , 1, 0x0000007f, 0x00000017, (1<<25)/2  ) // AUIPC 1/2               
/* 06 */Y( 0,     0 , _LB_3              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 07 */Y( 0,     0 , _LB_4              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 08 */Y( 1,     0 , _SB_0(_L08)        , 1, 0x0000707f, 0x00000023, (1<<22)/2  ) // SB 1/2                  
/* 09 */Y( 0,     0 , _LB_5              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 0a */Y( 1,     0 , _SB_0(_L0a)        , 1, 0x0000707f, 0x00000023, (1<<22)/2  ) // SB 2/2                  
/* 0b */Y( 0,     0 , _JALR_2            , 0, 0xffffffff, 0x00000000, 0          )                            
/* 0c */Y( 1,     0 , _ADD_0             , 1, 0xfe00707f, 0x00000033, (1<<15)    ) // ADD                     
/* 0d */Y( 1,     0 , _MUL_0             , 1, 0xfe00707f, 0x02000033, (1<<15)    ) // entrypoint for mul

/* 0e */Y( 1,     0 , _SUB_0             , 1, 0xfe00707f, 0x40000033, (1<<15)    ) // SUB
/* 0e *///Y( 1,     0,  _squeeze           , 1, 0xfe00707f, 0x40000033, (1<<15)    ) //

/* 0f */Y( 1,     0 , _LUI_0(_L0f)       , 1, 0x0000007f, 0x00000037, (1<<25)/2  ) // LUI 1/2                 
/* 10 */Y( 0,     0 , _SUB_1             , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 11 */Y( 0,     0 , _AND_1             , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 12 */Y( 0,     0 , _eFetch3           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 13 */Y( 0,     0 , _condb_2           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 14 */Y( 0,     0 , _condb_3           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 15 */Y( 0,     0 , _condb_4           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 16 */Y( 0,  0x01 , _condb_5           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 17 */Y( 0,  0x01 , _condb_5t          , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 18 */Y( 1,     0 , _BEQ               , 1, 0x0000707f, 0x00000063, (1<<22)    ) // BEQ                     
/* 19 */Y( 1,     0 , _JALR_0            , 1, 0x0000707f, 0x00000067, (1<<22)    ) // JALR                    
/* 1a */Y( 0,     0 , _ANDI_1            , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 1b */Y( 1,     0 , _JAL_0(_L1b)       , 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 1/4                 
/* 1c */Y( 1,     0 , _ECAL_BRK          , 1, 0x0000707f, 0x00000073, (1<<12)    ) // ECALL/EBREAK/WFI/MRET   
/* 1d */Y( 0,     0 , _ORI_2             , 0, 0xffffffff, 0x00000000, 0          )                            
/* 1e */Y( 0,     0 , _aFault_1          , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 1f */Y( 0,     0 , _IJ_2              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 20 */Y( 1,     0 , _LH_0              , 1, 0x0000707f, 0x00001003, (1<<22)    ) // LH                      
/* 21 */Y( 0,     0 , _XORI_1            , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 22 */Y( 0,     0 , _MULHU_6           , 2, 0x00400000, 0x00000000, 0          ) // illegal at entry. Can get here from OpCode close to "ij"
/* 23 */Y( 1,     0 , _FENCE(FENCEI)     , 1, 0x0000707f, 0x0000100f, (1<<22)    ) // FENCEI                  To lacy
/* 24 */Y( 1,     0 , _SLLI_0            , 1, 0xfe00707f, 0x00001013, (1<<15)    ) // SLLI                    
/* 25 */Y( 1,     0 , _AUIPC_0(_L25)     , 1, 0x0000007f, 0x00000017, (1<<25)/2  ) // AUIPC 2/2               
/* 26 */Y( 0,     0 , _OR_1              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 27 */Y( 0,     0 , _OR_2              , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 28 */Y( 1,     0 , _SH_0(_L28)        , 1, 0x0000707f, 0x00001023, (1<<22)/2  ) // SH 1/2                  
/* 29 */Y( 0,     0 , _XOR_1             , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 2a */Y( 1,     0 , _SH_0(_L2a)        , 1, 0x0000707f, 0x00001023, (1<<22)/2  ) // SH 2/2                  
/* 2b */Y( 0,     0 , _SLTIX_1           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 2c */Y( 1,     0 , _SLL_0             , 1, 0xfe00707f, 0x00001033, (1<<15)    ) // SLL                     
/* 2d */Y( 1,     0 , _MULH_0            , 1, 0xfe00707f, 0x02001033, (1<<15)    ) // entrypoint for mulh                
/* 2e */Y( 0,     0 , _EBRKWFI2          , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1 
/* 2f */Y( 1,     0 , _LUI_0(_L2f)       , 1, 0x0000007f, 0x00000037, (1<<25)/2  ) // LUI 2/2                 
/* 30 */Y( 0,     0 , _SLTIX_2           , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 31 */Y( 0,     0 , _SLTX_1            , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 32 */Y( 0,  0x02 , _JAL_1             , 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 33 */Y( 0,  0x02 , _JAERR_1           , 0, 0xffffffff, 0x00000000, 0          )
/* 34 */Y( 0,     0 , _JAL_3             , 0, 0xffffffff, 0x00000000, 0          )
/* 35 */Y( 0,     0 , _SLLI_1            , 0, 0xffffffff, 0x00000000, 0          )
/* 36 */Y( 0,     0 , _SLLI_2            , 0, 0xffffffff, 0x00000000, 0          )
/* 37 */Y( 0,     0 , _ECALL_2           , 0, 0xffffffff, 0x00000000, 0          )
/* 38 */Y( 1,     0 , _BNE               , 1, 0x0000707f, 0x00001063, (1<<22)    ) // BNE
/* 39 */Y( 0,     0 , _MULHU_7           , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 3a */Y( 0,     0 ,  _SRxI_1           , 0, 0xffffffff, 0x00000000, 0          )
/* 3b */Y( 1,     0 , _JAL_0(_L3b)       , 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 2/4
/* 3c */Y( 1,     0 , _CSRRW_0           , 1, 0x0000707f, 0x00001073, (1<<22)    ) // CSRRW
/* 3d */Y( 0,     0 , _SRxI_2            , 0, 0xffffffff, 0x00000000, 0          )
/* 3e */Y( 0,     0 , _SLL_1             , 0, 0xffffffff, 0x00000000, 0          )
/* 3f */Y( 0,     0 , _SRx_1             , 0, 0xffffffff, 0x00000000, 0          )
/* 40 */Y( 1,     0 , _LW_0              , 1, 0x0000707f, 0x00002003, (1<<22)    ) // LW
/* 41 */Y( 0,     0 , _JALR_1            , 0, 0xffffffff, 0x00000000, 0          )
/* 42 */Y( 0,  0x03 , _MULHU_2           , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 43 */Y( 0,  0x03 , _MULHU_4           , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 44 */Y( 1,     0 , _SLTI_0            , 1, 0x0000707f, 0x00002013, (1<<22)    ) // SLTI
/* 45 */Y( 0,     0 , _WFI_3             , 0, 0xffffffff, 0x00000000, 0          ) // 
/* 46 */Y( 0,     0 , _ILL_1             , 0, 0xffffffff, 0x00000000, 0          ) // illegal
/* 47 */Y( 0,     0 , _ILL_2             , 0, 0xffffffff, 0x00000000, 0          ) // illegal
/* 48 */Y( 1,     0 , _SW_0(_L48)        , 1, 0x0000707f, 0x00002023, (1<<22)/2  ) // SW 1/2
/* 49 */Y( 0,     0 , _CSRRW_1           , 0, 0xffffffff, 0x00000000, 0          )
/* 4a */Y( 1,     0 , _SW_0(_L4a)        , 1, 0x0000707f, 0x00002023, (1<<22)/2  ) // SW 2/2
/* 4b */Y( 0,     0 , _CSRRW_2           , 0, 0xffffffff, 0x00000000, 0          )
/* 4c */Y( 1,     0 , _SLT_0             , 1, 0xfe00707f, 0x00002033, (1<<15)    ) // SLT
/* 4d */Y( 1,     0 , _MULHSU_0          , 1, 0xfe00707f, 0x02002033, (1<<15)    ) // entrypoint for mulhsu
/* 4e */Y( 0,  0x04 , _eILL0b            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 4f */Y( 0,  0x04 , _MRET_8            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 50 */Y( 0,  0x05 , _LW_1              , 0, 0xffffffff, 0x00000000, 0          ) 
/* 51 */Y( 0,  0x05 , _LDAF(LDAF_LW)     , 0, 0xffffffff, 0x00000000, 0          )
/* 52 */Y( 0,  0x06 , _LH_1              , 0, 0xffffffff, 0x00000000, 0          )
/* 53 */Y( 0,  0x06 , _LDAF(LDAF_LH)     , 0, 0xffffffff, 0x00000000, 0          )
/* 54 */Y( 0,  0x07 , _LH_2              , 0, 0xffffffff, 0x00000000, 0          )
/* 55 */Y( 0,  0x07 , _aFaultb           , 0, 0xffffffff, 0x00000000, 0          )
/* 56 */Y( 0,     0 , _LH_4              , 0, 0xffffffff, 0x00000000, 0          )
/* 57 */Y( 0,     0 , _LH_5              , 0, 0xffffffff, 0x00000000, 0          )
/* 58 */Y( 0,  0x08 , _DIV_A             , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 59 */Y( 0,  0x08 , _DIV_B             , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 5a */Y( 0,     0 , _SB_1              , 0, 0xffffffff, 0x00000000, 0          )
/* 5b */Y( 1,     0 , _JAL_0(_L5b)       , 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 3/4
/* 5c */Y( 1,     0 , _CSRRS_0           , 1, 0x0000707f, 0x00002073, (1<<22)    ) // CSRRS
/* 5d */Y( 0,     0 , _SB_2              , 0, 0xffffffff, 0x00000000, 0          )
/* 5e */Y( 0,  0x09 , _LHU_1             , 0, 0xffffffff, 0x00000000, 0          )
/* 5f */Y( 0,  0x09 , _LDAF(LDAF_LHU)    , 0, 0xffffffff, 0x00000000, 0          )
/* 60 */Y( 0,  0x0a , _DIV_14            , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 61 */Y( 0,  0x0a , _DIV_15            , 0, 0xffffffff, 0x00000000, 0          )
/* 62 */Y( 0,  0x0b , _DIV_8             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 63 */Y( 0,  0x0b , _DIV_9             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 64 */Y( 1,     0 , _SLTIU_0           , 1, 0x0000707f, 0x00003013, (1<<22)    ) // SLTIU
/* 65 */Y( 0,     0 , _WFI_4             , 0, 0xffffffff, 0x00000000, 0          ) 
/* 66 */Y( 0,  0x0c , _SW_1              , 0, 0xffffffff, 0x00000000, 0          ) 
/* 67 */Y( 0,  0x0c , _SW_E1(SWE)        , 0, 0xffffffff, 0x00000000, 0          )
/* 68 */Y( 0,  0x23 , _DIV_12            , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* 69 */Y( 0,  0x23 , _DIV_13            , 0, 0xffffffff, 0x00000000, 0          ) 
/* 6a */Y( 0,     0 , _SB_3              , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* 6b */Y( 0,     0 , _SB_4              , 0, 0xffffffff, 0x00000000, 0          )
/* 6c */Y( 1,     0 , _SLTU_0            , 1, 0xfe00707f, 0x00003033, (1<<15)    ) // SLTU
/* 6d */Y( 1,     0 , _MULHU_0           , 1, 0xfe00707f, 0x02003033, (1<<15)    ) // entrypoint for mulhu
/* 6e */Y( 0,     0 , _LHU_3             , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 6f */Y( 0,     0 , _MRET_6            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 70 */Y( 0,  0x0d , _LHU_2             , 0, 0xffffffff, 0x00000000, 0          )
/* 71 */Y( 0,  0x0d , _aFaultc           , 0, 0xffffffff, 0x00000000, 0          )
/* 72 */Y( 0,     0 , _LBU_3             , 0, 0xffffffff, 0x00000000, 0          )
/* 73 */Y( 0,     0 , _BAERR_1           , 0, 0xffffffff, 0x00000000, 0          )
/* 74 */Y( 0,  0x0e , _BrOpFet           , 0, 0xffffffff, 0x00000000, 0          )
/* 75 */Y( 0,  0x0e , _BAlignEr          , 0, 0xffffffff, 0x00000000, 0          )
/* 76 */Y( 0,     0 , _BAERR_2           , 0, 0xffffffff, 0x00000000, 0          )
/* 77 */Y( 0,     0 , _BAERR_3           , 0, 0xffffffff, 0x00000000, 0          )
/* 78 */Y( 0,  0x0f , _DIV_4             , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 79 */Y( 0,  0x0f , _DIV_5             , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 7a */Y( 0,     0 , _SB_5              , 0, 0xffffffff, 0x00000000, 0          )
/* 7b */Y( 1,     0 , _JAL_0(_L7b)       , 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 4/4
/* 7c */Y( 1,     0 , _CSRRC_0           , 1, 0x0000707f, 0x00003073, (1<<22)    ) // CSRRC
/* 7d */Y( 0,     0 , _BAERR_4           , 0, 0xffffffff, 0x00000000, 0          )
/* 7e */Y( 0,     0 , _NMI_1             , 0, 0xffffffff, 0x00000000, 0          )
/* 7f */Y( 0,     0 , _JALRE2            , 0, 0xffffffff, 0x00000000, 0          )
/* 80 */Y( 1,     0 , _LBU_0             , 1, 0x0000707f, 0x00004003, (1<<22)    ) // LBU
/* 81 */Y( 0,     0 , _JAERR_2           , 0, 0xffffffff, 0x00000000, 0          )
/* 82 */Y( 0,  0x10 , _DIV_1             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 83 */Y( 0,  0x10 , _DIV_2             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 84 */Y( 1,     0 , _XORI_0            , 1, 0x0000707f, 0x00004013, (1<<22)    ) // XORI
/* 85 */Y( 0,     0 , _LBU_1             , 0, 0xffffffff, 0x00000000, 0          )
/* 86 */Y( 0,  0x11 , _JAL_2             , 0, 0xffffffff, 0x00000000, 0          )
/* 87 */Y( 0,  0x11 , _JALRE1            , 0, 0xffffffff, 0x00000000, 0          ) // Why not marked as fixed? 20200915
/* 88 */Y( 0,  0x12 , _DIV_E             , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* 89 */Y( 0,  0x12 , _DIV_F             , 0, 0xffffffff, 0x00000000, 0          )
/* 8a */Y( 0,     0 , _ILL_4             , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* 8b */Y( 0,     0 , _ILL_5             , 0, 0xffffffff, 0x00000000, 0          ) 
/* 8c */Y( 1,     0 , _XOR_0             , 1, 0xfe00707f, 0x00004033, (1<<15)    ) // XOR
/* 8d */Y( 1,     0 , _DIV_0             , 1, 0xfe00707f, 0x02004033, (1<<15)    ) // entrypoint for div
/* 8e */Y( 0,     0 , _aF_SW_3           , 0, 0xffffffff, 0x00000000, 0          ) // illegal. Must be even ucode adr due to use of add4
/* 8f */Y( 0,     0 , _ILL_3             , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 90 */Y( 0,     0 , _NMI_2             , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* 91 */Y( 0,     0 , _LDAF_2            , 0, 0xffffffff, 0x00000000, 0          )
/* 92 */Y( 0,     0 , _LDAF_3            , 0, 0xffffffff, 0x00000000, 0          )
/* 93 */Y( 0,     0 , _SW_E2             , 0, 0xffffffff, 0x00000000, 0          )
/* 94 */Y( 0,     0 , _SW_E4             , 0, 0xffffffff, 0x00000000, 0          ) // Must be even ucode adr due to use of add4 in SW_E3
/* 95 */Y( 0,     0 , _SW_E3             , 0, 0xffffffff, 0x00000000, 0          ) // [a] probably pair with above
/* 96 */Y( 0,  0x13 , _SH_1              , 0, 0xffffffff, 0x00000000, 0          )
/* 97 */Y( 0,  0x13 , _SW_E1(SWH)        , 0, 0xffffffff, 0x00000000, 0          )
/* 98 */Y( 1,     0 , _BLT               , 1, 0x0000707f, 0x00004063, (1<<22)    ) // BLT
/* 99 */Y( 0,     0 , _ILL_0(_L99)       , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* 9a */Y( 0,  0x15 , _DIVU_5            , 2, 0x00400000, 0x00000000, 0          ) 
/* 9b */Y( 0,  0x15 , _LB_6              , 2, 0x00400000, 0x00000000, 0          ) 
/* 9c */Y( 0,  0x14 , _DIV_10            , 2, 0x00001000, 0x00000000, 0          ) // illegal
/* 9d */Y( 0,  0x14 , _DIV_11            , 0, 0xffffffff, 0x00000000, 0          )
/* 9e */Y( 0,     0 , _SH_4              , 0, 0xffffffff, 0x00000000, 0          )
/* 9f */Y( 0,     0 , _SH_5              , 0, 0xffffffff, 0x00000000, 0          )
/* a0 */Y( 1,     0 , _LHU_0             , 1, 0x0000707f, 0x00005003, (1<<22)    ) // LHU
/* a1 */Y( 0,     0 , _ECALL_4           , 0, 0xffffffff, 0x00000000, 0          )
/* a2 */Y( 0,     0 , _MULHU_3           , 0, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* a3 */Y( 0,     0 , _MULHU_1           , 0, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* a4 */Y( 1,     0 , _SRxI_0            , 1, 0xbe00707f, 0x00005013, (1<<15)*2  ) // SRLI/SRAI
/* a5 */Y( 0,     0 , _MRET_3            , 0, 0xffffffff, 0x00000000, 0          )
/* a6 */Y( 0,  0x16 , _ECAL_RET          , 0, 0xffffffff, 0x00000000, 0          )
/* a7 */Y( 0,  0x16 , _EBRKWFI1          , 0, 0xffffffff, 0x00000000, 0          )
/* a8 */Y( 0   ,  0 , _DIV_3             , 2, 0x00200000, 0x00000000, 0          ) // (illegal) Must be even ucode adr
/* a9 */Y( 0,     0 , _DIV_6             , 0, 0xffffffff, 0x00000000, 0          )
/* aa */Y( 0,     0 , _ECALL_6           , 2, 0x00200000, 0x00000000, 0          ) // (illegal) Must be even ucode adr for unknown reason
/* ab */Y( 0,     0 , _EBREAK_2          , 0, 0xffffffff, 0x00000000, 0          )
/* ac */Y( 1,     0 , _SRx_0(_Lac)       , 1, 0xfe00707f, 0x00005033, (1<<15)    ) // SRL
/* ad */Y( 1,     0 , _DIVU_0            , 1, 0xfe00707f, 0x02005033, (1<<15)    ) // entrypoint for divu
/* ae */Y( 1,     0 , _SRx_0(_Lae)       , 1, 0xfe00707f, 0x40005033, (1<<15)    ) // SRA
/* af */Y( 0,     0 , _MRET_4            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* b0 */Y( 0,     0 , _CSRRW_3           , 0, 0xffffffff, 0x00000000, 0          )
/* b1 */Y( 0,     0 , _CSRRS_1           , 0, 0xffffffff, 0x00000000, 0          )
/* b2 */Y( 0,     0 , _CSRRC_1           , 0, 0xffffffff, 0x00000000, 0          )
/* b3 */Y( 0,     0 , _CSRRWI_1          , 0, 0xffffffff, 0x00000000, 0          )
/* b4 */Y( 0,     0 , _CSRRWI_2          , 0, 0xffffffff, 0x00000000, 0          )
/* b5 */Y( 0,     0 , _SH_3              , 0, 0xffffffff, 0x00000000, 0          ) // fitte
/* b6 */Y( 0,     0 , _CSRRCI_1          , 0, 0xffffffff, 0x00000000, 0          )
/* b7 */Y( 0,     0 , _IJ_3              , 0, 0xffffffff, 0x00000000, 0          )
/* b8 */Y( 1,     0 , _BGE               , 1, 0x0000707f, 0x00005063, (1<<22)    ) // BGE
/* b9 */Y( 0,     0 , _DIV_e             , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* ba */Y( 0,     0 , _DIV_C             , 0, 0xffffffff, 0x00000000, 0          ) // Must be even ucode adr for unknown reason. Must find owut this. Probably because MCLR was used prev cycle.
/* bb */Y( 0,     0 , _SH_2              , 0, 0xffffffff, 0x00000000, 0          ) 
/* bc */Y( 1,     0 , _CSRRWI_0          , 1, 0x0000707f, 0x00005073, (1<<22)    ) // CSRRWI
/* bd */Y( 0,     0 , _IJ_4              , 0, 0xffffffff, 0x00000000, 0          )
/* be */Y( 0,  0x17 , _IJ_1              , 0, 0xffffffff, 0x00000000, 0          )
/* bf */Y( 0,  0x17 , _IJT_1             , 0, 0xffffffff, 0x00000000, 0          )
/* c0 */Y( 0,     0 , _DIV_D             , 2, 0x00400000, 0x00000000, 0          ) // illegal  Mu
/* c1 */Y( 0,     0 , _IJT_2             , 0, 0xffffffff, 0x00000000, 0          )
/* c2 */Y( 0,  0x18 , _DIVU_3            , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* c3 */Y( 0,  0x18,  _DIVU_4            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* c4 */Y( 1,     0 , _ORI_0             , 1, 0x0000707f, 0x00006013, (1<<22)    ) // ORI
/* c5 */Y( 0,     0 , _MRET_5            , 0, 0xffffffff, 0x00000000, 0          )
/* c6 */Y( 0,     0 , _IJT_4             , 0, 0xffffffff, 0x00000000, 0          )
/* c7 */Y( 0,     0 , _QINT_1            , 0, 0xffffffff, 0x00000000, 0          )
/* c8 */Y( 9,     0 , _DIV_7             , 2, 0x00200000, 0x00000000, 0          ) // illegal. Must be even ucode adr
/* c9 */Y( 0,     0 , _MRET_2            , 0, 0xffffffff, 0x00000000, 0          )
/* ca */Y( 0,     0 , _DIVU_2            , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* cb */Y( 0,     0 , _QINT_2            , 0, 0xffffffff, 0x00000000, 0          )
/* cc */Y( 1,     0 , _OR_0              , 1, 0xfe00707f, 0x00006033, (1<<15)    ) // OR
/* cd */Y( 1,     0 , _REM_0             , 1, 0xfe00707f, 0x02006033, (1<<15)    ) // entrypoint for rem
/* ce */Y( 0,     0 , _ECALL_5           , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* cf */Y( 0,     0 , _MRET_7            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* d0 */Y( 0,  0x19 , _ECALL_1           , 0, 0xffffffff, 0x00000000, 0          )
/* d1 */Y( 0,  0x19 , _MRET_1            , 0, 0xffffffff, 0x00000000, 0          )
/* d2 */Y( 0,  0x1a , _LB_2              , 0, 0xffffffff, 0x00000000, 0          )
/* d3 */Y( 0,  0x1a , _aFaultd           , 0, 0xffffffff, 0x00000000, 0          )
/* d4 */Y( 0,     0 , _aFault_2          , 0, 0xffffffff, 0x00000000, 0          )
/* d5 */Y( 0,     0 , _eFetch2           , 0, 0xffffffff, 0x00000000, 0          )
/* d6 */Y( 0,  0x1b , _eILL0c            , 0, 0xffffffff, 0x00000000, 0          )  
/* d7 */Y( 0,  0x1b , _ECALL_3           , 0, 0xffffffff, 0x00000000, 0          )
/* d8 */Y( 1,     0 , _BLTU              , 1, 0x0000707f, 0x00006063, (1<<22)    ) // BLTU
/* d9 */Y( 0,     0 , _MULH_3            , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* da */Y( 0,     0 , _LDAF_a            , 0, 0xffffffff, 0x00000000, 0          )
/* db */Y( 0,     0 , _jFault_1          , 0, 0xffffffff, 0x00000000, 0          )
/* dc */Y( 1,     0 , _CSRRSI_0          , 1, 0x0000707f, 0x00006073, (1<<22)    ) // CSRRSI
/* dd */Y( 0,     0 , _aF_SW_1           , 0, 0xffffffff, 0x00000000, 0          )
/* de */Y( 0,  0x1c , _Fetch             , 0, 0xffffffff, 0x00000000, 0          ) 
/* df */Y( 0,  0x1c , _eFetch            , 0, 0xffffffff, 0x00000000, 0          ) 
/* e0 */Y( 0,     0 , _DIVU_1            , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* e1 */Y( 0,     0 , _ORI_1             , 0, 0xffffffff, 0x00000000, 0          )
/* e2 */Y( 0,  0x1d , _MUL_1             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* e3 */Y( 0,  0x1d , _MUL_3             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* e4 */Y( 1,     0 , _ANDI_0            , 1, 0x0000707f, 0x00007013, (1<<22)    ) // ANDI
/* e5 */Y( 0,     0 , _aF_SW_2           , 0, 0xffffffff, 0x00000000, 0          )
/* e6 */Y( 0,  0x1e , _StdIncPc          , 0, 0xffffffff, 0x00000000, 0          )
/* e7 */Y( 0,  0x1e , _aFault            , 0, 0xffffffff, 0x00000000, 0          )
/* e8 */Y( 0,     0 , _MUL_2             , 2, 0x00200000, 0x00000000, 0          ) // illegal
/* e9 */Y( 0,     0 , _IJT_3             , 0, 0xffffffff, 0x00000000, 0          )
/* ea */Y( 0,     0 , _MULHU_5           , 2, 0x00200000, 0x00000000, 0          ) //(illegal) 
/* eb */Y( 0,     0 , _LH_3              , 0, 0xffffffff, 0x00000000, 0          )
/* ec */Y( 1,     0 , _AND_0             , 1, 0xfe00707f, 0x00007033, (1<<15)    ) // AND
/* ed */Y( 1,     0 , _REMU_0            , 1, 0xfe00707f, 0x02007033, (1<<15)    ) // entrypoint for "remu"
/* ee */Y( 0,  0x1f , _eILL0a            , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* ef */Y( 0,  0x1f , _WFI_5             , 0, 0xffffffff, 0x00000000, 0          ) //                         Reached with LAZY_DECODE==1
/* f0 */Y( 0,  0x20 , _LBU_2             , 0, 0xffffffff, 0x00000000, 0          ) 
/* f1 */Y( 0,  0x20 , _aFaulte           , 0, 0xffffffff, 0x00000000, 0          )
/* f2 */Y( 0,  0x21 , _SW_2              , 0, 0xffffffff, 0x00000000, 0          )
/* f3 */Y( 0,  0x21 , _aF_SW             , 0, 0xffffffff, 0x00000000, 0          ) 
/* f4 */Y( 0,     0 , _Fetch2            , 0, 0xffffffff, 0x00000000, 0          )
/* f5 */Y( 0,     0 , _jFault            , 0, 0xffffffff, 0x00000000, 0          ) // How do I get to this instruction ? 20200915
/* f6 */Y( 0,  0x22 , _WFI_1             , 0, 0xffffffff, 0x00000000, 0          )
/* f7 */Y( 0,  0x22 , _EBREAK_1          , 0, 0xffffffff, 0x00000000, 0          ) 
/* f8 */Y( 1,     0 , _BGEU              , 1, 0x0000707f, 0x00007063, (1<<22)    ) // BGEU
/* f9 */Y( 0,     0 , _MULH_2            , 2, 0x00400000, 0x00000000, 0          ) // illegal
/* fa */Y( 0,     0 , _WFI_2             , 0, 0xffffffff, 0x00000000, 0          )
/* fb */Y( 0,     0 , _MULH_1            , 0, 0xffffffff, 0x00000000, 0          )
/* fc */Y( 1,     0 , _CSRRCI_0          , 1, 0x0000707f, 0x00007073, (1<<22)    ) // CSRRCI
/* fd */Y( 1,     0 , _NMI_0             , 3, 0xffffffff, 0x00000000, 0          ) // Reserved for NMI
/* fe */Y( 1,     0 , _ILLe              , 2, 0x2af56000, 0x00000000, 0          ) // illegal
/* ff */Y( 1,     0 , _QINT_0            , 3, 0xffffffff, 0x00000000, 0          ) // Reserved for qualified interrupt

/* Before multiplication and division, I have
   11 free locations, and 36 illegal entry points = 47 locations to play with.
   Can get back following from stricter decoding:
   AUIPC, SB, LUI, SH, SW one encoding each:  5 locations
   JAL 3 locations
   I must be able to specify mul/div in 47+8=55 ucode instructions.
   Preferably in 47 ucode instructions

   By changing loading of immediate to clear Q in opfetch for instructions XORI, AND, OR, XOR I save 1 ucode instr
   for each, and also speeds up these instructions with 1 clock cycle.

   Presently I have 47+3 = 50 instructions, and 57 entry points (not counting MULDIV and illegals=36)
   Hence I average 5.12 unique ucode instructions per instruction.
   If this is relevant for MULDIV I will need 8*5.12 = 41 ucode locations.
   
*/
/* We undefine the short defines that has been used in this file
 */
#undef Y
#undef X
#undef XX
#undef I 
#undef II 
#undef III
#undef IIII 
#undef IIIII
#undef IIIIIO 
#undef IIIIO
#undef IIIO 
#undef IIIOI
#undef IIIOII 
#undef IIIOO
#undef IIIOOO 
#undef IIO
#undef IIOI 
#undef IIOII
#undef IIOIO
#undef IIOO 
#undef IIOOI
#undef IIOOO
#undef IO 
#undef IOI
#undef IOII 
#undef IOIII
#undef IOIIO
#undef IOIO 
#undef IOIOI
#undef IOIOO
#undef IOIOOO 
#undef IOO
#undef IOOI 
#undef IOOII
#undef IOOO 
#undef IOOOI
#undef IOOOO
#undef O 
#undef OI 
#undef OII
#undef OIII 
#undef OIIO 
#undef OIIOO
#undef OIIOOO 
#undef OIIxx
#undef OIO
#undef OIOI 
#undef OIOO 
#undef OIOxx 
#undef OO 
#undef OOI
#undef OOII 
#undef OOIO 
#undef OOIOI
#undef OOIOIO 
#undef OOIOO
#undef OOIOOI 
#undef OOIOOO 
#undef OOIxx 
#undef OOO
#undef OOOI 
#undef OOOII
#undef OOOIO
#undef OOOO 
#undef OOOOI
#undef OOOOO
#undef OOOxx
#undef Ox 
#undef Oxxx 
#undef x 
#undef xI 
#undef xO 
#undef xx 
#undef xxI
#undef xxxx 
#undef xxxxx 



// 0000000 00000 00000 000 00000 1110011 ECALL : mepc = pc, mtval = 0 mcause = 11                                                                                                                     
// 0000000 00001 00000 000 00000 1110011 EBREAK: mepc = pc, mtval = 0 mcause = 3    
// 0000000 00010 00000 000 00000 1110011 URET                                       
// 0001000 00010 00000 000 00000 1110011 SRET                                       
// 0011000 00010 00000 000 00000 1110011 MRET                                       
                                                                                    
                                                                                    
// Easy constants                                                                   
//  00000000 (r00000000     ) (passd)                                               
//  00000001 (Q=0, r00000000),(add1 )                                               
//  00000003 (Q=0, r00000000),(add3 )                                               
//  00000004 (Q=0, r00000000),(add4 )                                               
//  000000ff (r0000000f     ),(passd)                                               
//  00000100 (Q=0, r000000ff),(add1 ) CSRRW                                         
//  00000102 (Q=0, r000000ff),(add3 ) CSRRS                                         
//  00000103 (Q=0, r000000ff),(add4 ) CSRRC                                         
//  ffffffff (Q=0, rffffffff),(add1 )                                               
//  00000002 (Q=0, rffffffff),(add3 )                                               
//  ffffff7f (rffffff7f     ),(passd)                                               
//  ffffff80 (Q=0, rFFFFFF7F),(add1 ) CSRRWI                                        
//  ffffff82 (Q=0, rFFFFFF7F),(add3 ) CSRRSI                                        
//  ffffff83 (Q=0, rFFFFFF7F),(add4 ) CSRRCI                                        
//                                                                                  
