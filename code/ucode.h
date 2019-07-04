/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The microcode of midgetv.
 */

/* According to riscv-spec-v2.2.pdf: In RV32 it is mandatory to maintain the 
 * 64-bit performance counters RDCYCLE, RDINSTRET. RDTIME is also mandatory. 
 * In midgetv, this is solved the following way:
 * mcycle is always present. 
 * mcycleh is incremented via an internal interrupt
 * mtime and mtimeh are maintained by an internal interrupt triggered by a 
 *   (selectable) prescale of mcycle. 
 * minstret is supported if the macros below evaluate true.
 * minstreth is incremented via an internal interrupt.
 *
 * When minstret is supported, each and every instructions use one more
 * cycle. I foresee that we can have these choices:
 *   HAS_MINSTRET
 *   |HAS_EBR_MINSTRET
 *   00  Do not count instructions
 *   01  Illegal
 *   10  Only count instructions executing from SRAM
 *   11  Count all instructions.
 *
 * However, the most tested configureation is with MINSTRET included.
 *
 */
#define HAS_MINSTRET     1
#define HAS_EBR_MINSTRET 1
#if HAS_MINSTRET == 0 && HAS_EBR_MINSTRET == 1
#error Can not do this, see above comment
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
 * The following is definition of fields of microcode
 */

/* The ALU and cycle counter control
 */
////                     Cyclecnt etc
////                     ss             sssss
////                     11             00000
////                     10             54321
#define A_nearXOR      ( IO << 10 ) | ( OOOxx << 1 )  // B = D^(~Q)                               
#define A_passd        ( IO << 10 ) | ( OOIxx << 1 )  // D
#define A_nearAND      ( IO << 10 ) | ( OIOxx << 1 )  // D&(~Q)   
#define A_invq         ( IO << 10 ) | ( OIIxx << 1 )  // ~Q
#define A_addDQ        ( IO << 10 ) | ( IOOOO << 1 )  // D+Q
#define A_cycnt        ( II << 10 ) | ( IOOOO << 1 )  // D+cyclecnt
#define A_add1         ( IO << 10 ) | ( IOOII << 1 )  // D+Q+1
#define A_add3         ( OO << 10 ) | ( IOOOO << 1 )  // D+(Q|3)+0
#define A_add4         ( OO << 10 ) | ( IOOII << 1 )  // D+(Q|3)+1
#define A_shlq         ( IO << 10 ) | ( IOIOO << 1 )  // B = (QQ<<1)|cin (with D=0xffffffff)      
#define A_nearOR       ( IO << 10 ) | ( IIOOO << 1 )  // (~D)|Q
#define A_passq        ( IO << 10 ) | ( IIIOO << 1 )  // Let through Q
//#define A_passq1     ( IO << 10 ) | ( IIIII << 1 )  // Let through Q+1                      
#define A_passq4       ( OO << 10 ) | ( IIIII << 1 )  // Let through (Q|3)+1
#define A_passq_F      ( IO << 10 ) | ( IIIOI << 1 )  // Let through Q+flgF
#define A_xx           ( xO << 10 ) | ( xxxxx << 1 )  // ALU is don't care


#define nxtSTB (I << 32) // sa42 : Possibly STB_O or sram_stb to be set high next cycle
#define nxtWE  (I << 33) // sa43 : Possibly WE_O to be set high next cycle.

///* Write address and write enable. 
// */
////                       ssss         
////          sa41         2211         
////          |            1098         
#define Wnn   (I << 31) | (OOOO << 18) // No write. Set SEL_O = 4'b1111
#define Wbp   (I << 31) | (OOIO << 18) // Prepare write byte. Setup SEL_O as per B[1:0].
#define Whp   (I << 31) | (OOOI << 18) // Prepare write halfword. Setup SEL_O as per B[1]
#define WAQb              (OOIO << 18) // Write to MEM, adr in Q
#define WAQh              (OOOI << 18) // Write to MEM, adr in Q
#define WAQW              (OOII << 18) // Write to MEM, adr in Q
#define WTRG              (OIOO << 18) // Write target reg. 
#define Wjj               (IOOO << 18) // Write to jj
#define Wrinst            (IOOI << 18) // Write to rinst
#define Wpc               (IOIO << 18) // Write B to PC
#define Wttime            (IOII << 18) // Write to tinytime
#define Wyy               (IIOO << 18) // Write to scratch register yy
#define Wmepc             (IIOI << 18) // Write to mepc
#define Wmcaus            (IIIO << 18) // Write to mcause
#define Wmtval            (IIII << 18) // Write to mtval

///* Read address
// */
////                                       sa34: Controls read of r00000000 or rFFFFFFFF in last cycle memory/io read
////                                       |        ssss
////                                       |        1111            // 
////                                       |        7654            // 
#define Rjj                       ( ( O << 27 ) | ( OOOO << 14 ) )  // Scratch register JJ
#define Rrinst                    ( ( O << 27 ) | ( OOOI << 14 ) )  // noinstret_base
#define Rpc                       ( ( O << 27 ) | ( OOIO << 14 ) )  // PC
#define rttime                    ( ( O << 27 ) | ( OOII << 14 ) )  // 
#define NMIorInInt                ( ( O << 27 ) | ( OIOO << 14 ) )  // 
#define rFFFFFF7F                 ( ( O << 27 ) | ( OIOI << 14 ) )  // 
#define r000000FF                 ( ( O << 27 ) | ( OIIO << 14 ) )  // 
#define r0000FFFF                 ( ( O << 27 ) | ( OIII << 14 ) )  // 
#define rFFFF7FFF                 ( ( O << 27 ) | ( IOOO << 14 ) )  // 
#define rmtvec                    ( ( O << 27 ) | ( IOOI << 14 ) )  // trap vector  
#define r00000000                 ( ( O << 27 ) | ( IOIO << 14 ) )  // 
#define rFFFFFFFF                 ( ( O << 27 ) | ( IOII << 14 ) )  // 
#define rHorL                     ( ( I << 27 ) | ( IOII << 14 ) )  // 
#define Ryy                       ( ( O << 27 ) | ( IIOO << 14 ) )  // Scratch register YY
#define Ralu                      ( ( O << 27 ) | ( IIOI << 14 ) )  // ALU result is internal read address.
#define RS2                       ( ( O << 27 ) | ( IIIO << 14 ) )  // Read register specified in registered rs2 field of instruction
#define RS1                       ( ( O << 27 ) | ( IIII << 14 ) )  // Read register specified in registered rs1 field of instruction
#define r_xx                      ( ( O << 27 ) | ( xxxx << 14 ) )  // Read address is dont care. 
#define rHorPC    ( ( I << 30 ) |   ( O << 27 ) | ( IOII << 14 ) )  // 
#define rHorTtime ( ( I << 30 ) |   ( I << 27 ) | ( IOII << 14 ) )  // 
//                    |
//                    sa40 extra select signal for Rai

///* The Q register
// */
////                                                                 
////                Shift right  Part of enable to Q (sa32)     
////                |            |             Part of enable to Q (sa15)
/////               |            |             |Reset Q (sa14)
////                |            |             ||
#define Qu        ( O << 0 ) |  (O << 25 ) | ( IO << 8)  // 0010 Q = B
#define Qeu       ( O << 0 ) |  (I << 25 ) | ( OO << 8)  // Nearly Qu, but a variant to distinguish SRAM operand fetch
#define Qs        ( O << 0 ) |  (I << 25 ) | ( IO << 8)  // 0110 If rack==0, Q hold. If rack==1, sample B
#define Qshr      ( I << 0 ) |  (O << 25 ) | ( IO << 8)  // 0010 Q == (msbshr<<31) | (Q>>1)
#define Qz        ( O << 0 ) |  (O << 25 ) | ( II << 8)  // 0011 Q = 0
#define Qcndz     ( O << 0 ) |  (I << 25 ) | ( II << 8)  // 0101 Q = 0 if rack==1
//#define QzCYZ   ( O << 0 ) |  (O << 25 ) | ( II << 8)  // 0011 Q = 0, s11 must be high for zero-find. Todo - check that this is the case, delete
#define Qzh       ( O << 0 ) |  (O << 25 ) | ( II << 8)  // 0xx1 Q = 0 or Q hold (assumes it was zero beforehand). Changed to Q = 0
#define Qudec     ( O << 0 ) |  (O << 25 ) | ( IO << 8)  // 1010 Q = decoded immediate
#define Qhld      ( O << 0 ) |  (O << 25 ) | ( Ox << 8)  // x001 Q unchanged
#define Qx        ( O << 0 ) |  (O << 25 ) | ( Ox << 8)  // xxxx Q don't care
#define psa00     ( I << 0 )
///* The shift counter
//*/
////               ss
////               11
////               32                                        
#define srImm    ( OO << 12 ) // shregcnt = B[4:0]                   B[1:0] BB[1:0]       
#define srDec    ( OI << 12 ) // Decrement shift count               01     11         
#define sr_h     ( II << 12 ) // shregcnt hold
#define sr43a    ( IO << 12 ) // shregcnt = {B[1:0],3'b000}          00     00         



//                                               Read into   ADR1Mustbe0
//                      use_brcond  shrep        Instruction |Adr0Mustbe0
//                      |           |            |           ||use_dinx
#define use_dinx      ( O << 6) | ( O << 26) | ( O << 7) | ( xxI << 22) // dinx determines where to start microcode
#define u_cont        ( O << 6) | ( O << 26) | ( O << 7) | ( OOO << 22) // rinx determines next microcode instruction
#define u_io_i_latch  ( O << 6) | ( O << 26) | ( I << 7) | ( OOO << 22) // 
#define u_io_i        ( O << 6) | ( O << 26) | ( O << 7) | ( OOO << 22) // Repeat until read SRAM/IO succeeds. Then use rinx to find next ucodeinstr.
#define u_io_o        ( O << 6) | ( O << 26) | ( O << 7) | ( OOO << 22) // Repeat write data out until WACK
#define u_shrep       ( O << 6) | ( I << 26) | ( O << 7) | ( OOO << 22) // Repeat shift operation until shiftcounter == 0 
#define usebcond      ( I << 6) | ( O << 26) | ( O << 7) | ( OOO << 22) // rinx determines next microcode instruction, but with lsb determined by condition
#define wordaligned   ( O << 6) | ( O << 26) | ( O << 7) | ( IIO << 22) // 
#define hwordaligned  ( O << 6) | ( O << 26) | ( O << 7) | ( OIO << 22) // 

#define isr_none      ( OO << 28 ) // No trap or CSR entry or exit
#define isr_use_ij    ( OI << 28 ) // inCSR = 0; ij bit 1 determines if we are to do MIE = MPIE; MPIE = 1.
#define isr_intoCSR   ( IO << 28 ) // inCSR = 1;
#define isr_intoTrap  ( II << 28 ) // MPIE = MIE; MIE = 0;

/* Next ucode instruction to execute
 */
#define n(x) (((uint64_t)x)<< 34 )


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

#if HAS_MINSTRET == 0 && HAS_EBR_MINSTRET == 0
#define _StdIncPc StdIncPc," Fr00  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr00  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr00  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      
#define _eFetch   eFetch,  " Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2 )   // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr00  Not in use",                                     unx
#define _eFetch3  eFetch3, " Fr00  Not in use",                                     unx

#elif HAS_MINSTRET == 1 && HAS_EBR_MINSTRET == 0
#define _StdIncPc StdIncPc," Fr10  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr10  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr10  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      
#define _eFetch   eFetch,  " Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr10  Update ttime",                                   isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )
#define _eFetch3  eFetch3, " Fr10  Update minstret, Q=immediate. Use dinx",         isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx

#elif HAS_MINSTRET == 1 && HAS_EBR_MINSTRET == 1
#define _StdIncPc StdIncPc," Fr11  IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _Fetch    Fetch ,  " Fr11  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _Fetch2   Fetch2,  " Fr11  Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3  ) // [5] Must be at even ucode adr. 
#define _eFetch   eFetch,  " Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2 )   // [4]] Must be at address after [3]
#define _eFetch2  eFetch2, " Fr11  Not in use",                                     unx
#define _eFetch3  eFetch3, " Fr11  Write minstret. Update I. Q=immediate, use dinx",isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx

#else
#error Que?
#endif                                                                                                                                                               





// Yes, this works..   #if HAS_EBR_MINSTRET
// Yes, this works..   //                                                                                  ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
// Yes, this works..   //                                                                                  action       | op          adr/en  read adr    op     op      operation        ucode
// Yes, this works..   #define _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
// Yes, this works..   #define _Fetch    Fetch ,  "NewOp  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
// Yes, this works..   #define _eFetch   eFetch,  "   eF  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4] Must be at address after [3]
// Yes, this works..   #define _Fetch2   Fetch2,  "    F2 Update ttime",                                   isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(Fetch3  )  // [5] Must be at even ucode adr. 
// Yes, this works..   #define _Fetch3   Fetch3,  "    F3 Write minstret. Update I. Q=immediate, use dinx",isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx
// Yes, this works..   #define _eFetch2  eFetch2, "nu", unx
// Yes, this works..   #define _eFetch3  eFetch3, "nu", unx
// Yes, this works..   #else
// Yes, this works..   #define _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 nxtSTB       | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
// Yes, this works..   #define _Fetch    Fetch ,  "NewOp  Read and latch instruction",                     isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
// Yes, this works..   #define _Fetch2   Fetch2,  "    F2 Update ttime. Update I. Q=immediate. Use dinx",  isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      
// Yes, this works..   #define _Fetch3   Fetch3,  "    F3 Not in use",                                     unx
// Yes, this works..   //efine _eFetch   eFetch,  "   eF  rep Read until d=mem[(rs1+ofs) & ~3u]",          isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
// Yes, this works..   //efine _eFetch2  eFetch2, "   eF2 Update ttime, Q=immediate. Use dinx",            isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx
// Yes, this works..   #define _eFetch3  eFetch3, "   eF3 Not in use",                                     unx
// Yes, this works..   #define _eFetch   eFetch,  "nu", unx
// Yes, this works..   #define _eFetch2  eFetch2, "nu", unx
// Yes, this works..   #endif

#define _aFault   aFault,  " err   Load access fault. Faulting adr to mtval",       isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [2] Must be after [1]
#define _aFault_1 aFault_1,"       Q = 4",                                          isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aFault_2)
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
#define _LB_6     LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80",       isr_none     | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
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
#define _LDAF_2   LDAF_2,  "       Store 4 to mcause",                              isr_intoTrap | A_add4    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)    
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
#define _condb_2  condb_2, "       ~RS2 in Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(condb_3 )  
#define _condb_3  condb_3, "       Calculate RS1+~RS2+1",                           isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(condb_4 )  
#define _condb_4  condb_4, "       Branch on condition",                            isr_none     | A_passd   | Wnn   | Ryy       | Qu   | sr_h  | usebcond       | n(condb_5 )  

#define _condb_5  condb_5, "       Branch not taken.",                              nxtSTB       | A_passq4  | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  /* Must be placed at even ucode adr. Goes to either Fetch or eFetch     */
#define _condb_5t condb_5t,"       Branch taken.",                                  nxtSTB       | A_addDQ   | Wpc   | Ralu      | Qu   | sr_h  | wordaligned    | n(BrOpFet )  /* Must be placed at the next ucode adr */

#define _BrOpFet  BrOpFet ,"NewOp2 Read until instruction latched",                 isr_none     | A_passd   | Wnn   | rHorL     | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  /* Must be placed at even ucode adr     */ // PROBLEM HERE
#define _BAlignEr BAlignEr," Err   Branch target instruction address misaligned",   isr_none     | A_xx      | Wnn   | Rpc       | Qx   | sr_h  | u_cont         | n(BAERR_1)   /* Must be placed at the next ucode adr */
#define _BAERR_1  BAERR_1, "       Faultadr to mtval. Prepare get offset",          isr_none     | A_passd   | Wmtval| Ryy       | Qz   | sr_h  | u_cont         | n(BAERR_2)   
#define _BAERR_2  BAERR_2, "       ~offset to Q. Prep read (origPC+offset)",        isr_none     | A_nearXOR | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(BAERR_3)   
#define _BAERR_3  BAERR_3, "       origPC to mepc. Prep read 0",                    isr_none     | A_add1    | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
#define _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    isr_intoTrap | A_passd   | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)   
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
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
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _SLTI_0   SLTI_0,  "SLTI   Set less than immediate (signed)",               isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
//efine _SLTIX_1  SLTIX_1, "       RS1 - imm / RS1 - RS2",                          isr_none     | A_add1    | Wnn   | r_xx      | Qz   | sr_h  | u_cont         | n(SLTIX_2)   
//efine _SLTIX_2  SLTIX_2, "       Registered ALU flag to rd",                      isr_none     | A_passq_F | WTRG  | Rpc       | Qzh  | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _SLT_0    SLT_0,   "SLT    Set less than (signed)",                         isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    
#define _SLTX_1   SLTX_1,  "       ~rs2 to Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
//efine _SLTIX_1  SLTIX_1, "       RS1 - imm / RS1 - RS2",                          isr_none     | A_add1    | Wnn   | r_xx      | Qz   | sr_h  | u_cont         | n(SLTIX_2)   
//efine _SLTIX_2  SLTIX_2, "       Registered ALU flag to rd",                      isr_none     | A_passq_F | WTRG  | Rpc       | Qzh  | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _SLTU_0   SLTU_0,  "SLTU   Set less than (unsigned)",                       isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    
//efine _SLTX_1   SLTX_1,  "       ~rs2 to Q",                                      isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
//efine _SLTIX_1  SLTIX_1, "       RS1 - imm / RS1 - RS2",                          isr_none     | A_add1    | Wnn   | r_xx      | Qz   | sr_h  | u_cont         | n(SLTIX_2)   
//efine _SLTIX_2  SLTIX_2, "       Registered ALU flag to rd",                      isr_none     | A_passq_F | WTRG  | Rpc       | Qzh  | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _LUI_0(x) x,       "LUI    q = imm20",                                      isr_none     | A_passq   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _AUIPC_0(x) x,     "AUIPC  q = imm20 (copy x/8)",                           isr_none     | A_xx      | Wnn   | Rpc       | Qhld | sr_h  | u_cont         | n(ADDI_0)    
#define _ADDI_0   ADDI_0,  "ADDI   Add immediate. rd =RS1+Iimm (or joined)",        isr_none     | A_addDQ   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _ADD_0    ADD_0,   "ADD    add     Addition Q = RS1",                       isr_none     | A_passd   | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(ADDI_0)    
//efine _ADDI_0   ADDI_0,  "ADDI   Add immediate. rd =RS1+Iimm (or joined)",        isr_none     | A_addDQ   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
//             In first cycle, must use A_passq because alignment is                                                                                             
//             determined from output of B. */                                                                                                                   
#define _JAL_0(x) x,       "JAL    J-imm is in q. Branch on alignfault",            isr_none     | A_passq   | Wnn   | Rpc       | Qhld | sr_h  | wordaligned    | n(JAL_1)      
#define _JAL_1    JAL_1,   "       Target adr to jj",                               isr_none     | A_addDQ   | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)     
#define _JAL_2    JAL_2,   "       Return address to TRG",                          isr_none     | A_add4    | WTRG  | Ryy       | Qx   | sr_h  | u_cont         | n(JAL_3)   /* [qq] JAL_2 must be at even ucodeadr */
#define _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             nxtSTB       | A_passd   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)   /* Goes to either Fetch or eFetch */
//                                                                                                                                                               
//             The first of these instructions must be placed directly                                                                                           
//             following the JAL_1 instruction                                                                                                                   
#define _JAERR_1  JAERR_1, " Err   JAL target adr misaligned, store to mtval",      isr_none     | A_addDQ   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(JAERR_2)   
#define _JAERR_2  JAERR_2, "       Store PC to mepc",                               isr_none     | A_passd   | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
//efine _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
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
#define _JALR_2   JALR_2,  "       Q = (RS1+imn) & 0xfffffffe",                     isr_none     | A_nearAND | Wyy   | Rpc       | Qz   | sr_h  | wordaligned    | n(JAL_2)     
//                                                                                                                                                               
///* The next instruction must follow JAL_2 (no typo) */                                                                                                         
#define _JALRE1   JALRE1,  " err   Store pc to mepc",                               isr_none     | A_passd   | Wmepc | Ryy       | Qx   | sr_h  | u_cont         | n(JALRE2)    // [rr] follows [qq]
#define _JALRE2   JALRE2,  "       mtval is target",                                isr_none     | A_passd   | Wmtval| r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
//efine _BAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",    
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
#define _SW_0(x)  x,       "SW     Store word. Q=wradr=RS1+Simm",                   nxtSTB |nxtWE| A_addDQ   | Wnn   | RS2       | Qu   | sr_h  | wordaligned    | n(SW_1)      
#define _SW_1     SW_1,    "       Write d to a+k until accepted",                  isr_none     | A_passd   | WAQW  | RS2       | Qhld | sr_h  | u_io_o         | n(SW_2)      // [A] even ucode adr 
#define _SW_2     SW_2,    "       Prepare read PC",                                isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // [C] even ucode adr 
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//
#define _aF_SW    aF_SW,   " err   SW/SH/SB access fault. Rest to set SEL_O=4'hf",  isr_none     | A_xx      | Wnn   | r_xx      | Qhld | sr_h  | u_cont         | n(aF_SW_1)   // [D] directly following [C]
#define _aF_SW_1  aF_SW_1, " err   SW Store access fault. Faulting adr to mtval",   isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aF_SW_2)
#define _aF_SW_2  aF_SW_2, "       Q = 4",                                          isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aF_SW_3)
#define _aF_SW_3  aF_SW_3, "       Store 7 to mcause",                              isr_intoTrap | A_add3    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//efine _LDAF_3   LDAF_3,  "       PC to mepc",                                     
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             
//
#define _SW_E1(x) x,       "       Store faulting address alignment to mtval",      isr_none     | A_passq   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(SW_E2)     // [B] directly following [A]
#define _SW_E2    SW_E2,   "       Store address that faulted",                     isr_none     | A_passd   | Wmepc | rFFFFFFFF | Qz   | sr_h  | u_cont         | n(SW_E3)     
#define _SW_E3    SW_E3,   "       Q = 3",                                          isr_none     | A_add4    | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(SW_E4)     
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
#define _ECAL_BRK ECAL_BRK,"ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK",       isr_none     | A_passq   | Wjj   | Rpc       | Qhld | sr_h  | hwordaligned   | n(ECAL_RET)
#define _ECAL_RET ECAL_RET,"ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET",           isr_none     | A_passq   | Wjj   | Rpc       | Qhld | sr_h  | wordaligned    | n(ECALL_1) /* Must be at even ucode adr */
#define _ECALL_1  ECALL_1, "ECALL  mepc = pc, prep store 0 to mtval",               isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(ECALL_2) /* Must be at even ucode adr */
#define _ECALL_2  ECALL_2, "       mtval = 0, now start the chore of 11 to mcause", isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(ECALL_3)   
#define _ECALL_3  ECALL_3, "       Q = 4",                                          isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_4)   
#define _ECALL_4  ECALL_4, "       Q = 8",                                          isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_5)   
#define _ECALL_5  ECALL_5, "       mcause = 11",                                    isr_intoTrap | A_add3    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
#define _EBREAK_1 EBREAK_1,"EBREAK mepc = pc, prep store 0 to mtval",               isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(EBREAK_2) /* Must follow _ECAL_RET */
#define _EBREAK_2 EBREAK_2,"       mtval = 0, ",                                    isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(EBREAK_3)  
#define _EBREAK_3 EBREAK_3,"       mcause = 3",                                     isr_intoTrap | A_add3    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//                                                                                                                                                               
#define _xRET_1   xRET_1,  "(U/S/M)RET Prepare emulation entry point 0x104",        isr_none     | A_xx      | Wnn   | r000000FF | Qz   | sr_h  | u_cont         | n(xRET_2)  /* Must folliw _ECALL_1 */
#define _xRET_2   xRET_2,  "       Prep +4",                                        isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRW_0  CSRRW_0, "CSRRW  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRW_1  CSRRW_1, "       CSRRW sentinel 0x00000100",                      isr_none     | A_add1    | Wyy   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)   
#define _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
#define _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRS_0  CSRRS_0, "CSRRS  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRS_1)   
#define _CSRRS_1  CSRRS_1, "       CSRRS sentinel 0x00000102",                      isr_none     | A_add3    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)
//efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
//efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRC_0  CSRRC_0, "CSRRC  Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRC_1)   
#define _CSRRC_1  CSRRC_1, "       CSRRC sentinel 0x0000103",                       isr_none     | A_add4    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)   
//efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
//efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRWI_0 CSRRWI_0,"CSRRWI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRWI_1)  
#define _CSRRWI_1 CSRRWI_1,"       CSRRWI sentinel 0xffffff80",                     isr_none     | A_add1    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)  
#define _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
//efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRSI_0 CSRRSI_0,"CSRRSI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRSI_1)  
#define _CSRRSI_1 CSRRSI_1,"       CSRRSI sentinel 0xffffff82",                     isr_none     | A_add3    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)   
//efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
//efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _CSRRCI_0 CSRRCI_0,"CSRRCI Decoded CSR adr in jj",                          isr_none     | A_passq   | Wjj   | rFFFFFF7F | Qz   | sr_h  | u_cont         | n(CSRRCI_1)  
#define _CSRRCI_1 CSRRCI_1,"       CSRRCI sentinel 0xffffff83",                     isr_none     | A_add4    | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRWI_2)  
//efine _CSRRWI_2 CSRRWI_2,"       Prepare write current PC to 0x100",              isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(CSRRW_2)  
//efine _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
//efine _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc)
//      _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 isr_none     | A_add4    | Wpc   | Ralu      | Qu   | sr_h  | u_cont         | n(OpFetch )  etc
//                                                                                                                                                               
#define _IJ_0     IJ_0,    "IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0",            isr_use_ij   | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | hwordaligned   | n(IJ_1)
#define _IJ_1     IJ_1,    "       Read until q=mem[(rs1+ofs)&~3u]",                isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJ_2)     /* Must be placed at even ucode adr */
#define _IJ_2     IJ_2,    "       Read word is to be masked with 2 lsb = 00",      isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJ_3)
#define _IJ_3     IJ_3,    "       Construct Q = 3",                                isr_none     | A_add3    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJ_4)
#define _IJ_4     IJ_4,    "       Mask and use as PC",                             nxtSTB       | A_nearAND | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)    /* Goes to either Fetch or eFetch */
                                                                                                                                                                 
#define _IJT_1    IJT_1,   "       Exit CSR, enter trap",                           isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJT_2)    /* Ajacent to IJ_1 */
#define _IJT_2    IJT_2,   "       Read word is to be masked with ~3u",             isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJT_3)
#define _IJT_3    IJT_3,   "       Construct Q = 3",                                isr_none     | A_add3    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJT_4)
#define _IJT_4    IJT_4,   "       Mask and store to mepc and Q for read of instr", nxtSTB       | A_nearAND | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     
//efine _ILL_2    ILL_2,   "       Read until Q is offending instruction",          
//efine _ILL_3    ILL_3,   "       Store illegal instruction to mtval",             
//efine _ILL_4    ILL_4,   "       Q = 1",                                          
//efine _ILL_5    ILL_5,   "       Store 2 to mcause",                              
//efine _JAL_3    JAL_3,   "       PC = trap entry point. OpFetch",                 
//

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
 * instruction is StdIncPc, that we find in location 0x1e below. We
 * can then follow the chain to OpFetch and finally OpFetch2.
 *
 * The use of this table, apart from those microcodeinstructions that
 * must be in fixed positions, is entirely up to me. I simply fill it
 * out here. A separate utility, ucode_linepermutate, make some
 * optimalisatons by juggeling where a specific microcode instruction
 * is located in the table.
 *
 */
//         Fixed  Paired
//ORIGTAB  |      |                              This comment is important, used by ucode_linepermutate to find this data.
/* 00 */Y( 1,     0 , _LB_0              )
/* 01 */Y( 0,     0 , _LB_1              )
/* 02 */Y( 1,     0 , _IJ_0              )
/* 03 */Y( 1,     0 , _FENCE(FENCE)      )
/* 04 */Y( 1,     0 , _ADDI_0            )
/* 05 */Y( 1,     0 , _AUIPC_0(_L05)     )
/* 06 */Y( 0,     0 , _LB_3              )
/* 07 */Y( 0,     0 , _LB_4              )
/* 08 */Y( 1,     0 , _SB_0(_L08)        )
/* 09 */Y( 0,     0 , _LB_5              )
/* 0a */Y( 1,     0 , _SB_0(_L0a)        )
/* 0b */Y( 0,     0 , _LB_6              )
/* 0c */Y( 1,     0 , _ADD_0             )
/* 0d */Y( 1,     0 , _LUI_0(LUI)        )
/* 0e */Y( 1,     0 , _SUB_0             )
/* 0f */Y( 1,     0 , _LUI_0(_L0f)       )
/* 10 */Y( 0,     0 , _SUB_1             )
/* 11 */Y( 0,     0 , _L11,"q:11", unx   )
/* 12 */Y( 0,     0 , _eFetch3           )
/* 13 */Y( 0,     0 , _condb_2           )
/* 14 */Y( 0,     0 , _condb_3           )
/* 15 */Y( 0,     0 , _condb_4           )
/* 16 */Y( 0,  0x01 , _condb_5           )
/* 17 */Y( 0,  0x01 , _condb_5t          )
/* 18 */Y( 1,     0 , _BEQ               )
/* 19 */Y( 1,     0 , _JALR_0            )
/* 1a */Y( 0,     0 , _ANDI_1            )
/* 1b */Y( 1,     0 , _JAL_0(_L1b)       )
/* 1c */Y( 1,     0 , _ECAL_BRK          )
/* 1d */Y( 0,     0 , _ORI_2             )
/* 1e */Y( 0,     0 , _aFault_1          )
/* 1f */Y( 0,     0 , _IJ_2              )
/* 20 */Y( 1,     0 , _LH_0              )
/* 21 */Y( 0,     0 , _XORI_1            )
/* 22 */Y( 0,     0 , _AND_1             )
/* 23 */Y( 1,     0 , _FENCE(FENCEI)     )
/* 24 */Y( 1,     0 , _SLLI_0            )
/* 25 */Y( 1,     0 , _AUIPC_0(_L25)     )
/* 26 */Y( 0,     0 , _OR_1              )
/* 27 */Y( 0,     0 , _OR_2              )
/* 28 */Y( 1,     0 , _SH_0(_L28)        )
/* 29 */Y( 0,     0 , _XOR_1             )
/* 2a */Y( 1,     0 , _SH_0(_L2a)        )
/* 2b */Y( 0,     0 , _SLTIX_1           )
/* 2c */Y( 1,     0 , _SLL_0             )
/* 2d */Y( 1,     0 , _LUI_0(_L2d)       )
/* 2e */Y( 1,     0 , _ILL_0(_L2e)       )
/* 2f */Y( 1,     0 , _LUI_0(_L2f)       )
/* 30 */Y( 0,     0 , _SLTIX_2           )
/* 31 */Y( 0,     0 , _SLTX_1            )
/* 32 */Y( 0,  0x02 , _JAL_1             ) 
/* 33 */Y( 0,  0x02 , _JAERR_1           )
/* 34 */Y( 0,     0 , _JAL_3             )
/* 35 */Y( 0,     0 , _SLLI_1            )
/* 36 */Y( 0,     0 , _SLLI_2            )
/* 37 */Y( 0,     0 , _ECALL_2           )
/* 38 */Y( 1,     0 , _BNE               )
/* 39 */Y( 1,     0 , _ILL_0(_L39)       )
/* 3a */Y( 0,     0 ,  _SRxI_1           )
/* 3b */Y( 1,     0 , _JAL_0(_L3b)       )
/* 3c */Y( 1,     0 , _CSRRW_0           )
/* 3d */Y( 0,     0 , _SRxI_2            )
/* 3e */Y( 0,     0 , _SLL_1             )
/* 3f */Y( 0,     0 , _SRx_1             )
/* 40 */Y( 1,     0 , _LW_0              )
/* 41 */Y( 0,     0 , _JALR_1            )
/* 42 */Y( 0,     0 , _JALR_2            )
/* 43 */Y( 1,     0 , _ILL_0(_L43)       )
/* 44 */Y( 1,     0 , _SLTI_0            )
/* 45 */Y( 1,     0 , _AUIPC_0(_L45)     )
/* 46 */Y( 0,     0 , _ILL_1             )
/* 47 */Y( 0,     0 , _ILL_2             )
/* 48 */Y( 1,     0 , _SW_0(_L48)        )
/* 49 */Y( 0,     0 , _CSRRW_1           )
/* 4a */Y( 1,     0 , _SW_0(_L4a)        )
/* 4b */Y( 0,     0 , _CSRRW_2           )
/* 4c */Y( 1,     0 , _SLT_0             )
/* 4d */Y( 1,     0 , _LUI_0(_L4d)       )
/* 4e */Y( 1,     0 , _ILL_0(_L4e)       )
/* 4f */Y( 1,     0 , _LUI_0(_L4f)       )
/* 50 */Y( 0,  0x03 , _LW_1              ) 
/* 51 */Y( 0,  0x03 , _LDAF(LDAF_LW)     )
/* 52 */Y( 0,  0x04 , _LH_1              )
/* 53 */Y( 0,  0x04 , _LDAF(LDAF_LH)     )
/* 54 */Y( 0,  0x05 , _LH_2              )
/* 55 */Y( 0,  0x05 , _aFaultb           )
/* 56 */Y( 0,     0 , _LH_4              )
/* 57 */Y( 0,     0 , _LH_5              )
/* 58 */Y( 1,     0 , _ILL_0(_L58)       )
/* 59 */Y( 1,     0 , _ILL_0(_L59)       )
/* 5a */Y( 0,     0 , _SB_1              )
/* 5b */Y( 1,     0 , _JAL_0(_L5b)       )
/* 5c */Y( 1,     0 , _CSRRS_0           )
/* 5d */Y( 0,     0 , _SB_2              )
/* 5e */Y( 0,  0x06 , _LHU_1             )
/* 5f */Y( 0,  0x06 , _LDAF(LDAF_LHU)    )
/* 60 */Y( 1,     0 , _ILL_0(_L60)       )
/* 61 */Y( 0,     0 , _LBU_1             )
/* 62 */Y( 0,     0 , _LHU_3             )
/* 63 */Y( 1,     0 , _ILL_0(_L63)       )
/* 64 */Y( 1,     0 , _SLTIU_0           )
/* 65 */Y( 1,     0 , _AUIPC_0(_L65)     )
/* 66 */Y( 0,  0x07 , _SW_1              ) 
/* 67 */Y( 0,  0x07 , _SW_E1(SWE)        )
/* 68 */Y( 1,     0 , _ILL_0(_L68)       )
/* 69 */Y( 0,     0 , _SB_3              )
/* 6a */Y( 1,     0 , _ILL_0(_L6a)       )
/* 6b */Y( 0,     0 , _SB_4              )
/* 6c */Y( 1,     0 , _SLTU_0            )
/* 6d */Y( 1,     0 , _LUI_0(_L6d)       )
/* 6e */Y( 1,     0 , _ILL_0(_L6e)       )
/* 6f */Y( 1,     0 , _LUI_0(_L6f)       )
/* 70 */Y( 0,  0x08 , _LHU_2             )
/* 71 */Y( 0,  0x08 , _aFaultc           )
/* 72 */Y( 0,     0 , _LBU_3             )
/* 73 */Y( 0,     0 , _BAERR_1           )
/* 74 */Y( 0,  0x09 , _BrOpFet           )
/* 75 */Y( 0,  0x09 , _BAlignEr          )
/* 76 */Y( 0,     0 , _BAERR_2           )
/* 77 */Y( 0,     0 , _BAERR_3           )
/* 78 */Y( 1,     0 , _ILL_0(_L78)       )
/* 79 */Y( 1,     0 , _ILL_0(_L79)       )
/* 7a */Y( 0,     0 , _SB_5              )
/* 7b */Y( 1,     0 , _JAL_0(_L7b)       )
/* 7c */Y( 1,     0 , _CSRRC_0           )
/* 7d */Y( 0,     0 , _BAERR_4           )
/* 7e */Y( 0,     0 , _NMI_1             )
/* 7f */Y( 0,     0 , _JALRE2            )
/* 80 */Y( 1,     0 , _LBU_0             )
/* 81 */Y( 0,     0 , _JAERR_2           )
/* 82 */Y( 0,     0 , _ILL_3             )
/* 83 */Y( 1,     0 , _ILL_0(_L83)       )
/* 84 */Y( 1,     0 , _XORI_0            )
/* 85 */Y( 1,     0 , _AUIPC_0(_L85)     )
/* 86 */Y( 0,  0x0a , _JAL_2             )
/* 87 */Y( 0,  0x0a , _JALRE1            )
/* 88 */Y( 1,     0 , _ILL_0(_L88)       )
/* 89 */Y( 0,     0 , _ILL_4             )
/* 8a */Y( 1,     0 , _ILL_0(_L8a)       )
/* 8b */Y( 0,     0 , _ILL_5             )
/* 8c */Y( 1,     0 , _XOR_0             )
/* 8d */Y( 1,     0 , _LUI_0(_L8d)       )
/* 8e */Y( 1,     0 , _ILL_0(_L8e)       )
/* 8f */Y( 1,     0 , _LUI_0(_L8f)       )
/* 90 */Y( 0,     0 , _NMI_2             )
/* 91 */Y( 0,     0 , _LDAF_2            )
/* 92 */Y( 0,     0 , _LDAF_3            )
/* 93 */Y( 0,     0 , _SW_E2             )
/* 94 */Y( 0,     0 , _SW_E3             )
/* 95 */Y( 0,     0 , _SW_E4             )
/* 96 */Y( 0,  0x0b , _SH_1              )
/* 97 */Y( 0,  0x0b , _SW_E1(SWH)        )
/* 98 */Y( 1,     0 , _BLT               )
/* 99 */Y( 1,     0 , _ILL_0(_L99)       )
/* 9a */Y( 0,     0 , _SH_2              )
/* 9b */Y( 1,     0 , _JAL_0(_L9b)       )
/* 9c */Y( 1,     0 , _ILL_0(_L9c)       )
/* 9d */Y( 0,     0 , _SH_3              )
/* 9e */Y( 0,     0 , _SH_4              )
/* 9f */Y( 0,     0 , _SH_5              )
/* a0 */Y( 1,     0 , _LHU_0             )
/* a1 */Y( 0,     0 , _ECALL_3           )
/* a2 */Y( 0,     0 , _ECALL_4           )
/* a3 */Y( 1,     0 , _ILL_0(_La3)       )
/* a4 */Y( 1,     0 , _SRxI_0            )
/* a5 */Y( 1,     0 , _AUIPC_0(_La5)     )
/* a6 */Y( 0,  0x0c , _ECAL_RET          )
/* a7 */Y( 0,  0x0c , _EBREAK_1          )
/* a8 */Y( 1,     0 , _ILL_0(_La8)       )
/* a9 */Y( 0,     0 , _ECALL_5           )
/* aa */Y( 1,     0 , _ILL_0(_Laa)       )
/* ab */Y( 0,     0 , _EBREAK_2          )
/* ac */Y( 1,     0 , _SRx_0(_Lac)       )    
/* ad */Y( 1,     0 , _LUI_0(_Lad)       )
/* ae */Y( 1,     0 , _SRx_0(_Lae)       )    
/* af */Y( 1,     0 , _LUI_0(_Laf)       )
/* b0 */Y( 0,     0 , _CSRRW_3           )
/* b1 */Y( 0,     0 , _CSRRS_1           )
/* b2 */Y( 0,     0 , _CSRRC_1           )
/* b3 */Y( 0,     0 , _CSRRWI_1          )
/* b4 */Y( 0,     0 , _CSRRWI_2          )
/* b5 */Y( 0,     0 , _CSRRSI_1          )
/* b6 */Y( 0,     0 , _CSRRCI_1          )
/* b7 */Y( 0,     0 , _IJ_3              )
/* b8 */Y( 1,     0 , _BGE               )
/* b9 */Y( 1,     0 , _ILL_0(_Lb9)       )
/* ba */Y( 0,     0 , _EBREAK_3          )
/* bb */Y( 1,     0 , _JAL_0(_Lbb)       )
/* bc */Y( 1,     0 , _CSRRWI_0          )
/* bd */Y( 0,     0 , _IJ_4              )
/* be */Y( 0,  0x0d , _IJ_1              )
/* bf */Y( 0,  0x0d , _IJT_1             )
/* c0 */Y( 1,     0 , _ILL_0(_Lc0)       )
/* c1 */Y( 0,     0 , _IJT_2             )
/* c2 */Y( 0,     0 , _IJT_3             )
/* c3 */Y( 1,     0 , _ILL_0(_Lc3)       )
/* c4 */Y( 1,     0 , _ORI_0             ) 
/* c5 */Y( 1,     0 , _AUIPC_0(_Lc5)     )
/* c6 */Y( 0,     0 , _IJT_4             )
/* c7 */Y( 0,     0 , _QINT_1            )
/* c8 */Y( 1,     0 , _ILL_0(_Lc8)       )
/* c9 */Y( 0,     0 , _xRET_2            )
/* ca */Y( 1,     0 , _ILL_0(_Lca)       )
/* cb */Y( 0,     0 , _QINT_2            )
/* cc */Y( 1,     0 , _OR_0              )
/* cd */Y( 1,     0 , _LUI_0(_Lcd)       )
/* ce */Y( 1,     0 , _ILL_0(_Lce)       )
/* cf */Y( 1,     0 , _LUI_0(_Lcf)       )
/* d0 */Y( 0,  0x0e , _ECALL_1           )
/* d1 */Y( 0,  0x0e , _xRET_1            )
/* d2 */Y( 0,  0x0f , _LB_2              )
/* d3 */Y( 0,  0x0f , _aFaultd           )
/* d4 */Y( 0,     0 , _aFault_2          )
/* d5 */Y( 0,     0 , _eFetch2           )
/* d6 */Y( 0,     0 , _jFault_1          )
/* d7 */Y( 0,     0 , _LH_3              )
/* d8 */Y( 1,     0 , _BLTU              )
/* d9 */Y( 1,     0 , _ILL_0(_Ld9)       )
/* da */Y( 0,     0 , _LDAF_a            )
/* db */Y( 1,     0 , _JAL_0(_Ldb)       )
/* dc */Y( 1,     0 , _CSRRSI_0          )
/* dd */Y( 0,     0 , _aF_SW_1           )
/* de */Y( 0,  0x10 , _Fetch             ) 
/* df */Y( 0,  0x10 , _eFetch            ) 
/* e0 */Y( 1,     0 , _ILL_0(_Le0)       )
/* e1 */Y( 0,     0 , _ORI_1             )
/* e2 */Y( 0,     0 , _aF_SW_2           )
/* e3 */Y( 1,     0 , _ILL_0(_Le3)       )
/* e4 */Y( 1,     0 , _ANDI_0            )
/* e5 */Y( 1,     0 , _AUIPC_0(_Le5)     )
/* e6 */Y( 0,  0x11 , _StdIncPc          )
/* e7 */Y( 0,  0x11 , _aFault            )
/* e8 */Y( 1,     0 , _ILL_0(_Le8)       )
/* e9 */Y( 0,     0 , _aF_SW_3           )
/* ea */Y( 1,     0 , _ILL_0(_Lea)       )
/* eb */Y( 0,     0 , _Leb,"q:eb", unx   )
/* ec */Y( 1,     0 , _AND_0             )
/* ed */Y( 1,     0 , _LUI_0(_Led)       )
/* ee */Y( 1,     0 , _ILL_0(_Lee)       )
/* ef */Y( 1,     0 , _LUI_0(_Lef)       )
/* f0 */Y( 0,  0x12 , _LBU_2             )
/* f1 */Y( 0,  0x12 , _aFaulte           )
/* f2 */Y( 0,  0x13 , _SW_2              )
/* f3 */Y( 0,     0 , _aF_SW             ) 
/* f4 */Y( 0,     0 , _Fetch2            )
/* f5 */Y( 0,     0 , _jFault            )
/* f6 */Y( 0,     0 , _Lf6,"q:f6", unx   )
/* f7 */Y( 0,     0 , _Lf7,"q:f7", unx   )
/* f8 */Y( 1,     0 , _BGEU              )
/* f9 */Y( 1,     0 , _ILL_0(_Lf9)       )
/* fa */Y( 0,     0 , _Lfa,"q:fa", unx   )
/* fb */Y( 1,     0 , _JAL_0(_Lfb)       )
/* fc */Y( 1,     0 , _CSRRCI_0          )
/* fd */Y( 1,     0 , _NMI_0             )
/* fe */Y( 1,     0 , _ILLe              )
/* ff */Y( 1,     0 , _QINT_0            )


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
