/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
  The microcode of midgetv.
  Switches in midgetv_ucodeoptions.h affects generated ucode.

 */

#include "midgetv_ucodeoptions.h"
#if ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 1
#error Can not do this, see comment in "midgetv_ucodeoptions.h"
#endif

#include "ucode_constantdefs.h"
#include "ucode_fielddefs.h"

/* Locations that are unused in the table should never be accessed.
   If they are, the controller have a fatal error. To make debugging
   in such a case a bit easier, I should ensure there is no loops in
   these cases. I sould also avoid repetitions, and strobes and ack's.
   Should have: 
   Wnn  (No write)
   isr_none
   u_cont
   nxtSTB == 0
   nxtWE  == 0
   Rpc
   next StdIncPc
 */
#define x8 ((xxxx<<4) | xxxx )
#define x10 ((xx<<8)|x8)
#define x16 ((x8<<8)|x8)
#define x32 ((x16<<16)|x16)
#define x42 ((x10<<32)|x32)



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
 * This file works by repeated inclusion (x-macros).  Default
 * expansion of the below is the constants that make up a ucode
 * instruction
 */
#ifndef Y
#define Y(fixedpos, paired, ...) X(__VA_ARGS__) /* X-macro expansion help */
#endif


/*
  Fields for internal consistency:
  Fixed/even : 0 if ucode can be placed freely
               1 if ucode has a fixed position
               2 if ucode can be placed freely at an even ucode address, is first of a pair
               4 if ucode must be placed in range 0x22, 0x39, 0x42-0x43, 0x58-0x60, 0x62-0x63, 0x68, 0x6a, 0x78-0x79, 
                 0x82-0x83, 0x88, 0x8a, 0x99, 0x9c, 0xa2-0xa3, 0xa8, 0xaa, 0xb9, 0xc0, 0xc2-0xc3, 0xc8, 0xca, 0xd9, 
                 0xe0, 0xe2-0xe3, 0xe8, or 0xf9 (illegal as entry).
               8 if ucode is the second of a placed pair
              17 if ucode is don't care at a specific fixed position
              18 if ucode can be placed freely at an even ucode address, is not part of a pair
              31 if ucode is don't care, and illegal as an entry point
  Pair:  if (fixed/even == 1):  position of microcode instruction
         if (fixed/even == 8):  label of the microcode instruction at the address preceeding this microcode instruction (part 2 of a pair)
         Otherwise           :  -1 if there is no requirement
 */

/*
 * A number of locations may be hit by instruction decode of illegal instructions. 
 * When we have no MUL/DIV, we use entries in the table to lead to the response
 * of an illegal instruction.
 */
#define reinvent_ILL_0(x) _L ## x, " Not in use (illegal as entry)", 31,x, isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )     

// 22,42,62,82,a2,c2,e2 : Can get here from OpCode close to "ij"
// 39,59,79,99,b9,d9,f9 : Can get here from OpCode close to "JALR"
//    43.63,83,a3,c3,e3 : Can get here from OpCode close to "FENCE"/"FENCE.I"
//    58,78               Can get here from OpCode close to conditional branches
//       60,      c0,e0   Can get here from OpCode close to load instructions
//       68,88,a8,c8,e8   Can get here from OpCode close to store instructions
//       6a,8a,aa,ca,ea   Also: Can get here from OpCode close to store instructions
//          9c            Can get here from OpCode close to EBREAK/CSRxx

#define _unx12      unx12,   "12: Not in use ",                                         17,0x12,            x42
#define _unx22      reinvent_ILL_0(0x22)
#define _unx2e      unx2e,   "2e: Not in use ",                                         17,0x2e,            x42
#define _unx33      unx33,   "33: Not in use ",                                         17,0x33,            x42
#define _unx39      reinvent_ILL_0(0x39)
#define _unx3a      unx3a,   "3a: Not in use ",                                         17,0x3a,            x42
#define _unx42      reinvent_ILL_0(0x42)
#define _unx43      reinvent_ILL_0(0x43)
#define _unx4d      unx4d,   "4d: Not in use ",                                         17,0x4d,            x42
#define _unx58      reinvent_ILL_0(0x58)
#define _unx59      reinvent_ILL_0(0x59)
#define _unx60      reinvent_ILL_0(0x60)
#define _unx62      reinvent_ILL_0(0x62)
#define _unx63      reinvent_ILL_0(0x63)
#define _unx68      reinvent_ILL_0(0x68)
#define _unx69      unx69,   "69: Not in use ",                                         17,0x69,            x42
#define _unx6a      reinvent_ILL_0(0x6a)
#define _unx6d      unx6d,   "6d: Not in use ",                                         17,0x6d,            x42
#define _unx6e      unx6e,   "6e: Not in use ",                                         17,0x6e,            x42
#define _unx73      unx73,   "73: Not in use ",                                         17,0x73,            x42
#define _unx74      unx74,   "74: Not in use ",                                         17,0x74,            x42
#define _unx75      unx75,   "75: Not in use ",                                         17,0x75,            x42
#define _unx78      reinvent_ILL_0(0x78)
#define _unx79      reinvent_ILL_0(0x79)
#define _unx7d      unx7d,   "7d: Not in use ",                                         17,0x7d,            x42
#define _unx7f      unx7f,   "7f: Not in use ",                                         17,0x7f,            x42
#define _unx81      unx81,   "81: Not in use ",                                         17,0x81,            x42
#define _unx82      reinvent_ILL_0(0x82)
#define _unx83      reinvent_ILL_0(0x83)
#define _unx87      unx87,   "87: Not in use ",                                         17,0x87,            x42
#define _unx88      reinvent_ILL_0(0x88)
#define _unx89      unx89,   "89: Not in use ",                                         17,0x89,            x42
#define _unx8a      reinvent_ILL_0(0x8a)
#define _unx8d      unx8d,   "8d: Not in use ",                                         17,0x8d,            x42
#define _unx99      reinvent_ILL_0(0x99)
#define _unx9b      unx9b,   "9b: Not in use ",                                         17,0x9b,            x42
#define _unx9c      reinvent_ILL_0(0x9c)
#define _unx9d      unx9d,   "9d: Not in use ",                                         17,0x9d,            x42
#define _unxa2      reinvent_ILL_0(0xa2)
#define _unxa3      reinvent_ILL_0(0xa3)
#define _unxa8      reinvent_ILL_0(0xa8)
#define _unxaa      reinvent_ILL_0(0xaa)
#define _unxad      unxad,   "ad: Not in use ",                                         17,0xad,            x42
#define _unxb3      unxb3,   "b3: Not in use ",                                         17,0xb3,            x42
#define _unxb9      reinvent_ILL_0(0xb9)
#define _unxc0      reinvent_ILL_0(0xc0)
#define _unxc2      reinvent_ILL_0(0xc2)
#define _unxc3      reinvent_ILL_0(0xc3)
#define _unxc8      reinvent_ILL_0(0xc8)
#define _unxca      reinvent_ILL_0(0xca)
#define _unxcd      unxcd,   "cd: Not in use ",                                         17,0xcd,            x42
#define _unxd5      unxd5,   "d5: Not in use",                                          17,0xd5,            x42
#define _unxd9      reinvent_ILL_0(0xd9)
#define _unxe0      reinvent_ILL_0(0xe0)
#define _unxe2      reinvent_ILL_0(0xe2)
#define _unxe3      reinvent_ILL_0(0xe3)
#define _unxe8      reinvent_ILL_0(0xe8)
#define _unxea      reinvent_ILL_0(0xea)
#define _unxed      unxed,   "ed: Not in use",                                          17,0xed,            x42
#define _unxf9      reinvent_ILL_0(0xf9)


        
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _jFault   jFault,  " err   Fetch access fault. Faulting adr to mtval",          8,Fetch2,        isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(jFault_1)  // [6] Must be after [5]
#define _jFault_1 jFault_1,"       Store 1 to mcause",                                  0,-1,            isr_none     | A_add1    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)


/* ===================== *
 * HAS_EBR_MINSTRET = 0  *
 * HAS_MINSTRET     = 0  *
 * RVC              = 0  *
 * ======================*/
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _i0StdIncPc StdIncPc," Fr00  IncPC, OpFetch",                                   2,-1,            nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _i0Fetch    Fetch ,  " Fr00  Read and latch instruction",                       2,-1,            isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _i0Fetch2   Fetch2,  " Fr00  Update ttime. Update I. Q=immediate. Use dinx",    2,0xf4,          isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      // [5] Must be at even ucode adr. Fixed address to allow simplification 0xf4,0xb4
#define _i0eFetch   eFetch,  " Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]",            8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2 )   // [4]] Must be at address after [3]

#define _i0reserved i0reserv, "Not in use, reserved to allow LASTINCH",                 0,0xb4,          x42


/* We need to conway some information to C programs. What columns are to be
 * removed, and replaced with inserted Verilog code. Technically this is
 * done by simple inclusion of this file, with most macros disabled
 */
#if ucodeopt_RVC == 0 && ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 0
#define LASTINCH_REMOVECOLUMS ((1ull<<30) | (1ull<<18))
#define LASTINCH_CODE "wire instr0100,instr1x110100;        \
    bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));\
    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));\
    SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));\
    assign d[30] = d[18];"
#endif

/* ===================== *
 * HAS_EBR_MINSTRET = 0  *
 * HAS_MINSTRET     = 1  *
 * RVC              = 0  *
 * ======================*/
//                                                                                  
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _i1StdIncPc StdIncPc," Fr10  IncPC, OpFetch",                                   2,-1,            nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _i1Fetch    Fetch ,  " Fr10  Read and latch instruction",                       2,-1,            isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. jFault is adjacent to Fetch
#define _i1Fetch2   Fetch2,  " Fr10  Update ttime. Update I. Q=immediate. Use dinx",    2,-1,            isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      // [5] Must be at even ucode adr. 
#define _i1eFetch   eFetch,  " Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]",            8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
#define _i1eFetch2  eFetch2, " Fr10  Update ttime",                                     0,-1,            isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )  // I wonder, perhaps this should be part of apair to allow for bus error detection?
#define _i1eFetch3  eFetch3, " Fr10  Update minstret, Q=immediate. Use dinx",           0,-1,            isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx

// bit 18 is control for cycnt, bit 30 is control for use_dinx
// In this case we only replace bit 30
// It is possible we could move eFetch2 so that bit 18 can
// be replaced as well, but this has low priority.
#if ucodeopt_RVC == 0 && ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 0
#define LASTINCH_REMOVECOLUMS ((1ull<<30))
#define LASTINCH_CODE "wire instr0100,instr1x110100;        \
    bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));\
    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));\
    SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr1x110100));"
#endif


/* ===================== *
 * HAS_EBR_MINSTRET = 1  *
 * HAS_MINSTRET     = 1  *
 * RVC              = 0  *
 * ======================*/
//                                                                                  
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _i2StdIncPc StdIncPc," Fr11  IncPC, OpFetch",                                   2,-1,            nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _i2Fetch    Fetch ,  " Fr11  Read and latch instruction",                       2,-1,            isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _i2Fetch2   Fetch2,  " Fr11  Update ttime. Update I. Q=immediate. Use dinx",    2,-1,            isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )  // [5] Must be at even ucode adr. 
#define _i2eFetch   eFetch,  " Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]",            8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#define _i2eFetch3  eFetch3, " Fr11  Write minstret. Update I. Q=immediate, use dinx",  0,-1,            isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx

//  bit 18 is control for cycnt, bit 30 is control for use_dinx
//  In this case we only replace bit 30
//  By rearrangement of free ucodes we may save one lut here
#if ucodeopt_RVC == 0 && ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 1
#define LASTINCH_REMOVECOLUMS ((1ull<<30))
#define LASTINCH_CODE "wire instrxxxx0100,insgtr1011xxxx,instr10110100;        \
  bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));\
  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));\
  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100})); \
  SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));"
#endif
           

/* ===================== *
 * HAS_EBR_MINSTRET = 0  *
 * HAS_MINSTRET     = 0  *
 * RVC              = 1  *
 * ======================*/
/* When RVC is implemented, I ran into a problem with unaligned 32-bit instructions.
 * The essential problem was that pc may be incremented to straddle the two words
 * that contain the 32-bit instruction, but then PC is too large (by 2) for
 * instructions that uses PC as an address. This is at least AUIPC, BEQ,BNE, etc
 */
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _ic0StdIncPc StdIncPc," Fr00  IncPC, OpFetch",                                  2,-1,	         nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _ic0Fetch    Fetch ,  " Fr00  Read and latch instruction",                      2,-1,	         isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to jj
#define _ic0Fetch2   Fetch2,  " Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned ",  2,-1,	         isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // [5] Must be at even ucode adr. At unaligned 32-bit instr goto unalignd, else done.
#define _ic0eFetch   eFetch,  " Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4] Must be at address after [3]. Fetch from SRAM
#define _ic0unalignd unalignd," Fr00u Unaligned pc, prep read high hword",              0,-1,	         isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr
#define _ic0straddle straddle," Fr00u IncPC, OpFetch",                                  0,-1,	         nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // fittetesthere 2,-1
#define _ic0Fetchu   Fetchu , " Fr00u Read and latch instruction",                      2,-1,	         isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3b] Must be at even ucode adr. Fetch from EBR. Write copy of PC to yy
#define _ic0eFetchu  eFetchu, " Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetchu,	 isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4b] Must be at address after [3b]. Fetch from SRAM
#define _ic0reserved ic0reser," Fr00  Not really used, reserved to allow LASTINCH",     0,0xb4,          x42
#if ucodeopt_RVC == 1 && ucodeopt_HAS_MINSTRET == 0 && ucodeopt_HAS_EBR_MINSTRET == 0
#define LASTINCH_REMOVECOLUMS ((1ull<<30) | (1ull<<18))
#define LASTINCH_CODE "wire instr0100,instr1x110100;        \
bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));\
bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));\
SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));\
assign d[30] = d[18];"
#endif

/* ===================== *
 * HAS_EBR_MINSTRET = 0  *
 * HAS_MINSTRET     = 1  *
 * RVC              = 1  *
 * ======================*/
#define _ic1StdIncPc StdIncPc," Fr10  IncPC, OpFetch",                                  2,-1,            nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // [1] Must be at even ucode adr. Goes to either Fetch or eFetch. 
#define _ic1Fetch    Fetch ,  " Fr10  Read and latch instruction",                      2,-1,            isr_none     | A_passq   | Wjj   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _ic1Fetch2   Fetch2,  " Fr10  Update ttime. Update I. Q=immediate. Use dinx",   2,-1,            isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // [5] Must be at even ucode adr. At unaligned 32-bit instr goto unalignd, else done
#define _ic1eFetch   eFetch,  " Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(eFetch2 )  // [4]] Must be at address after [3]
#define _ic1eFetch2  eFetch2, " Fr10  Update ttime",                                    0,-1,            isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )
#define _ic1eFetch3  eFetch3, " Fr10  Update minstret, Q=immediate. Use dinx",          0,-1,            isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  //  At unaligned 32-bit instr goto unalignd, else done
#define _ic1unalignd unalignd," Fr10u Unaligned pc, prep read high hword",              0,-1,            isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr
#define _ic1straddle straddle," Fr10u IncPC, OpFetch",                                  0,-1,            nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // I believe this comment to be wrong. [1] Must be at even ucode adr. Goes to either Fetchu or eFetchu. 
#define _ic1Fetchu   Fetchu , " Fr10u Read and latch instruction",                      2,-1,            isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR. Write copy of PC to yy
#define _ic1eFetchu  eFetchu, " Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetchu,        isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#if ucodeopt_RVC == 1 && ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 0
#define LASTINCH_REMOVECOLUMS 0
#define LASTINCH_CODE ""
#endif

/* ===================== *
 * HAS_EBR_MINSTRET = 1  *
 * HAS_MINSTRET     = 1  *
 * RVC              = 1  *
 * ======================*/
#define _ic2StdIncPc StdIncPc," Fr11  IncPC, OpFetch",                                  2,-1,            nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  // [1] Must be at even ucode adr, is followed by aFault. Goes to either Fetch or eFetch. 
#define _ic2Fetch    Fetch ,  " Fr11  Read and latch instruction",                      2,-1,            isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [3] Must be at even ucode adr. Fetch from EBR
#define _ic2Fetch2   Fetch2,  " Fr11  Update ttime. Update I. Q=immediate. Use dinx",   2,-1,            isr_none     | A_cycnt   | Wttime| Rrinst    | Qz   | sr_h  | u_cont         | n(eFetch3 )  // [5] Must be at even ucode adr. Is followed by [6] (fetch access fault)
#define _ic2eFetch   eFetch,  " Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetch,         isr_none     | A_passq   | Wjj   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  // [4]] Must be at address after [3]. Fetch from SRAM
#define _ic2Fetch2u  Fetch2u, " Fr11  Update ttime. Update I. Q=immediate. Use dinx",   0,-1,            isr_none     | A_cycnt   | Wttime| RS1       | Qudec| sr_h  | use_dinx                      //  
#define _ic2eFetch3  eFetch3, " Fr11  Write minstret. Update I. Q=immediate, use dinx", 0,-1,            isr_none     | A_add1    | Wrinst| RS1       | Qudec| sr_h  | use_dinx       | n(unalignd)  // At unaligned 32-bit instr goto unalignd, else done
#define _ic2unalignd unalignd," Fr10u Unaligned pc, prep read high hword",              0,-1,            isr_none     | A_passq   | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(straddle)  // For unaligned 32-bit instr

// Here I know to have more work on aFault
//efine _ic2straddle straddle," Fr10u IncPC, OpFetch",                                  2,-1,            nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // [1] Must be at even ucode adr. Is followed by aFault copy. Goes to either Fetchu or eFetchu. 
#define _ic2straddle straddle," Fr10u IncPC, OpFetch",                                  0,-1,            nxtSTB       | A_add2or4 | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetchu  )  // [1] Must be at even ucode adr. Is followed by aFault copy. Goes to either Fetchu or eFetchu. 

#define _ic2Fetchu   Fetchu , " Fr10u Read and latch instruction",                      2,-1,            isr_none     | A_passq   | Wnn   | rttime    | Qz   | sr_h  | u_io_i_latch   | n(Fetch2u )  // [3] Must be at even ucode adr. Fetch from EBR. 
#define _ic2eFetchu  eFetchu, " Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]",           8,Fetchu,        isr_none     | A_passq   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2u )  // [4]] Must be at address after [3]. Fetch from SRAM

#if ucodeopt_RVC == 1 && ucodeopt_HAS_MINSTRET == 1 && ucodeopt_HAS_EBR_MINSTRET == 1
#define LASTINCH_REMOVECOLUMS 0
#define LASTINCH_CODE ""
#endif

//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _aFault   aFault,  " err   Load access fault. Faulting adr to mtval",       8,StdIncPc,      isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [2] Must be after [1]
#define _aFault_1 aFault_1,"       Q = 4",                                          0,-1,            isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aFault_2)
#define _aFault_2 aFault_2,"       Store 5 to mcause",                              0,-1,            isr_intoTrap | A_add1    | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//efine _LDAF_3   LDAF_3,  "       PC to mepc",                                     
//efine _JAL_3    JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             

/* Note. It is legal to read a byte from input devices. Seen from the
 * side of the input device, a word read access is performed.
 */                                                                                                                                                                 
//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _LB_0     LB_0    ,"LB     Load byte. q = rdadr=RS1+0fs",                   1,0x00,          nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr43a | u_cont         | n(LB_1    )  
#define _LB_1     LB_1    ,"       Read until q=mem[rs1+ofs) & ~3u]",               0,-1,            isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LB_2    )
#define _LB_2     LB_2    ,"       Repeat shr until shreg == 0 (0,8,16,24 times)",  2,-1,            isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LB_3    )  // [gg] Must be even ucodeadr
#define _LB_3     LB_3    ,"       q = ~mem[rs1+ofs]",                              0,-1,            isr_none     | A_invq    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(LB_4    )  
#define _LB_4     LB_4    ,"       q = (uint8_t) mem[rs1+Iimm]",                    0,-1,            isr_none     | A_nearAND | Wnn   | rFFFFFF7F | Qu   | sr_h  | u_cont         | n(LB_5    )  
#define _LB_5     LB_5    ,"       q = D^0xffffffff^q = D^0x80",                    0,-1,            isr_none     | A_nearXOR | Wnn   | rFFFFFF7F | Qu   | sr_h  | u_cont         | n(LB_6    )
#define _LB_6x    LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80",       0,-1,            isr_none|MLD | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
#define _LB_6m    LB_6    ,"       WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80",       8,DIVU_5,        isr_none|MLD | A_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIVU_5. Kluge to let add1 work in DIV instr
//                                                                                                                                                               
#define _aFaultd  aFaultd, " err   LB Load access fault. Faulting adr to mtval",    8,LB_2,          isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[hh] Must follow [gg]
//                                                                                                                                                               
#define _LBU_0    LBU_0,   "LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.",        1,0x80,          nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr43a | u_cont         | n(LBU_1)     
#define _LBU_1    LBU_1   ,"       Read until q=mem[(rs1+ofs) & ~3u]",              0,-1,            isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LBU_2)     
#define _LBU_2    LBU_2   ,"       Repeat shr until shreg = 0 (0, 8 or 16 times)",  2,-1,            isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LBU_3)    // [ii] Must be even ucodeadr
#define _LBU_3    LBU_3   ,"       Invert q. Prepare read mask",                    0,-1,            isr_none     | A_invq    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//efine _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                
//efine _StdIncPc StdIncPc,"       IncPC, OpFetch",                                 
//                                                                                                                                                                 
#define _aFaulte  aFaulte, " err   LBU Load access fault. Faulting adr to mtval",   8,LBU_2,         isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[jj] Must follow [ii]
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
//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _LW_0     LW_0,    "LW     Load word. Q=yy=rdadr=RS1+Iimm",                 1,0x40,          nxtSTB       | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | wordaligned    | n(LW_1)      
#define _LW_1     LW_1,    "       Read until d=mem[(rs1+ofs) & ~3u]",              2,-1,            isr_none     | A_passd   | WTRG  | rHorPC    | Qcndz| sr_h  | u_io_i         | n(StdIncPc)       // [aa] Just before [bb]
//                                                                                                                                                               
#define _LDAF_LW  LDAF_LW, " err   LD AlignFault. Faulting adr to mtval",           8,LW_1,          isr_none     | A_passq   | Wmtval| r00000000 | Qhld | sr_h  | u_cont         | n(LDAF_a)    
#define _LDAF_a   LDAF_a,  "       Extra cycle after error detected write mtval",   0,-1,            isr_none     | A_xx      | Wnn   | r00000000 | Qz   | sr_h  | u_cont         | n(LDAF_2)
#define _LDAF_2   LDAF_2,  "       Store 4 to mcause",                              0,-1,            isr_intoTrap | A_add4w   | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)    
#define _LDAF_3   LDAF_3,  "       PC to mepc",                                     0,-1,            isr_none     | A_passd   | Wmepc | rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)
//
#define _LHU_0    LHU_0,   "LHU    Load unsigned hword. Q = rdadr=RS1+Iimm",        1,0xa0,          nxtSTB       | A_addDQ   | Wyy   | Ralu      | Qu   | sr43a | hwordaligned   | n(LHU_1)     
#define _LHU_1    LHU_1,   "       Read until q=mem[(rs1+ofs) & ~3u]",              2,-1,            isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LHU_2 )    // Even ucodeadr
#define _LHU_2    LHU_2,   "       Repeat shr until shreg = 0 (0, 8 or 16 times)",  2,-1,            isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LHU_3 )    // [ee] Must be even ucodeadr
#define _LHU_3    LHU_3,   "       Invert q. Prepare read mask",                    5,-1,            isr_none     | A_invq    | Wnn   | r0000FFFF | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//
#define _LDAF_LHU LDAF_LHU," err   LD AlignFault. Faulting adr to mtval",           8,LHU_1,         isr_none     | A_passq   | Wmtval| r00000000 | Qhld | sr_h  | u_cont         | n(LDAF_a)    // [bb] Just after [aa]
//
#define _aFaultc  aFaultc, " err   LHU Load access fault. Faulting adr to mtval",   8,LHU_2,         isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[ff] Must follow [ee]
//                                                                                                                                                               
#define _LH_0     LH_0,    "LH     Load hword. Q = rdadr=RS1+Iimm.",                1,0x20,          nxtSTB       | A_addDQ   | Wyy   | Ralu      | Qu   | sr43a | hwordaligned   | n(LH_1)      
#define _LH_1     LH_1,    "       Read until q=mem[(rs1+ofs) & ~3u]",              2,-1,            isr_none     | A_passd   | Wnn   | rHorL     | Qs   | sr_h  | u_io_i | psa00 | n(LH_2)      // Even ucodeadr
#define _LH_2     LH_2,    "       Repeat shr until shreg = 0 (0, 8 or 16 times)",  2,-1,            isr_none     | A_passd   | Wnn   | r00000000 | Qshr | srDec | u_shrep        | n(LH_3)      // [cc] Must be even ucodeadr
#define _LH_3     LH_3,    "       q = ~mem[rs1+ofs]",                              0,-1,            isr_none     | A_invq    | Wnn   | r0000FFFF | Qu   | sr_h  | u_cont         | n(LH_4)      
#define _LH_4     LH_4,    "       q = (uint16_t) mem[rs1+Iimm]",                   0,-1,            isr_none     | A_nearAND | Wnn   | rFFFF7FFF | Qu   | sr_h  | u_cont         | n(LH_5)      
#define _LH_5     LH_5,    "       q = D^0xffffffff^q = D ^ 0x00008000",            0,-1,            isr_none     | A_nearXOR | Wnn   | rFFFF7FFF | Qu   | sr_h  | u_cont         | n(LB_6)      
//
#define _LDAF_LH  LDAF_LH, " err   LD AlignFault. Faulting adr to mtval",           8,LH_1,          isr_none     | A_passq   | Wmtval| r00000000 | Qhld | sr_h  | u_cont         | n(LDAF_a)    // [bb] Just after [aa]
//
#define _aFaultb  aFaultb, " err   LH Load access fault. Faulting adr to mtval",    8,LH_2,          isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aFault_1) // [[dd] Must follow [cc]
//
#define _BEQ      BEQ,     "BEQ    Conditional Branch. Offset to Ryy",              1,0x18,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BNE      BNE,     "BNE    Conditional Branch. Offset to Ryy",              1,0x38,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BLT      BLT,     "BLT    Conditional Branch. Offset to Ryy",              1,0x98,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )   
#define _BGE      BGE,     "BGE    Conditional Branch. Offset to Ryy",              1,0xb8,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BLTU     BLTU,    "BLTU   Conditional Branch. Offset to Ryy",              1,0xd8,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )  
#define _BGEU     BGEU,    "BGEU   Conditional Branch. Offset to Ryy",              1,0xf8,          isr_none     | A_passq   | Wyy   | RS2       | Qz   | sr_h  | u_cont         | n(condb_2 )
//
#define _x_condb_2  condb_2, "       ~RS2 in Q",                                      0,-1,            isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(condb_3 )  
#define _x_condb_3  condb_3, "       Calculate RS1+~RS2+1",                           0,-1,            isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(condb_4 )  
#define _x_condb_4  condb_4, "       Branch on condition",                            0,-1,            isr_none     | A_passd   | Wnn   | Ryy       | Qu   | sr_h  | usebcond       | n(condb_5 )  
#define _x_condb_5  condb_5, "       Branch not taken.",                              2,-1,            nxtSTB       | A_passq4  | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   )  /* Must be placed at even ucode adr. Goes to either Fetch or eFetch     */
#define _x_condb_5t condb_5t,"       Branch taken.",                                  8,condb_5,       nxtSTB       | A_addDQ   | Wpc   | Ralu      | Qu   | sr_h  | wordaligned    | n(BrOpFet )  /* Must be placed at the next ucode adr */

#define _r_condb_2  condb_2, "       ~RS2 in Q",                                      0,-1,	     isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(condb_3 )  
#define _r_condb_3  condb_3, "       Calculate RS1+~RS2+1",                           0,-1,	     isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(condb_4 )  // next Get back the offset
#define _r_condb_4  condb_4, "       Branch on condition",                            0,-1,	     isr_none     | A_passd   | Wnn   | Rjj       | Qu   | sr_h  | usebcond       | n(condb_5 )  // next get back PC for next consequtive instr
#define _r_condb_5  condb_5, "       Branch not taken.",                              2,-1,	     isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  /* Must be placed at even ucode adr. Goes to either Fetch or eFetch     */
#define _r_condb_5t condb_5t,"       Branch taken.",                                  8,condb_5,	     nxtSTB       | A_addDQ   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   ) 
//
//                                                                                      Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                      | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _ixBrOpFet  BrOpFet ,"NewOp2 Read until instruction latched",                   2,-1,            isr_none     | A_passd   | Wnn   | rHorTtime | Qcndz| sr_h  | u_io_i_latch   | n(Fetch2  )  /* Must be placed at even ucode adr     */ 
#define _ixBAlignEr BAlignEr," Err   Branch target instruction address misaligned",     8,BrOpFet,       isr_none     | A_xx      | Wnn   | Rpc       | Qx   | sr_h  | u_cont         | n(BAERR_1)   /* Must be placed at the next ucode adr */
#define _ixBAERR_1  BAERR_1, "       Faultadr to mtval. Prepare get offset",            0,-1,            isr_none     | A_passd   | Wmtval| Ryy       | Qz   | sr_h  | u_cont         | n(BAERR_2)   
#define _ixBAERR_2  BAERR_2, "       ~offset to Q. Prep read (origPC+offset)",          0,-1,            isr_none     | A_nearXOR | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(BAERR_3)   
#define _ixBAERR_3  BAERR_3, "       origPC to mepc. Prep read 0",                      0,-1,            isr_none     | A_add1    | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
#define _ixBAERR_4  BAERR_4, "       Store 0 to mcause. Prep get trap entry pont",      0,-1,            isr_intoTrap | A_passd   | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)   


//
//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _SUB_0    SUB_0,   "SUB    Subtraction",                                    1,0x0e,          isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SUB_1  )    
#define _SUB_1    SUB_1,   "       Q = ~RS2",                                       0,-1,            isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(LB_6   )    
//                                                                                  
#define _ANDI_0   ANDI_0,  "ANDI   And immediate. Q=~Iimm",                         1,0xe4,          isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(ANDI_1)    
#define _ANDI_1   ANDI_1,  "       rd = Iimm & RS1",                                0,-1,            isr_none     | A_nearAND | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//                                                                                                                                                               
#define _ORI_0    ORI_0,   "ORI    Or immediate. jj=~Iimm",                         1,0xc4,          isr_none     | A_invq    | Wjj   | RS1       | Qzh  | sr_h  | u_cont         | n(ORI_1)     
#define _ORI_1    ORI_1,   "       Q = RS1",                                        0,-1,            isr_none     | A_passd   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(ORI_2   )  
#define _ORI_2    ORI_2,   "       rd = Iimm | RS1",                                0,-1,            isr_none     | A_nearOR  | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//                                                                                                                                                               
#define _XORI_0   XORI_0,  "XORI   Xor immediate. Q=~Iimm",                         1,0x84,          isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(XORI_1)    
#define _XORI_1   XORI_1,  "       rd = Iimm ^ RS1",                                0,-1,            isr_none     | A_nearXOR | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//                                                                                                                                                               
#define _AND_0    AND_0,   "AND    And ",                                           1,0xec,          isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(AND_1)     
#define _AND_1    AND_1,   "       RS1^0xffffffff to Q",                            0,-1,            isr_none     | A_nearXOR | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(ANDI_1)    
//                                                                                                                                                               
#define _OR_0     OR_0,    "OR     or",                                             1,0xcc,          isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(OR_1)      
#define _OR_1     OR_1,    "       RS1^0xffffffff to jj",                           0,-1,            isr_none     | A_nearXOR | Wjj   | RS2       | Qzh  | sr_h  | u_cont         | n(OR_2)      
#define _OR_2     OR_2,    "       Q = rs2",                                        0,-1,            isr_none     | A_addDQ   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(ORI_2)     
//                                                                                                                                                               
#define _XOR_0    XOR_0,   "XOR    xor",                                            1,0x8c,          isr_none     | A_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(XOR_1)     
#define _XOR_1    XOR_1,   "       Q = RS1^0xFFFFFFFF",                             0,-1,            isr_none     | A_nearXOR | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(XORI_1)    
//                                                                                                                                                               
#define _SLTIU_0  SLTIU_0, "SLTIU  Set less than immediate (unsigned)",             1,0x64,          isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
#define _SLTIX_1  SLTIX_1, "       RS1 - imm / RS1 - RS2",                          0,-1,            isr_none     | A_add1    | Wnn   | r_xx      | Qz   | sr_h  | u_cont         | n(SLTIX_2)   
#define _SLTIX_2  SLTIX_2, "       Registered ALU flag to rd",                      0,-1,            isr_none     | A_passq_F | WTRG  | Rpc       | Qzh  | sr_h  | u_cont         | n(StdIncPc)  
//
#define _SLTI_0   SLTI_0,  "SLTI   Set less than immediate (signed)",               1,0x44,          isr_none     | A_invq    | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   
//
#define _SLT_0    SLT_0,   "SLT    Set less than (signed)",                         1,0x4c,          isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    
#define _SLTX_1   SLTX_1,  "       ~rs2 to Q",                                      0,-1,            isr_none     | A_nearXOR | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(SLTIX_1)   

#define _SLTU_0   SLTU_0,  "SLTU   Set less than (unsigned)",                       1,0x6c,          isr_none     | A_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(SLTX_1)    

// Have changed decode so I do not need 16 copies of _LUI_0, only 2
#define _LUI_0(x) _L ## x, "LUI    q = imm20",                                      1,x,             isr_none     | A_passq   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  
//                                                                                                                                                               
#define _ADDI_0   ADDI_0,  "ADDI   Add immediate. rd =RS1+Iimm (or joined)",        1,0x04,          isr_none     | A_addDQ   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  

#define _x_AUIPC_0(x) _L ## x,"AUIPC  q = imm20 (copy x/2)",                          1,x,             isr_none     | A_xx      | Wnn   | Rpc       | Qhld | sr_h  | u_cont         | n(ADDI_0)    
#define _r_AUIPC_0(x) _L ## x,"AUIPC  q = imm20+2 or imm20+4  (copy x/2)",             1,x,             isr_none     | A_xx      | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(ADDI_0)

//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _ADD_0    ADD_0,   "ADD    add     Addition Q = RS1",                       1,0x0c,          isr_none     | A_passd   | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(ADDI_0)    
//                                                                                                                                                               
//             In first cycle, must use A_passq because alignment is                                                                                             
//             determined from output of B. */                                                                                                                   
#define _x_JAL_0(x) _L ## x, "JAL    J-imm is in q. Branch on alignfault",            1,x,             isr_none     | A_passq   | Wnn   | Rpc       | Qhld | sr_h  | wordaligned    | n(JAL_1)
#define _x_JAL_1    JAL_1,   "       Target adr to yy",                               2,-1,            isr_none     | A_addDQ   | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)   /* Must be at even ucodeadr */  
#define _x_JAL_2    JAL_2,   "       Return address to TRG",                          2,-1,            isr_none     | A_add2or4 | WTRG  | Ryy       | Qx   | sr_h  | u_cont         | n(JAL_3)   /* [qq] JAL_2 must be at even ucodeadr */
#define _r_JAL_0(x) _L ## x, "JAL    J-imm is in q.",                                 1,x,             isr_none     | A_passq   | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(JAL_1)
#define _r_JAL_1    JAL_1,   "       Target adr to yy",                               0,-1,            isr_none     | A_addDQ   | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)   /* Must be at even ucodeadr */  
#define _r_JAL_2    JAL_2,   "       Return address to TRG",                          0,-1,            isr_none     | A_add2or4 | WTRG  | Ryy       | Qx   | sr_h  | u_cont         | n(JAL_3)   /* [qq] JAL_2 must be at even ucodeadr */
#define _JAL_3      JAL_3,   "       PC+imm/trap entrypt to PC. OpFetch",             0,-1,            nxtSTB       | A_passd   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)   /* Goes to either Fetch or eFetch */

//                                                                                                                                                               
//             The first of these instructions must be placed directly                                                                                           
//             following the JAL_1 instruction                                                                                                                   
#define _x_JAERR_1  JAERR_1, " Err   JAL target adr misaligned, store to mtval",      8,JAL_1,         isr_none     | A_addDQ   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(JAERR_2)   
#define _x_JAERR_2  JAERR_2, "       Store PC to mepc",                               0,-1,            isr_none     | A_passd   | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   
//
#define _JALR_0     JALR_0,  "JALR   jj=RS1+imm",                                     1,0x19,          isr_none     | A_addDQ   | Wjj   | r00000000 | Qz   | sr_h  | u_cont         | n(JALR_1)    
#define _JALR_1     JALR_1,  "       Q=1",                                            0,-1,            isr_none     | A_add1    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(JALR_2)    
#define _x_JALR_2   JALR_2,  "       Q = (RS1+imn) & 0xfffffffe",                     0,-1,            isr_none     | A_nearAND | Wyy   | Rpc       | Qz   | sr_h  | wordaligned    | n(JAL_2)
#define _r_JALR_2   JALR_2,  "       Q = (RS1+imn) & 0xfffffffe",                     0,-1,            isr_none     | A_nearAND | Wyy   | Rpc       | Qz   | sr_h  | u_cont         | n(JAL_2)
//                                                                                                                                                               
///* The next instruction must follow JAL_2 (no typo) */                                                                                                         
#define _x_JALRE1   JALRE1,  " err   Store pc to mepc",                               8,JAL_2,         isr_none     | A_passd   | Wmepc | Ryy       | Qx   | sr_h  | u_cont         | n(JALRE2)    // [rr] follows [qq]
#define _x_JALRE2   JALRE2,  "       mtval is target",                                0,-1,            isr_none     | A_passd   | Wmtval| r00000000 | Qx   | sr_h  | u_cont         | n(BAERR_4)   

//                                                                                                                                                               
#define _SLLI_0   SLLI_0,  "SLLI   Shift left immediate.",                          1,0x24,          isr_none     | A_passq   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SLLI_1)    
#define _SLLI_1   SLLI_1,  "       Register to shift to Q (and TRG for shift 0)",   0,-1,            isr_none     | A_passd   | WTRG  | rFFFFFFFF | Qu   | srDec | u_cont         | n(SLLI_2  )  
#define _SLLI_2   SLLI_2,  "       Repeat Q = Q+Q until shregcnt == 0",             0,-1,            isr_none     | A_shlq    | WTRG  | rFFFFFFFF | Qu   | srDec | u_shrep        | n(FENCE   )  
//                                                                                                                                                               
#define _SLL_0    SLL_0,   "SLL    Shift left",                                     1,0x2c,          isr_none     | A_xx      | Wnn   | RS2       | Qx   | sr_h  | u_cont         | n(SLL_1)     
#define _SLL_1    SLL_1,   "       Shiftamount was in low 5 bits of RS2",           0,-1,            isr_none     | A_passd   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SLLI_1)    
//                                                                                                                                                               
#define _SRxI_0   SRxI_0,  "SRxI   Shift Right immediate (both logic/arith here)",  1,0xa4,          isr_none     | A_passq   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SRxI_1  )  
#define _SRxI_1   SRxI_1,  "       Register to shift to Q",                         0,-1,            isr_none     | A_passd   | WTRG  | r00000000 | Qu   | srDec | u_cont | psa00 | n(SRxI_2)    
#define _SRxI_2   SRxI_2,  "       Repeat Q >>= 1 until shregcnt == 0",             0,-1,            isr_none     | A_passd   | WTRG  | r00000000 | Qshr | srDec | u_shrep        | n(FENCE )    
//                                                                                                                                                               
#define _SRx_0(x) _L ## x, "SRx    Shift Right (both SRL and SRA)",                 1,x,             isr_none     | A_xx      | Wnn   | RS2       | Qx   | sr_h  | u_cont         | n(SRx_1)     
#define _SRx_1    SRx_1,   "       Shiftamount in low 5 bits of RS2",               0,-1,            isr_none     | A_passd   | Wnn   | RS1       | Qx   | srImm | u_cont         | n(SRxI_1)    
//                                                                                                                                                               
#define _SW_0(x)  _L ## x, "SW     Store word. Q=wradr=RS1+Simm",                   1,x,             nxtSTB |nxtWE| A_addDQ   | Wnn   | RS2       | Qu   | sr_h  | wordaligned    | n(SW_1)      
#define _SW_1     SW_1,    "       Write d to a+k until accepted",                  2,-1,            isr_none     | A_passd   | WAQW  | RS2       | Qhld | sr_h  | u_io_o         | n(SW_2)      // [A] even ucode adr 
#define _SW_2     SW_2,    "       Prepare read PC",                                2,-1,            isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // [C] even ucode adr   
//
#define _SW_E1SWE SW_E1SWE,"       Store faulting address alignment to mtval",      8,SW_1,          isr_none     | A_passq   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(SW_E2)     // [B] directly following [A]
#define _SW_E2    SW_E2,   "       Store address that faulted",                     0,-1,            isr_none     | A_passd   | Wmepc | rFFFFFFFF | Qz   | sr_h  | u_cont         | n(SW_E3)     
#define _SW_E3    SW_E3,   "       Q = 3",                                          0,-1,            isr_none     | A_add4w   | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(SW_E4)     
#define _SW_E4    SW_E4,   "       Store 6 to mcause",                              0,-1,            isr_intoTrap | A_shlq    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)     // A comment I don't recall require this to be at an even ucodeadr see [what!]. Is it because we go into trap?
//                                                                                                                                                               
#define _aF_SW    aF_SW,   " err   SW/SH/SB access fault. Rest to set SEL_O=4'hf",  8,SW_2,          isr_none     | A_xx      | Wnn   | r_xx      | Qhld | sr_h  | u_cont         | n(aF_SW_1)   // [D] directly following [C]
#define _aF_SW_1  aF_SW_1, " err   SW Store access fault. Faulting adr to mtval",   0,-1,            isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(aF_SW_2)
#define _aF_SW_2  aF_SW_2, "       Q = 4",                                          0,-1,            isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(aF_SW_3)
#define _aF_SW_3  aF_SW_3, "       Store 7 to mcause",                              0,-1,            isr_intoTrap | A_add3w   | Wmcaus| Rpc       | Qx   | sr_h  | u_cont         | n(LDAF_3)
//
#define _SH_0(x)  _L ## x, "SH     Store halfword. jjw=wradr=RS1+Simm",             1,x,             isr_none     | A_addDQ   | Wjj   | RS2       | Qu   | sr43a | hwordaligned   | n(SH_1)      
#define _SH_1     SH_1,    "       Write d to Q and yy (for sh 0). Prep shift",     2,-1,            isr_none     | A_passd   | Wyy   | rFFFFFFFF | Qu   | srDec | u_cont         | n(SH_2)      
#define _SH_2     SH_2,    "       Repeat shl until shreg = 0 (0,8 or 24 times)",   0,-1,            isr_none     | A_shlq    | Wyy   | rFFFFFFFF | Qu   | srDec | u_shrep        | n(SH_3)      
#define _SH_3     SH_3,    "       Prepare get back address to use ",               0,-1,            isr_none     | A_passq   | Wnn   | Rjj       | Qz   | sr_h  | u_cont         | n(SH_4)      
#define _SH_4     SH_4,    "       Address back to Q. Prepare get item to write",   0,-1,            nxtSTB |nxtWE| A_passd   | Whp   | Ryy       | Qu   | sr_h  | u_cont         | n(SH_5)      
#define _SH_5     SH_5,    "       Write d to a+k until accepted",                  0,-1,            isr_none     | A_passd   | WAQh  | Ryy       | Qhld | sr_h  | u_io_o         | n(SW_2)
//
#define _SW_E1SWH SW_E1SWH,"       Store faulting address alignment to mtval",      8,SH_1,          isr_none     | A_passq   | Wmtval| Rpc       | Qx   | sr_h  | u_cont         | n(SW_E2)     // [B] directly following [A]
//                                                                                                                                                               
//
//
//#if ucodeopt_MULDIV
#define _MULHU_0  MULHU_0, "MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--",  1,0x6d,          isr_none     |MA_passd   | Wyy   | RS2       | Qz   | srDec | u_cont         | n(MULHU_1)
#define _MULHU_1  MULHU_1, "       rM<=RS2,  Rjj<=Q=0. next read RS1. ",            0,-1,            isr_none|MLD |MA_passq   | Wjj   | RS1       | Qz   | sr_h  | u_cont         | n(MULHU_2)   // sa14 == 0 so this loads rM. Also clears rF
#define _MULHU_2  MULHU_2, "       Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar",        2,-1,            isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | srDec | u_cont | psa00 | n(MULHU_3)   // (Must be even ucode adr). Either ADD or PASSQ
#define _MULHU_3  MULHU_3, "       Shift Q and rM. Prepare read rs1",               0,-1,            isr_none|MSL |MA_passd   | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(MULHU_2)   // xxxxxxxxxxxxxxxxxxxxxxxxxxxx document me. Loops
#define _MULHU_4  MULHU_4, "       Prepare read Rjj.",                              8,MULHU_2,       isr_none     |MA_nearXOR | Wnn   | Rjj       | Qhld | sr_h  | u_cont         | n(MULHU_5)   // Must follow MULHU_2
#define _MULHU_5  MULHU_5, "       Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy",       0,-1,            isr_none     |MA_addDQm  | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(MULHU_6)
#define _MULHU_6  MULHU_6, "       Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar",   0,-1,            isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | sr_h  | u_cont | psa00 | n(MULHU_7)
#define _MULHU_7  MULHU_7, "       Last shift.",                                    0,-1,            isr_none|MSL |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)   // Investigate - MSL will work as a MLD here, I don't think it matters but it is confusing
                                                                                                  
#define _MULHSU_0 MULHSU_0,"MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--",    1,0x4d,          isr_none     |MA_passd   | Wyy   | RS2       | Qz   | srDec | u_cont         | n(MULHU_1)
                                                                                                  
#define _MULH_0   MULH_0,  "MULH   Store rs1 to Q. Prep read 0, shcnt--",           1,0x2d,          isr_none     |MA_passd   | Wnn   | r00000000 | Qu   | srDec | u_cont         | n(MULH_1)
#define _MULH_1   MULH_1,  "       Store ~rs1 to Ryy. Prep construct 1.",           0,-1,            isr_none     |MA_nearXOR | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(MULH_2)
#define _MULH_2   MULH_2,  "       Store 1 to Rjj. next read rs2, Q=0",             0,-1,            isr_none     |MA_add1    | Wjj   | RS2       | Qzh  | sr_h  | u_cont         | n(MULH_3)
#define _MULH_3   MULH_3,  "       rM<=RS2, Q = 0. next read RS1. Join.",           0,-1,            isr_none|MLD |MA_xx      | Wnn   | RS1       | Qz   | sr_h  | u_cont         | n(MULHU_2)
                                                                                                  
#define _MUL_0    MUL_0,   "MUL    Store rs1 tp rM. Next read rs2. Q clear",        1,0x0d,          isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | sr_h  | u_cont         | n(MUL_1)
#define _MUL_1    MUL_1,   "       Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar",        2,-1,            isr_none     |MA_addDQm  | Wnn   | r00000000 | Qu   | srDec | u_cont | psa00 | n(MUL_2)     // Must be even ucode adr
#define _MUL_2    MUL_2,   "       Shift Q and rM. Prepare read rs2",               0,-1,            isr_none|MSL |MA_passd   | Wnn   | RS2       | Qu   | sr_h  | u_cont         | n(MUL_1)     // Loops
#define _MUL_3    MUL_3,   "       Transfer rM to rDee",                            8,MUL_1,         isr_none|MCLR|MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont | psa00 | n(ANDI_1)    // Must follow MUL_1
                                                                                                                                                                               
#define _DIVU_0   DIVU_0,  "DIVU   Store rs1 to rM. Q=0. Prepare invert rs2",       1,0xad,          isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | srDec | u_cont         | n(DIVU_1)    
#define _DIVU_1   DIVU_1,  "       Store inverted rs2 to yy. Prepare shift",        0,-1,            isr_none     |MA_nearXOR | Wyy   | rFFFFFFFF | Qzh  | sr_h  | u_cont         | n(DIVU_2)    
#define _DIVU_2   DIVU_2,  "       Shift (Q,M) left. Prepare unsigned sub",         0,-1,            isr_none|MSL |MA_shlqdiv | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIVU_3)    // loops because ceM set and rlastshift clear
#define _DIVU_3   DIVU_3,  "       Conditionally subtract rs2. Update M[0]",        2,-1,            isr_none|CH  |MA_usub    | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont         | n(DIVU_2)    // Must be even ucode adr
#define _DIVU_4   DIVU_4,  "       Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]", 8,DIVU_3,        isr_none|CH13|MA_usub    | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(DIVU_5)    // Must follow DIVU_3. 
#define _DIVU_5   DIVU_5,  "       Transfer rM to rDee",                            2,-1,            isr_none|MCLR|MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont | psa00 | n(ANDI_1)    // Must be even ucode adr
//efine _DIVU_6   DIVU_6,  "       Write Q to destination for REMU",                8,DIVU_5,        isr_none     |MA_add1    | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIVU_5  Is covered by _LB_6 which usethe same calculations
                                                                                                  
#define _REMU_0   REMU_0,  "REMU   Store dividend to rM. Prepare read divisor.Q=0", 1,0xed,          isr_none|MLD |MA_xx      | Wnn   | RS2       | Qz   | srDec | u_cont         | n(DIVU_1)
/* First make abs(RS1) (dividend) and                                                             
 * ~abs(RS1) (divisor), if RS1 >= 0, ~abs(RS1) == ~RS1                                            
 *                      if RS1 < 0,  ~abs(RS1) = ~(~RS1+1)                                        
 */                                                                                               
#define _REM_0    REM_0,   "REM    Branch on sign dividend RS1",                    1,0xcd,          isr_none     |MA_passd   | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont | bsign | n(DIV_1)
                                                                                                  
#define _DIV_0    DIV_0,   "DIV    Branch on sign dividend RS1",                    1,0x8d,          isr_none     |MA_passd   | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont | bsign | n(DIV_1)
#define _DIV_1    DIV_1,   "       jj=abs(RS1). Next handle divisor",               2,-1,            isr_none     |MA_nearXOR | Wjj   | RS2       | Qz   | sr_h  | u_cont         | n(DIV_3)     // Even ucode adr
#define _DIV_2    DIV_2,   "       Dividend negative, make RS1-1",                  8,DIV_1,         isr_none     |MA_addDQ   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(DIV_1)     // Must follow DIV_1
#define _DIV_3    DIV_3,   "       Branch on sign divisor RS2",                     0,-1,            isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont | bsign | n(DIV_4)
#define _DIV_4    DIV_4,   "       ~abs(divisor) to yy",                            2,-1,            isr_none     |MA_passq   | Wyy   | Rjj       | Qz   | sr_h  | u_cont         | n(DIV_6)     // Even ucode adr
#define _DIV_5    DIV_5,   "       Kluge to let add1 work in DIV instr",            8,DIV_4,         isr_none|MLD |MA_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(DIV_3)     // Must follow DIV_4
#define _DIV_6    DIV_6,   "       Write M. Prepare shift",                         0,-1,            isr_none|MLD |MA_xx      | Wnn   | rFFFFFFFF | Qz   | sr_h  | u_cont         | n(DIV_7)
#define _DIV_7    DIV_7,   "       Shift (Q,M) left. Prepare unsigned sub",         0,-1,            isr_none|MSL |MA_shlqdiv | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIV_8)     // loops because ceM set and rlastshift clear
#define _DIV_8    DIV_8,   "       Conditionally subtract rs2. Update M[0]",        2,-1,            isr_none|CH  |MA_usub    | Wnn   | rFFFFFFFF | Qu   | srDec | u_cont         | n(DIV_7)     // Must be even ucode adr
#define _DIV_9    DIV_9,   "       Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]", 8,DIV_8,         isr_none|CH13|MA_usub    | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont         | n(DIV_A)     // Must follow DIV_8. 
                                                                                                  
/* rM == abs(rs1)/abs(rs2), must change sign if (RS1[31]^RS2[31]) && RS2 != 0                     
 * Q = abs(rs1) % abs(rs2), must cahnge sign if RS1 != 0                                          
*/                                                                                                
#define _DIV_A    DIV_A,   "       Transfer rM to rDee",                            2,-1,            isr_none|MCLR|MA_passd   | Wnn   | rFFFFFFFF | Qu   | sr_h  | u_cont | psa00 | n(DIV_C)     // Must be even ucode adr  PROBLEM M_CLR
#define _DIV_B    DIV_B,   "       REM = Q to yy",                                  8,DIV_A,         isr_none     |MA_passq   | Wyy   | RS1       | Qz   | sr_h  | u_cont         | n(DIV_10)    // Must follow DIV_A

#define _DIV_C    DIV_C,   "       rM to yy. Q=ffffffff",                           0,-1,            isr_none     |MA_passd   | Wyy   | RS2       | Qhld | sr_h  | u_cont         | n(DIV_e)     //
#define _DIV_e    DIV_e,   "       Calc carry of RS2+0xFFFFFFFF",                   0,-1,            isr_none     |MA_iszero  | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(DIV_D)     //
#define _DIV_D    DIV_D,   "       Is RS2 == 0?",                                   18,-1,           isr_none     |MA_passd   | Wnn   | RS2       | Qu   | sr_h  | usebcond       | n(DIV_E)     // Even ucode adr due to DIV_C
#define _DIV_E    DIV_E,   "       RS2 != 0. Check signs",                          2,-1,            isr_none     |MA_xx      | Wnn   | RS1       | Qx   | sr_h  | u_cont | bsign | n(DIV_10)    // Even ucode adr
#define _DIV_F    DIV_F,   "       RS2 == 0, return 0xffffffff",                    8,DIV_E,         isr_none     |MA_passq   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIV_E

#define _DIV_10   DIV_10,  "       RS2 > 0. Branch on sign of RS1",                 2,-1,            isr_none     |MA_passd   | Wnn   | Ryy       | Qz   | sr_h  | u_cont | bsign | n(DIV_12)    // Even ucode adr
#define _DIV_11   DIV_11,  "       RS2 < 0. Branch on sign of RS1",                 8,DIV_10,        isr_none     |MA_passd   | Wnn   | Ryy       | Qz   | sr_h  | u_cont | bsign | n(DIV_14)    // Must follow DIV_10

#define _DIV_12   DIV_12,  "       RS2 > 0, RS1 >= 0, yy is true result",           2,-1,            isr_none     |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Even ucode adr
#define _DIV_13   DIV_13,  "       RS2 > 0, RS1 < 0, change sign yy",               8,DIV_12,        isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(LB_6)      // DIVU_6 is the same as LB_6 // Must follow DIV_12

#define _DIV_14   DIV_14,  "       RS2 < 0, RS1 >= 0, change sign yy",              2,-1,            isr_none     |MA_nearXOR | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(LB_6)      // DIVU_6 is the same as LB_6 // Even ucode adr
#define _DIV_15   DIV_15,  "       RS2 < 0, RS1 < 0, yy is true result",            8,DIV_14,        isr_none     |MA_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)  // Must follow DIV_14   


//   Informative, use of MUL/DIV places when no MUL/DIV                Used to flag illegals in decode
//#define _MULHU_1  _ILL0b(MULHU_1  )                               // x
//#define _MULHU_2  _ILLm0(MULHU_2  ) // Paired with MULHU_4        // x
//#define _MULHU_3  _ILLm0(MULHU_3  )                               // x
//#define _MULHU_4  _ILLm0(MULHU_4  )                               // x
//#define _MULHU_5  _ILL0b(MULHU_5  )                               // x
//#define _MULHU_6  _ILLm0(MULHU_6  )                               // x
//#define _MULHU_7  _ILLm0(MULHU_7  )                               // x
//#define _MULHSU_0 _Mentry(MULHSU_0)                               // x
//#define _MULH_0   _LUI_0(0x2d)                                    // without MUL/DIV this entry is LUI
//#define _MULH_1   _ILLm0(MULH_1   )                               // x
//#define _MULH_2   _ILLm0(MULH_2   )                               // x
//#define _MULH_3   _ILLm0(MULH_3   )                               // x
//#define _MUL_0    _LUI_0(0x0d)                                    // without MUL/DIV this entry is LUI
//#define _MUL_1    _ILLm0(MUL_1    ) // Paired with MUL_3          // x
//#define _MUL_2    _ILLm0(MUL_2    )                               // x
//#define _MUL_3    _ILLm0(MUL_3    )                               // x
//#define _DIVU_0   _Mentry(DIVU_0  )                               // x
//#define _DIVU_1   _ILLm0(DIVU_1   )                               // x
//#define _DIVU_2   _ILLm0(DIVU_2   )                               // x
//#define _DIVU_3   _ILLm0(DIVU_3   ) // Paired with DIVU_4         // x
//#define _DIVU_4   _ILLm0(DIVU_4   )                               // x
//#define _DIVU_5   _ILLmp(DIVU_5   ) // Paired with LB_6           // x
//#define _REMU_0   _Mentry(REMU_0  )                               // x
//#define _REM_0    _Mentry(REM_0   )                               // x
//#define _DIV_0    _Mentry(DIV_0   )                               // x
//#define _DIV_1    _ILLm0(DIV_1    ) // Paired with DIV_2          // x
//#define _DIV_2    _ILLm0(DIV_2    )                               // x
//#define _DIV_3    _ILLm0(DIV_3    )                               // x
//#define _DIV_4    _ILLm0(DIV_4    ) // Paired with DIV_5          // x
//#define _DIV_5    _ILLm0(DIV_5    )                               // x
//#define _DIV_6    _ILLm0(DIV_6    )                               // x
//#define _DIV_7    _ILLm0(DIV_7    )                               // x
//#define _DIV_8    _ILLm0(DIV_8    ) // Paired with DIV_9          // x
//#define _DIV_9    _ILLm0(DIV_9    )                               // x
//#define _DIV_A    _ILLm0(DIV_A    ) // Paired with DIV_B          // x
//#define _DIV_B    _ILLm0(DIV_B    )                               // x
//#define _DIV_C    _ILL0b(DIV_C    )                               // x
//#define _DIV_e    _ILLm0(DIV_e    )                               // x
//#define _DIV_D    _ILLm0(DIV_D    )                               // x
//#define _DIV_E    _ILLm0(DIV_E    ) // Paired with DIV_F          // x
//#define _DIV_F    _ILL0b(DIV_F    )                               // not used, but follows DIV_E
//#define _DIV_10   _ILLm0(DIV_10   ) // Paired with DIV_11         // x
//#define _DIV_11   _ILL0b(DIV_11   )                               // not used, but follows DIV_10
//#define _DIV_12   _ILLm0(DIV_12   ) // Paired with DIV_13         // x
//#define _DIV_13   _ILL0b(DIV_13   )                               // not used, but follows DIV_12
//#define _DIV_14   _ILLm0(DIV_14   ) // Paired with DIV_15         // x
//#define _DIV_15   _ILL0b(DIV_15   )                               // x
//#endif


//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _SB_0(x)  _L ## x, "SB     Store byte. wjj=wradr=RS1+Simm",                 1,x,             isr_none     | A_addDQ   | Wjj   | RS2       | Qu   | sr43a | u_cont         | n(SB_1)      
#define _SB_1     SB_1,    "       Write d to Q and yy (for sh 0). Prep shift",     0,-1,            isr_none     | A_passd   | Wyy   | rFFFFFFFF | Qu   | srDec | u_cont         | n(SB_2)      
#define _SB_2     SB_2,    "       Repeat shl until shreg = 0 (0,8,16 or 24 times)",0,-1,            isr_none     | A_shlq    | Wyy   | rFFFFFFFF | Qu   | srDec | u_shrep        | n(SB_3)      
#define _SB_3     SB_3,    "       Prepare get back address to use ",               0,-1,            isr_none     | A_passq   | Wnn   | Rjj       | Qz   | sr_h  | u_cont         | n(SB_4)      
#define _SB_4     SB_4,    "       Address back to Q. Prepare get item to write",   0,-1,            nxtSTB |nxtWE| A_passd   | Wbp   | Ryy       | Qu   | sr_h  | u_cont         | n(SB_5)      
#define _SB_5     SB_5,    "       Write d to a+k until accepted",                  0,-1,            isr_none     | A_passd   | WAQb  | Ryy       | Qhld | sr_h  | u_io_o         | n(SW_2)     

// Before RVC we had this. But when RVC is included, we can not read the offending
// instruction from RAM with certainty, it may be unaligned. Luckily the spec say
// "The mtval register can optionally also be used to return the faulting instruction bits on an illegal
//  instruction exception (mepc points to the faulting instruction in memory).
//  If this feature is not provided, then mtval is set to zero on an illegal instruction fault.""
// (Section 3.1.17)
#define _ILL_0(x) _L ## x, "Illegal instruction seen (at illegal entrypt)",         4,-1,            isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )     
#define _ILL0b(x) _L ## x, "Illegal instruction seen",                              0,-1,            isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )     

#define _ILLe     ILLe,    "Illegal",                                               1,0xfe,          isr_none     | A_xx      | Wnn   | Rpc       | Qx   | sr_h  | u_cont         | n(ILL_1)     
#define _ILL_1    ILL_1,   "       Store PC to mepc",                               0,-1,            isr_none     | A_passd   | Wmepc | r00000000 | Qx   | sr_h  | u_cont         | n(ILL_2)     
#define _ILL_2    ILL_2,   "       Store 0 to mtval",                               0,-1,            isr_none     | A_passd   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(ILL_3)
#define _ILL_3    ILL_3,   "       Q = 1",                                          0,-1,            isr_none     | A_a1      | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ILL_4)     
#define _ILL_4    ILL_4,   "       Store 2 to mcause",                              0,-1,            isr_intoTrap | A_add1    | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3) 
//                                                                                                                                                               
#define _FENCE(x) _L ## x, "FENCE  Prepare read PC (FENCE/FENCE.I)",                1,x,             isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)
#define FENCE _L0x03 // To continue ucode at FENCE
//
#define _ECAL_BRK ECAL_BRK,"ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI",   1,0x1c,          isr_none     | A_passq   | Wnn   | rFFFFFFFF | Qhld | sr_h  | hwordaligned   | n(ECAL_RET)
#define _ECAL_RET ECAL_RET,"ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET",           2,-1,            isr_none     | A_passq   | Wnn   | rFFFFFFFF | Qhld | sr_h  | wordaligned    | n(ECALL_1) /* Must be at even ucode adr */
#define _ECALL_1  ECALL_1, "ECALL  Verify Imm==0x000",                              2,-1,            isr_none     | A_add1    | Wnn   | Rpc       | Qu   | sr_h  | u_cont         | n(ECALL_2) /* Must be at even ucode adr */
#define _ECALL_2  ECALL_2, "       mepc = pc, prep store 0 to mtval",               0,-1,            isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | usebcond       | n(ECALL_3) 
#define _ECALL_3  ECALL_3, "       mtval = 0, now start the chore of 11 to mcause", 8,eILL0c,        isr_none     | A_passq   | Wmtval| r00000000 | Qz   | sr_h  | u_cont         | n(ECALL_4) /* Must be at odd ucode adr following a _ILL_0() */
#define _ECALL_4  ECALL_4, "       Q = 4",                                          0,-1,            isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_5)   
#define _ECALL_5  ECALL_5, "       Q = 8",                                          0,-1,            isr_none     | A_add4w   | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(ECALL_6)   
#define _ECALL_6  ECALL_6, "       mcause = 11",                                    0,-1,            isr_intoTrap | A_add3w   | Wmcaus| rmtvec    | Qx   | sr_h  | u_cont         | n(JAL_3)   // A comment I don't recall say this must be at even adr [what2]
                                                                                                                                                               
#define _eILL0c   eILL0c,  "Illegal instruction seen",                              2,-1,            isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceeded _ECALL_3 */

#define _EBRKWFI1 EBRKWFI1,"EBREAK/WFI1 Prepare select EBREAK or WFI",              8,ECAL_RET,      isr_none     | A_addDQ   | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(EBRKWFI2) /* Must follow _ECAL_RET */
#define _EBRKWFI2 EBRKWFI2,"EBREAK/WFI2 Select EBREAK or WFI",                      0,-1,            isr_none     | A_invq    | Wjj   | r000000FF | Qz   | sr_h  | usebcond       | n(EBREAK_1)
#define _EBREAK_1 EBREAK_1,"EBREAK mepc = pc, store 0 to mtval",                    8,WFI_1,         isr_none     | A_passq   | Wmtval| Rpc       | Qz   | sr_h  | u_cont         | n(EBREAK_2) /* Must be at odd ucode adr */
#define _EBREAK_2 EBREAK_2,"       pc to mepc",                                     0,-1,            isr_none     | A_passd   | Wmepc | r00000000 | Qz   | sr_h  | u_cont         | n(ECALL_6)
//
#define _WFI_1    WFI_1,   "WFI    To check offset",                                2,-1,            isr_none     | A_add4w   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(WFI_2   ) /* This preceeds EBREAK_1  */
#define _WFI_2    WFI_2,   "       Check offset",                                   0,-1,            isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(WFI_3   )
#define _WFI_3    WFI_3,   "       More check offset",                              0,-1,            isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(WFI_4   )
#define _WFI_4    WFI_4,   "       Prepare read PC",                                0,-1,            isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | usebcond       | n(WFI_5   )
#define _WFI_5    WFI_5,   "       IncPC, OpFetch",                                 8,eILL0a,        nxtSTB       | A_add4w   | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch   ) /* Must follow eILL0a.  */
//
#define _eILL0a   eILL0a,  "Illegal instruction seen",                              2,-1,            isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceede  _WFI_5 */
//
#define _MRET_1   MRET_1,  "MRET   First save Imm, start build constant for check", 8,ECALL_1,       isr_none     | A_passq   | Wjj   | r000000FF | Qz   | sr_h  | u_cont         | n(MRET_2)   /* Must follow _ECALL_1 */
#define _MRET_2   MRET_2,  "       0xff+3 = 0x102",                                 0,-1,            isr_none     | A_add3w   | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(MRET_3)
#define _MRET_3   MRET_3,  "       0x102 + 0xff + 1 = 0x202",                       0,-1,            isr_none     | A_add1    | Wnn   | r000000FF | Qu   | sr_h  | u_cont         | n(MRET_4)
#define _MRET_4   MRET_4,  "       0x202 + 0xff + 1 = 0x302",                       0,-1,            isr_none     | A_add1    | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(MRET_5)
#define _MRET_5   MRET_5,  "       ~302",                                           0,-1,            isr_none     | A_invq    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(MRET_6)
#define _MRET_6   MRET_6,  "       ~302 + origImm + 1 for branch decision",         0,-1,            isr_none     | A_add1    | Wnn   | r_xx      | Qu   | sr_h  | u_cont         | n(MRET_7)
#define _MRET_7   MRET_7,  "       Prepare emulation entry point 0x104",            0,-1,            isr_none     | A_xx      | Wnn   | r000000FF | Qz   | sr_h  | usebcond       | n(MRET_8)  
#define _MRET_8   MRET_8,  "       Prep +4",                                        8,eILL0b,        isr_none     | A_add1    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(StdIncPc) /* Must be at odd ucode adr following a _ILL_0()*/
//
#define _eILL0b   eILL0b,  "Illegal instruction seen",                              2,-1,            isr_none     | A_xx      | Wnn   | r_xx      | Qx   | sr_h  | u_cont         | n(ILLe )    /* Must preceeded _MRET_8 */
//
#define _CSRRW_0  CSRRW_0, "CSRRW  Decoded CSR adr in yy",                          1,0x3c,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRW_1  CSRRW_1, "       Construct PC storage adr",                       0,-1,            isr_none     | A_add1    | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(CSRRW_2)   
#define _CSRRW_2  CSRRW_2, "       Write PC to 0x100 start Prep emulation entrypt", 0,-1,            isr_intoCSR  | A_passd   | WAQW  | r00000000 | Qhld | sr_h  | u_cont         | n(CSRRW_3)   
#define _CSRRW_3  CSRRW_3, "       Prep emulation entrypt 0x108, here Q to 0x104",  0,-1,            isr_none     | A_add4    | Wnn   | r00000000 | Qu   | sr_h  | u_cont         | n(CSRRW_4)
#define _CSRRW_4  CSRRW_4, "       IncPC, OpFetch, but force +4",                   0,-1,            nxtSTB       | A_add4    | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)     // Cleanup once verified
//                                                                                                                                                               
#define _CSRRS_0  CSRRS_0, "CSRRS  Decoded CSR adr in yy",                          1,0x5c,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRC_0  CSRRC_0, "CSRRC  Decoded CSR adr in yy",                          1,0x7c,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRWI_0 CSRRWI_0,"CSRRWI Decoded CSR adr in yy",                          1,0xbc,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRSI_0 CSRRSI_0,"CSRRSI Decoded CSR adr in yy",                          1,0xdc,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   
#define _CSRRCI_0 CSRRCI_0,"CSRRCI Decoded CSR adr in yy",                          1,0xfc,          isr_none     | A_passq   | Wyy   | r000000FF | Qz   | sr_h  | u_cont         | n(CSRRW_1)   

#define _CSRRCI_1 _ILL0b(CSRRCI_1) // Rename
#define _CSRRS_1  _ILL0b(CSRRS_1) // Rename

//                                                                                  Fixed/even       ISR          | ALU         Write   intern      Reg    Shreg   Ucode            Next
//                                                                                  | Pair           action       | op          adr/en  read adr    op     op      operation        ucode
#define _x_IJ_0   IJ_0,    "IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0",            1,0x02,          isr_use_ij   | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | hwordaligned   | n(IJ_1)
#define _x_IJ_1   IJ_1,    "       Read until q=mem[(rs1+ofs)&~3u]",                2,-1,            isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJ_2)     /* Must be placed at even ucode adr */
#define _x_IJ_2   IJ_2,    "       Read word is to be masked with 2 lsb = 00",      0,-1,            isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJ_3)
#define _x_IJ_3   IJ_3,    "       Construct Q = 3",                                0,-1,            isr_none     | A_add3w   | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJ_4)
#define _x_IJ_4   IJ_4,    "       Mask and use as PC",                             0,-1,            nxtSTB       | A_nearAND | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)    /* Goes to either Fetch or eFetch */
                                                                                                                                                               
#define _x_IJT_1  IJT_1,   "       Exit CSR, enter trap",                           8,IJ_1,          isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJT_2)    /* Ajacent to IJ_1 */
#define _x_IJT_2  IJT_2,   "       Read word is to be masked with ~3u",             0,-1,            isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJT_3)
#define _x_IJT_3  IJT_3,   "       Construct Q = 3",                                0,-1,            isr_none     | A_add3w   | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJT_4)
#define _x_IJT_4  IJT_4,   "       Mask and store to mepc and Q for read of instr", 0,-1,            nxtSTB       | A_nearAND | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     // Probable error here, we do not any longer write to mtval because the instricton we wanted to read may be unaligned

#define _r_IJ_0   IJ_0,    "IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0",            1,0x02,          isr_use_ij   | A_addDQ   | Wnn   | Ralu      | Qu   | sr_h  | hwordaligned   | n(IJ_1)
#define _r_IJ_1   IJ_1,    "       Read until q=mem[(rs1+ofs)&~1u]",                2,-1,            isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJ_2)     /* Must be placed at even ucode adr */
#define _r_IJ_2   IJ_2,    "       Read word is to be masked with lsb = 0",         0,-1,            isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJ_3)
#define _r_IJ_3   IJ_3,    "       Construct Q = 1",                                0,-1,            isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJ_4)
#define _r_IJ_4   IJ_4,    "       Mask and use as PC",                             0,-1,            nxtSTB       | A_nearAND | Wpc   | Ralu      | Qeu  | sr_h  | u_cont         | n(Fetch)    /* Goes to either Fetch or eFetch */
                                                                                                                                                               
#define _r_IJT_1  IJT_1,   "       Exit CSR, enter trap",                           8,IJ_1,          isr_none     | A_passd   | Wnn   | rFFFFFFFF | Qs   | sr_h  | u_io_i         | n(IJT_2)    /* Ajacent to IJ_1 */
#define _r_IJT_2  IJT_2,   "       Read word is to be masked with ~1u",             0,-1,            isr_none     | A_passq   | Wyy   | r00000000 | Qz   | sr_h  | u_cont         | n(IJT_3)
#define _r_IJT_3  IJT_3,   "       Construct Q = 1",                                0,-1,            isr_none     | A_add1    | Wnn   | Ryy       | Qu   | sr_h  | u_cont         | n(IJT_4)
#define _r_IJT_4  IJT_4,   "       Mask and store to mepc and Q for read of instr", 0,-1,            nxtSTB       | A_nearAND | Wmepc | Ralu      | Qu   | sr_h  | u_cont         | n(ILL_2)     

//
#define _QINT_0   QINT_0,  "INT    Get current PC",                                 1,0xff,          isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(QINT_1)
#define _QINT_1   QINT_1,  "       Store pc to mepc.",                              0,-1,            isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(QINT_2)
#define _QINT_2   QINT_2,  "       mtval = 0.",                                     0,-1,            isr_intoTrap | A_passq   | Wmtval| NMIorInInt| Qz   | sr_h  | u_cont         | n(StdIncPc)
//
#define _NMI_0    NMI_0,   "NMI    Get current PC",                                 1,0xfd,          isr_none     | A_xx      | Wnn   | Rpc       | Qz   | sr_h  | u_cont         | n(NMI_1)
#define _NMI_1    NMI_1,   "       Store pc to mepc.",                              0,-1,            isr_none     | A_passd   | Wmepc | r_xx      | Qz   | sr_h  | u_cont         | n(NMI_2)
#define _NMI_2    NMI_2,   "       mtval = 0.",                                     0,-1,            isr_intoTrap | A_passq   | Wmtval| NMIorInInt| Qz   | sr_h  | u_cont         | n(JAL_3)

#if ucodeopt_MULDIV == 0
# if ucodeopt_RVC == 0
#  if ucodeopt_HAS_MINSTRET == 0
#   define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) i0
#  else
#   if ucodeopt_HAS_EBR_MINSTRET == 0
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) i1
#   else
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) i2
#   endif
#  endif
# else
#  if ucodeopt_HAS_MINSTRET == 0
#   define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) ic0
#  else
#   if ucodeopt_HAS_EBR_MINSTRET == 0
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) ic1
#   else
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) ic2
#   endif
#  endif
# endif
#else
# if ucodeopt_RVC == 0
#  if ucodeopt_HAS_MINSTRET == 0
#   define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) im0
#  else
#   if ucodeopt_HAS_EBR_MINSTRET == 0        
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) im1
#   else
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) im2
#   endif
#  endif
# else
#  if ucodeopt_HAS_MINSTRET == 0
#   define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) imc0
#  else
#   if ucodeopt_HAS_EBR_MINSTRET == 0        
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) imc1
#   else
#    define Z(i0,i1,i2,im0,im1,im2,ic0,ic1,ic2,imc0,imc1,imc2) imc2
#   endif
#  endif
# endif
#endif
//    Fixed Paired
//     spes spec                                                                                                                                                                                                                                                             reachability
//        |    |     free:50          free:49          free:50          free:4           free:3           free:4           free:57          free:54          free:55          free:10          free:9           free:9            |
//ORIGTAB |    |     rv32i0           rv32i1           rv32i2           rv32im0          rv32im1          rv32im2          rv32ic0          rv32ic1          rv32ic2          rv32imc0         rv32imc1         rv32imc2          |    MASK        INSTR     HITNR        // ENTRYPOINT               This comment is important, used by midgetv_ucode_linepermutate to find this data.
/* 00 */Y(1,   0, Z(_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ,_LB_0           ), 1, 0x0000707f, 0x00000003, (1<<22)    ) // LB                      
/* 01 */Y(0,   0, Z(_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ,_LB_1           ), 0, 0xffffffff, 0x00000000, 0          )                            
/* 02 */Y(1,   0, Z(_x_IJ_0         ,_x_IJ_0         ,_x_IJ_0         ,_x_IJ_0         ,_x_IJ_0         ,_x_IJ_0         ,_r_IJ_0         ,_r_IJ_0         ,_r_IJ_0         ,_r_IJ_0         ,_r_IJ_0         ,_r_IJ_0         ), 1, 0x0000707f, 0x0000000b, (1<<22)    ) // custom-0 instruction    
/* 03 */Y(1,   0, Z(_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ,_FENCE(0x03)    ), 1, 0x0000707f, 0x0000000f, (1<<22)    ) // FENCE                   
/* 04 */Y(1,   0, Z(_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ,_ADDI_0         ), 1, 0x0000707f, 0x00000013, (1<<22)    ) // ADDI                    
/* 05 */Y(1,   0, Z(_x_AUIPC_0(0x05),_x_AUIPC_0(0x05),_x_AUIPC_0(0x05),_x_AUIPC_0(0x05),_x_AUIPC_0(0x05),_x_AUIPC_0(0x05),_r_AUIPC_0(0x05),_r_AUIPC_0(0x05),_r_AUIPC_0(0x05),_r_AUIPC_0(0x05),_r_AUIPC_0(0x05),_r_AUIPC_0(0x05)), 1, 0x0000007f, 0x00000017, (1<<25)/2  ) // AUIPC 1/2               
/* 06 */Y(0,   0, Z(_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ,_LB_3           ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 07 */Y(0,   0, Z(_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ,_LB_4           ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 08 */Y(1,   0, Z(_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ,_SB_0(0x08)     ), 1, 0x0000707f, 0x00000023, (1<<22)/2  ) // SB 1/2                  
/* 09 */Y(0,   0, Z(_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ,_LB_5           ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 0a */Y(1,   0, Z(_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ,_SB_0(0x0a)     ), 1, 0x0000707f, 0x00000023, (1<<22)/2  ) // SB 2/2                  
/* 0b */Y(0,   0, Z(_x_JALR_2       ,_x_JALR_2       ,_x_JALR_2       ,_x_JALR_2       ,_x_JALR_2       ,_x_JALR_2       ,_r_JALR_2       ,_r_JALR_2       ,_r_JALR_2       ,_r_JALR_2       ,_r_JALR_2       ,_r_JALR_2       ), 0, 0xffffffff, 0x00000000, 0          ) //                           
/* 0c */Y(1,   0, Z(_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ,_ADD_0          ), 1, 0xfe00707f, 0x00000033, (1<<15)    ) // ADD                     
/* 0d */Y(1,   0, Z(_LUI_0(0x0d)    ,_LUI_0(0x0d)    ,_LUI_0(0x0d)    ,_MUL_0          ,_MUL_0          ,_MUL_0          ,_LUI_0(0x0d)    ,_LUI_0(0x0d)    ,_LUI_0(0x0d)    ,_MUL_0          ,_MUL_0          ,_MUL_0          ), 1, 0xfe00707f, 0x02000033, (1<<15)    ) // MUL/LUI when no MUL
/* 0e */Y(1,   0, Z(_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ,_SUB_0          ), 1, 0xfe00707f, 0x40000033, (1<<15)    ) // SUB
/* 0f */Y(1,   0, Z(_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ,_LUI_0(0x0f)    ), 1, 0x0000007f, 0x00000037, (1<<25)/2  ) // LUI 1/2                 
/* 10 */Y(0,   0, Z(_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ,_SUB_1          ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 11 */Y(0,   0, Z(_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ,_AND_1          ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 12 */Y(0,   0, Z(_unx12          ,_unx12          ,_unx12          ,_unx12          ,_unx12          ,_unx12          ,_ic0straddle    ,_ic1straddle    ,_ic2straddle    ,_ic2straddle    ,_ic2straddle    ,_ic2straddle    ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 13 */Y(0,   0, Z(_x_condb_2      ,_x_condb_2      ,_x_condb_2      ,_x_condb_2      ,_x_condb_2      ,_x_condb_2      ,_r_condb_2      ,_r_condb_2      ,_r_condb_2      ,_r_condb_2      ,_r_condb_2      ,_r_condb_2      ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 14 */Y(0,   0, Z(_x_condb_3      ,_x_condb_3      ,_x_condb_3      ,_x_condb_3      ,_x_condb_3      ,_x_condb_3      ,_r_condb_3      ,_r_condb_3      ,_r_condb_3      ,_r_condb_3      ,_r_condb_3      ,_r_condb_3      ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 15 */Y(0,   0, Z(_x_condb_4      ,_x_condb_4      ,_x_condb_4      ,_x_condb_4      ,_x_condb_4      ,_x_condb_4      ,_r_condb_4      ,_r_condb_4      ,_r_condb_4      ,_r_condb_4      ,_r_condb_4      ,_r_condb_4      ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 16 */Y(0,0x01, Z(_x_condb_5      ,_x_condb_5      ,_x_condb_5      ,_x_condb_5      ,_x_condb_5      ,_x_condb_5      ,_r_condb_5      ,_r_condb_5      ,_r_condb_5      ,_r_condb_5      ,_r_condb_5      ,_r_condb_5      ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 17 */Y(0,0x01, Z(_x_condb_5t     ,_x_condb_5t     ,_x_condb_5t     ,_x_condb_5t     ,_x_condb_5t     ,_x_condb_5t     ,_r_condb_5t     ,_r_condb_5t     ,_r_condb_5t     ,_r_condb_5t     ,_r_condb_5t     ,_r_condb_5t     ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 18 */Y(1,   0, Z(_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ,_BEQ            ), 1, 0x0000707f, 0x00000063, (1<<22)    ) // BEQ                     
/* 19 */Y(1,   0, Z(_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ,_JALR_0         ), 1, 0x0000707f, 0x00000067, (1<<22)    ) // JALR                    
/* 1a */Y(0,   0, Z(_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ,_ANDI_1         ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 1b */Y(1,   0, Z(_x_JAL_0(0x1b)  ,_x_JAL_0(0x1b)  ,_x_JAL_0(0x1b)  ,_x_JAL_0(0x1b)  ,_x_JAL_0(0x1b)  ,_x_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ,_r_JAL_0(0x1b)  ), 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 1/4                 
/* 1c */Y(1,   0, Z(_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ,_ECAL_BRK       ), 1, 0x0000707f, 0x00000073, (1<<12)    ) // ECALL/EBREAK/WFI/MRET   
/* 1d */Y(0,   0, Z(_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ,_ORI_2          ), 0, 0xffffffff, 0x00000000, 0          ) ///                           
/* 1e */Y(0,   0, Z(_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ,_aFault_1       ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 1f */Y(0,   0, Z(_x_IJ_2         ,_x_IJ_2         ,_x_IJ_2         ,_x_IJ_2         ,_x_IJ_2         ,_x_IJ_2         ,_r_IJ_2         ,_r_IJ_2         ,_r_IJ_2         ,_r_IJ_2         ,_r_IJ_2         ,_r_IJ_2         ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 20 */Y(1,   0, Z(_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ,_LH_0           ), 1, 0x0000707f, 0x00001003, (1<<22)    ) // LH                      
/* 21 */Y(0,   0, Z(_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ,_XORI_1         ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 22 */Y(0,   0, Z(_unx22          ,_unx22          ,_unx22          ,_MULHU_6        ,_MULHU_6        ,_MULHU_6        ,_unx22          ,_unx22          ,_unx22          ,_MULHU_6        ,_MULHU_6        ,_MULHU_6        ), 2, 0x00400000, 0x00000000, 0          ) // illegal at entry. Can get here from OpCode close to "ij"
/* 23 */Y(1,   0, Z(_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ,_FENCE(0x23)    ), 1, 0x0000707f, 0x0000100f, (1<<22)    ) // FENCEI                  
/* 24 */Y(1,   0, Z(_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ,_SLLI_0         ), 1, 0xfe00707f, 0x00001013, (1<<15)    ) // SLLI                    
/* 25 */Y(1,   0, Z(_x_AUIPC_0(0x25),_x_AUIPC_0(0x25),_x_AUIPC_0(0x25),_x_AUIPC_0(0x25),_x_AUIPC_0(0x25),_x_AUIPC_0(0x25),_r_AUIPC_0(0x25),_r_AUIPC_0(0x25),_r_AUIPC_0(0x25),_r_AUIPC_0(0x25),_r_AUIPC_0(0x25),_r_AUIPC_0(0x25)), 1, 0x0000007f, 0x00000017, (1<<25)/2  ) // AUIPC 2/2               
/* 26 */Y(0,   0, Z(_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ,_OR_1           ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 27 */Y(0,   0, Z(_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ,_OR_2           ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 28 */Y(1,   0, Z(_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ,_SH_0(0x28)     ), 1, 0x0000707f, 0x00001023, (1<<22)/2  ) // SH 1/2                  
/* 29 */Y(0,   0, Z(_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ,_XOR_1          ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 2a */Y(1,   0, Z(_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ,_SH_0(0x2a)     ), 1, 0x0000707f, 0x00001023, (1<<22)/2  ) // SH 2/2                  
/* 2b */Y(0,   0, Z(_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ,_SLTIX_1        ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 2c */Y(1,   0, Z(_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ,_SLL_0          ), 1, 0xfe00707f, 0x00001033, (1<<15)    ) // SLL                     
/* 2d */Y(1,   0, Z(_LUI_0(0x2d)    ,_LUI_0(0x2d)    ,_LUI_0(0x2d)    ,_MULH_0         ,_MULH_0         ,_MULH_0         ,_LUI_0(0x2d)    ,_LUI_0(0x2d)    ,_LUI_0(0x2d)    ,_MULH_0         ,_MULH_0         ,_MULH_0         ), 1, 0xfe00707f, 0x02001033, (1<<15)    ) // LUI/MULH
/* 2e */Y(0,   0, Z(_unx2e          ,_unx2e          ,_unx2e          ,_MULHU_1        ,_MULHU_1        ,_MULHU_1        ,_unx2e          ,_unx2e          ,_unx2e          ,_MULHU_1        ,_MULHU_1        ,_MULHU_1        ), 2, 0xffffffff, 0x00000000, 0          ) //
/* 2f */Y(1,   0, Z(_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ,_LUI_0(0x2f)    ), 1, 0x0000007f, 0x00000037, (1<<25)/2  ) // LUI 2/2                 
/* 30 */Y(0,   0, Z(_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ,_SLTIX_2        ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 31 */Y(0,   0, Z(_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ,_SLTX_1         ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 32 */Y(0,0x02, Z(_x_JAL_1        ,_x_JAL_1        ,_x_JAL_1        ,_x_JAL_1        ,_x_JAL_1        ,_x_JAL_1        ,_r_JAL_1        ,_r_JAL_1        ,_r_JAL_1        ,_r_JAL_1        ,_r_JAL_1        ,_r_JAL_1        ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 33 */Y(0,0x02, Z(_x_JAERR_1      ,_x_JAERR_1      ,_x_JAERR_1      ,_x_JAERR_1      ,_x_JAERR_1      ,_x_JAERR_1      ,_unx33          ,_unx33          ,_unx33          ,_unx33          ,_unx33          ,_unx33          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 34 */Y(0,   0, Z(_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ,_JAL_3          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 35 */Y(0,   0, Z(_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ,_SLLI_1         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 36 */Y(0,   0, Z(_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ,_SLLI_2         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 37 */Y(0,   0, Z(_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ,_ECALL_2        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 38 */Y(1,   0, Z(_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ,_BNE            ), 1, 0x0000707f, 0x00001063, (1<<22)    ) // BNE
/* 39 */Y(0,   0, Z(_unx39          ,_unx39          ,_unx39          ,_MULHU_7        ,_MULHU_7        ,_MULHU_7        ,_unx39          ,_unx39          ,_unx39          ,_MULHU_7        ,_MULHU_7        ,_MULHU_7        ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
/* 3a */Y(0,   0, Z( _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        , _SRxI_1        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 3b */Y(1,   0, Z(_x_JAL_0(0x3b)  ,_x_JAL_0(0x3b)  ,_x_JAL_0(0x3b)  ,_x_JAL_0(0x3b)  ,_x_JAL_0(0x3b)  ,_x_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ,_r_JAL_0(0x3b)  ), 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 2/4
/* 3c */Y(1,   0, Z(_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ,_CSRRW_0        ), 1, 0x0000707f, 0x00001073, (1<<22)    ) // CSRRW
/* 3d */Y(0,   0, Z(_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ,_SRxI_2         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 3e */Y(0,   0, Z(_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ,_SLL_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 3f */Y(0,   0, Z(_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ,_SRx_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 40 */Y(1,   0, Z(_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ,_LW_0           ), 1, 0x0000707f, 0x00002003, (1<<22)    ) // LW
/* 41 */Y(0,   0, Z(_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ,_JALR_1         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 42 */Y(0,0x03, Z(_unx42          ,_unx42          ,_unx42          ,_MULHU_2        ,_MULHU_2        ,_MULHU_2        ,_unx42          ,_unx42          ,_unx42          ,_MULHU_2        ,_MULHU_2        ,_MULHU_2        ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 43 */Y(0,0x03, Z(_unx43          ,_unx43          ,_unx43          ,_MULHU_4        ,_MULHU_4        ,_MULHU_4        ,_unx43          ,_unx43          ,_unx43          ,_MULHU_4        ,_MULHU_4        ,_MULHU_4        ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 44 */Y(1,   0, Z(_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ,_SLTI_0         ), 1, 0x0000707f, 0x00002013, (1<<22)    ) // SLTI
/* 45 */Y(0,   0, Z(_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ,_WFI_3          ), 0, 0xffffffff, 0x00000000, 0          ) // 
/* 46 */Y(0,   0, Z(_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ,_ILL_1          ), 0, 0xffffffff, 0x00000000, 0          ) // Potential problem, can this instructions be reached bv an OpCode decode?
/* 47 */Y(0,   0, Z(_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ,_ILL_2          ), 0, 0xffffffff, 0x00000000, 0          ) // Potential problem, can this instructions be reached bv an OpCode decode?
/* 48 */Y(1,   0, Z(_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ,_SW_0(0x48)     ), 1, 0x0000707f, 0x00002023, (1<<22)/2  ) // SW 1/2
/* 49 */Y(0,   0, Z(_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ,_CSRRW_1        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 4a */Y(1,   0, Z(_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ,_SW_0(0x4a)     ), 1, 0x0000707f, 0x00002023, (1<<22)/2  ) // SW 2/2
/* 4b */Y(0,   0, Z(_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ,_CSRRW_2        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 4c */Y(1,   0, Z(_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ,_SLT_0          ), 1, 0xfe00707f, 0x00002033, (1<<15)    ) // SLT
/* 4d */Y(1,   0, Z(_unx4d          ,_unx4d          ,_unx4d          ,_MULHSU_0       ,_MULHSU_0       ,_MULHSU_0       ,_unx4d          ,_unx4d          ,_unx4d          ,_MULHSU_0       ,_MULHSU_0       ,_MULHSU_0       ), 1, 0xfe00707f, 0x02002033, (1<<15)    ) // MULHSU
/* 4e */Y(0,0x04, Z(_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ,_eILL0b         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1 but forward progress ensured || Wants to relocate these
/* 4f */Y(0,0x04, Z(_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ,_MRET_8         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1. Will work as a strange JMP  || Wants to relocate these
/* 50 */Y(0,0x05, Z(_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ,_LW_1           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 51 */Y(0,0x05, Z(_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ,_LDAF_LW        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 52 */Y(0,0x06, Z(_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ,_LH_1           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 53 */Y(0,0x06, Z(_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ,_LDAF_LH        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 54 */Y(0,0x07, Z(_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ,_LH_2           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 55 */Y(0,0x07, Z(_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ,_aFaultb        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 56 */Y(0,   0, Z(_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ,_LH_4           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 57 */Y(0,   0, Z(_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ,_LH_5           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 58 */Y(0,0x08, Z(_unx58          ,_unx58          ,_unx58          ,_DIV_A          ,_DIV_A          ,_DIV_A          ,_unx58          ,_unx58          ,_unx58          ,_DIV_A          ,_DIV_A          ,_DIV_A          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "BEQ"
/* 59 */Y(0,0x08, Z(_unx59          ,_unx59          ,_unx59          ,_DIV_B          ,_DIV_B          ,_DIV_B          ,_unx59          ,_unx59          ,_unx59          ,_DIV_B          ,_DIV_B          ,_DIV_B          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
/* 5a */Y(0,   0, Z(_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ,_SB_1           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 5b */Y(1,   0, Z(_x_JAL_0(0x5b)  ,_x_JAL_0(0x5b)  ,_x_JAL_0(0x5b)  ,_x_JAL_0(0x5b)  ,_x_JAL_0(0x5b)  ,_x_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ,_r_JAL_0(0x5b)  ), 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 3/4
/* 5c */Y(1,   0, Z(_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ,_CSRRS_0        ), 1, 0x0000707f, 0x00002073, (1<<22)    ) // CSRRS
/* 5d */Y(0,   0, Z(_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ,_SB_2           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 5e */Y(0,0x09, Z(_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ,_LHU_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 5f */Y(0,0x09, Z(_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ,_LDAF_LHU       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 60 */Y(0,   0, Z(_unx60          ,_unx60          ,_unx60          ,_MULHU_3        ,_MULHU_3        ,_MULHU_3        ,_unx60          ,_unx60          ,_unx60          ,_MULHU_3        ,_MULHU_3        ,_MULHU_3        ), 2, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW"
/* 61 */Y(0,   0, Z(_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ,_EBRKWFI2       ), 0, 0xffffffff, 0x00000000, 0          ) // 
/* 62 */Y(0,0x0b, Z(_unx62          ,_unx62          ,_unx62          ,_DIV_8          ,_DIV_8          ,_DIV_8          ,_unx62          ,_unx62          ,_unx62          ,_DIV_8          ,_DIV_8          ,_DIV_8          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 63 */Y(0,0x0b, Z(_unx63          ,_unx63          ,_unx63          ,_DIV_9          ,_DIV_9          ,_DIV_9          ,_unx63          ,_unx63          ,_unx63          ,_DIV_9          ,_DIV_9          ,_DIV_9          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 64 */Y(1,   0, Z(_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ,_SLTIU_0        ), 1, 0x0000707f, 0x00003013, (1<<22)    ) // SLTIU
/* 65 */Y(0,   0, Z(_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ,_WFI_4          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 66 */Y(0,0x0c, Z(_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ,_SW_1           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 67 */Y(0,0x0c, Z(_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ,_SW_E1SWE       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 68 */Y(0,0x23, Z(_unx68          ,_unx68          ,_unx68          ,_DIV_12         ,_DIV_12         ,_DIV_12         ,_unx68          ,_unx68          ,_unx68          ,_DIV_12         ,_DIV_12         ,_DIV_12         ), 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW"
/* 69 */Y(0,0x23, Z(_unx69          ,_unx69          ,_unx69          ,_DIV_13         ,_DIV_13         ,_DIV_13         ,_unx69          ,_unx69          ,_unx69          ,_DIV_13         ,_DIV_13         ,_DIV_13         ), 0, 0xffffffff, 0x00000000, 0          ) //                                                         
/* 6a */Y(0,   0, Z(_unx6a          ,_unx6a          ,_unx6a          ,_MULH_1         ,_MULH_1         ,_MULH_1         ,_unx6a          ,_unx6a          ,_unx6a          ,_MULH_1         ,_MULH_1         ,_MULH_1         ), 2, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpClde close to "LD"
/* 6b */Y(0,   0, Z(_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ,_SB_4           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 6c */Y(1,   0, Z(_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ,_SLTU_0         ), 1, 0xfe00707f, 0x00003033, (1<<15)    ) // SLTU
/* 6d */Y(1,   0, Z(_unx6d          ,_unx6d          ,_unx6d          ,_MULHU_0        ,_MULHU_0        ,_MULHU_0        ,_unx6d          ,_unx6d          ,_unx6d          ,_MULHU_0        ,_MULHU_0        ,_MULHU_0        ), 1, 0xfe00707f, 0x02003033, (1<<15)    ) // MULHU
/* 6e */Y(0,   0, Z(_unx6e          ,_unx6e          ,_unx6e          ,_DIV_C          ,_DIV_C          ,_DIV_C          ,_unx6e          ,_unx6e          ,_unx6e          ,_DIV_C          ,_DIV_C          ,_DIV_C          ), 0, 0xffffffff, 0x00000000, 0          ) // 
/* 6f */Y(0,   0, Z(_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ,_MRET_6         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1
/* 70 */Y(0,0x0d, Z(_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ,_LHU_2          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 71 */Y(0,0x0d, Z(_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ,_aFaultc        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 72 */Y(0,   0, Z(_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ,_LBU_3          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 73 */Y(0,   0, Z(_ixBAERR_1      ,_ixBAERR_1      ,_ixBAERR_1      ,_ixBAERR_1      ,_ixBAERR_1      ,_ixBAERR_1      ,_unx73          ,_ic1unalignd    ,_ic2unalignd    ,_unx73          ,_ic1unalignd    ,_ic2unalignd    ), 0, 0xffffffff, 0x00000000, 0          ) //bro
/* 74 */Y(0,0x0e, Z(_ixBrOpFet      ,_ixBrOpFet      ,_ixBrOpFet      ,_ixBrOpFet      ,_ixBrOpFet      ,_ixBrOpFet      ,_unx74          ,_unx74          ,_unx74          ,_unx74          ,_unx74          ,_unx74          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 75 */Y(0,0x0e, Z(_ixBAlignEr     ,_ixBAlignEr     ,_ixBAlignEr     ,_ixBAlignEr     ,_ixBAlignEr     ,_ixBAlignEr     ,_unx75          ,_unx75          ,_unx75          ,_unx75          ,_unx75          ,_unx75          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 76 */Y(0,0x92, Z(_ixBAERR_2      ,_ixBAERR_2      ,_ixBAERR_2      ,_ixBAERR_2      ,_ixBAERR_2      ,_ixBAERR_2      ,_ic0Fetchu      ,_ic1Fetchu      ,_ic2Fetchu      ,_ic0Fetchu      ,_ic1Fetchu      ,_ic2Fetchu      ), 0, 0xffffffff, 0x00000000, 0          ) // // Paired due to use with RVC
/* 77 */Y(0,0x92, Z(_ixBAERR_3      ,_ixBAERR_3      ,_ixBAERR_3      ,_ixBAERR_3      ,_ixBAERR_3      ,_ixBAERR_3      ,_ic0eFetchu     ,_ic1eFetchu     ,_ic2eFetchu     ,_ic0eFetchu     ,_ic1eFetchu     ,_ic2eFetchu     ), 0, 0xffffffff, 0x00000000, 0          ) // // Paired due to use with RVC
/* 78 */Y(0,0x0f, Z(_unx78          ,_unx78          ,_unx78          ,_DIV_4          ,_DIV_4          ,_DIV_4          ,_unx78          ,_unx78          ,_unx78          ,_DIV_4          ,_DIV_4          ,_DIV_4          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "BEQ"
/* 79 */Y(0,0x0f, Z(_unx79          ,_unx79          ,_unx79          ,_DIV_5          ,_DIV_5          ,_DIV_5          ,_unx79          ,_unx79          ,_unx79          ,_DIV_5          ,_DIV_5          ,_DIV_5          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
/* 7a */Y(0,   0, Z(_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ,_SB_5           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 7b */Y(1,   0, Z(_x_JAL_0(0x7b)  ,_x_JAL_0(0x7b)  ,_x_JAL_0(0x7b)  ,_x_JAL_0(0x7b)  ,_x_JAL_0(0x7b)  ,_x_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ,_r_JAL_0(0x7b)  ), 1, 0x0000007f, 0x0000006f, (1<<25)/4  ) // JAL 4/4
/* 7c */Y(1,   0, Z(_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ,_CSRRC_0        ), 1, 0x0000707f, 0x00003073, (1<<22)    ) // CSRRC
/* 7d */Y(0,   0, Z(_ixBAERR_4      ,_ixBAERR_4      ,_ixBAERR_4      ,_ixBAERR_4      ,_ixBAERR_4      ,_ixBAERR_4      ,_unx7d          ,_unx7d          ,_unx7d          ,_unx7d          ,_unx7d          ,_unx7d          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 7e */Y(0,   0, Z(_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ,_NMI_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 7f */Y(0,   0, Z(_x_JALRE2       ,_x_JALRE2       ,_x_JALRE2       ,_x_JALRE2       ,_x_JALRE2       ,_x_JALRE2       ,_unx7f          ,_unx7f          ,_unx7f          ,_unx7f          ,_unx7f          ,_unx7f          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 80 */Y(1,   0, Z(_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ,_LBU_0          ), 1, 0x0000707f, 0x00004003, (1<<22)    ) // LBU
/* 81 */Y(0,   0, Z(_x_JAERR_2      ,_x_JAERR_2      ,_x_JAERR_2      ,_x_JAERR_2      ,_x_JAERR_2      ,_x_JAERR_2      ,_unx81          ,_unx81          ,_unx81          ,_unx81          ,_unx81          ,_unx81          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 82 */Y(0,0x10, Z(_unx82          ,_unx82          ,_unx82          ,_DIV_1          ,_DIV_1          ,_DIV_1          ,_unx82          ,_unx82          ,_unx82          ,_DIV_1          ,_DIV_1          ,_DIV_1          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* 83 */Y(0,0x10, Z(_unx83          ,_unx83          ,_unx83          ,_DIV_2          ,_DIV_2          ,_DIV_2          ,_unx83          ,_unx83          ,_unx83          ,_DIV_2          ,_DIV_2          ,_DIV_2          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* 84 */Y(1,   0, Z(_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ,_XORI_0         ), 1, 0x0000707f, 0x00004013, (1<<22)    ) // XORI
/* 85 */Y(0,   0, Z(_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ,_LBU_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 86 */Y(0,0x11, Z(_x_JAL_2        ,_x_JAL_2        ,_x_JAL_2        ,_x_JAL_2        ,_x_JAL_2        ,_x_JAL_2        ,_r_JAL_2        ,_r_JAL_2        ,_r_JAL_2        ,_r_JAL_2        ,_r_JAL_2        ,_r_JAL_2        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 87 */Y(0,0x11, Z(_x_JALRE1       ,_x_JALRE1       ,_x_JALRE1       ,_x_JALRE1       ,_x_JALRE1       ,_x_JALRE1       ,_unx87          ,_unx87          ,_unx87          ,_unx87          ,_unx87          ,_unx87          ), 0, 0xffffffff, 0x00000000, 0          ) // 
/* 88 */Y(0,0x12, Z(_unx88          ,_unx88          ,_unx88          ,_DIV_E          ,_DIV_E          ,_DIV_E          ,_unx88          ,_unx88          ,_unx88          ,_DIV_E          ,_DIV_E          ,_DIV_E          ), 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW"
/* 89 */Y(0,0x12, Z(_unx89          ,_unx89          ,_unx89          ,_DIV_F          ,_DIV_F          ,_DIV_F          ,_unx89          ,_unx89          ,_unx89          ,_DIV_F          ,_DIV_F          ,_DIV_F          ), 0, 0xffffffff, 0x00000000, 0          ) //                                                         
/* 8a */Y(0,0x15, Z(_unx8a          ,_unx8a          ,_unx8a          ,_DIVU_5         ,_DIVU_5         ,_DIVU_5         ,_unx8a          ,_unx8a          ,_unx8a          ,_DIVU_5         ,_DIVU_5         ,_DIVU_5         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW" 
/* 8b */Y(0,0x15, Z(_LB_6x          ,_LB_6x          ,_LB_6x          ,_LB_6m          ,_LB_6m          ,_LB_6m          ,_LB_6x          ,_LB_6x          ,_LB_6x          ,_LB_6m          ,_LB_6m          ,_LB_6m          ), 0, 0x00400000, 0x00000000, 0          ) //
/* 8c */Y(1,   0, Z(_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ,_XOR_0          ), 1, 0xfe00707f, 0x00004033, (1<<15)    ) // XOR
/* 8d */Y(1,   0, Z(_unx8d          ,_unx8d          ,_unx8d          ,_DIV_0          ,_DIV_0          ,_DIV_0          ,_unx8d          ,_unx8d          ,_unx8d          ,_DIV_0          ,_DIV_0          ,_DIV_0          ), 1, 0xfe00707f, 0x02004033, (1<<15)    ) // DIV
/* 8e */Y(0,   0, Z(_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ,_CSRRS_1        ), 0, 0xffffffff, 0x00000000, 0          ) // illegal. Must be even ucode adr due to use of add4       Reached with LAZY_DECODE==1
/* 8f */Y(0,   0, Z(_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ,_ILL_3          ), 0, 0xffffffff, 0x00000000, 0          ) //                                                          Reached with LAZY_DECODE==1
/* 90 */Y(0,   0, Z(_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ,_NMI_2          ), 0, 0xffffffff, 0x00000000, 0          ) //                         
/* 91 */Y(0,   0, Z(_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ,_LDAF_2         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 92 */Y(0,   0, Z(_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ,_LDAF_3         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 93 */Y(0,   0, Z(_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ,_SW_E2          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 94 */Y(0,   0, Z(_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ,_SW_E4          ), 0, 0xffffffff, 0x00000000, 0          ) // Must be even ucode adr due to use of add4 in SW_E3 [what!]
/* 95 */Y(0,   0, Z(_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ,_SW_E3          ), 0, 0xffffffff, 0x00000000, 0          ) // [a] probably pair with above
/* 96 */Y(0,0x13, Z(_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ,_SH_1           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 97 */Y(0,0x13, Z(_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ,_SW_E1SWH       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 98 */Y(1,   0, Z(_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ,_BLT            ), 1, 0x0000707f, 0x00004063, (1<<22)    ) // BLT
/* 99 */Y(0,   0, Z(_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ,_unx99          ), 2, 0x00400000, 0x00000000, 0          ) // illegal Can get here from OpCode close to "JALR". 
/* 9a */Y(0,   0, Z(_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ,_ECALL_6        ), 0, 0x00200000, 0x00000000, 0          ) // Must be even ucode adr for unknown reason [what2]
/* 9b */Y(0,   0, Z(_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ,_unx9b          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 9c */Y(0,0x14, Z(_unx9c          ,_unx9c          ,_unx9c          ,_DIV_10         ,_DIV_10         ,_DIV_10         ,_unx9c          ,_unx9c          ,_unx9c          ,_DIV_10         ,_DIV_10         ,_DIV_10         ), 2, 0x00001000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "EBREAK/ECALL/CSR"
/* 9d */Y(0,0x14, Z(_unx9d          ,_unx9d          ,_unx9d          ,_DIV_11         ,_DIV_11         ,_DIV_11         ,_unx9d          ,_unx9d          ,_unx9d          ,_DIV_11         ,_DIV_11         ,_DIV_11         ), 0, 0xffffffff, 0x00000000, 0          ) //                                                                       
/* 9e */Y(0,   0, Z(_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ,_SH_4           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* 9f */Y(0,   0, Z(_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ,_SH_5           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* a0 */Y(1,   0, Z(_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ,_LHU_0          ), 1, 0x0000707f, 0x00005003, (1<<22)    ) // LHU
/* a1 */Y(0,   0, Z(_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ,_ECALL_4        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* a2 */Y(0,0x0a, Z(_unxa2          ,_unxa2          ,_unxa2          ,_DIV_14         ,_DIV_14         ,_DIV_14         ,_unxa2          ,_unxa2          ,_unxa2          ,_DIV_14         ,_DIV_14         ,_DIV_14         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* a3 */Y(0,0x0a, Z(_unxa3          ,_unxa3          ,_unxa3          ,_DIV_15         ,_DIV_15         ,_DIV_15         ,_unxa3          ,_unxa3          ,_unxa3          ,_DIV_15         ,_DIV_15         ,_DIV_15         ), 0, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* a4 */Y(1,   0, Z(_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ,_SRxI_0         ), 1, 0xbe00707f, 0x00005013, (1<<15)*2  ) // SRLI/SRAI
/* a5 */Y(0,   0, Z(_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ,_MRET_3         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* a6 */Y(0,0x16, Z(_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ,_ECAL_RET       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* a7 */Y(0,0x16, Z(_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ,_EBRKWFI1       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* a8 */Y(0,   0, Z(_unxa8          ,_unxa8          ,_unxa8          ,_DIV_3          ,_DIV_3          ,_DIV_3          ,_unxa8          ,_unxa8          ,_unxa8          ,_DIV_3          ,_DIV_3          ,_DIV_3          ), 2, 0x00200000, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "SW". DIV_3 must be even ucode adr
/* a9 */Y(0,   0, Z(_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ,_ILL_4          ), 0, 0x00200000, 0x00000000, 0          ) //
/* aa */Y(0,   0, Z(_unxaa          ,_unxaa          ,_unxaa          ,_DIV_6          ,_DIV_6          ,_DIV_6          ,_unxaa          ,_unxaa          ,_unxaa          ,_DIV_6          ,_DIV_6          ,_DIV_6          ), 2, 0xffffffff, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "SW"
/* ab */Y(0,   0, Z(_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ,_EBREAK_2       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* ac */Y(1,   0, Z(_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ,_SRx_0(0xac)    ), 1, 0xfe00707f, 0x00005033, (1<<15)    ) // SRL
/* ad */Y(1,   0, Z(_unxad          ,_unxad          ,_unxad          ,_DIVU_0         ,_DIVU_0         ,_DIVU_0         ,_unxad          ,_unxad          ,_unxad          ,_DIVU_0         ,_DIVU_0         ,_DIVU_0         ), 1, 0xfe00707f, 0x02005033, (1<<15)    ) // DIVU
/* ae */Y(1,   0, Z(_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ,_SRx_0(0xae)    ), 1, 0xfe00707f, 0x40005033, (1<<15)    ) // SRA
/* af */Y(0,   0, Z(_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ,_MRET_4         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1. 
/* b0 */Y(0,   0, Z(_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ,_CSRRW_3        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b1 */Y(0,   0, Z(_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ,_aF_SW_3        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b2 */Y(0,   0, Z(_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ,_CSRRW_4        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b3 */Y(0,   0, Z(_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ,_unxb3          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b4 */Y(0,   0, Z(_i0reserved     ,_i1eFetch3      ,_i2eFetch3      ,_i0reserved     ,_i1eFetch3      ,_i2eFetch3      ,_ic0reserved    ,_ic1eFetch3     ,_ic2eFetch3     ,_ic0reserved    ,_ic1eFetch3     ,_ic2eFetch3     ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b5 */Y(0,   0, Z(_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ,_SH_3           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b6 */Y(0,   0, Z(_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ,_ECALL_5        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b7 */Y(0,   0, Z(_x_IJ_3         ,_x_IJ_3         ,_x_IJ_3         ,_x_IJ_3         ,_x_IJ_3         ,_x_IJ_3         ,_r_IJ_3         ,_r_IJ_3         ,_r_IJ_3         ,_r_IJ_3         ,_r_IJ_3         ,_r_IJ_3         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* b8 */Y(1,   0, Z(_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ,_BGE            ), 1, 0x0000707f, 0x00005063, (1<<22)    ) // BGE
/* b9 */Y(0,   0, Z(_unxb9          ,_unxb9          ,_unxb9          ,_DIV_e          ,_DIV_e          ,_DIV_e          ,_unxb9          ,_unxb9          ,_unxb9          ,_DIV_e          ,_DIV_e          ,_DIV_e          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".
/* ba */Y(0,   0, Z(_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ,_LHU_3          ), 0, 0xffffffff, 0x00000000, 0          ) // Must be even ucode adr for unknown reason. Must find owut this. Probably because MCLR was used prev cycle.
/* bb */Y(0,   0, Z(_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ,_SH_2           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* bc */Y(1,   0, Z(_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ,_CSRRWI_0       ), 1, 0x0000707f, 0x00005073, (1<<22)    ) // CSRRWI
/* bd */Y(0,   0, Z(_x_IJ_4         ,_x_IJ_4         ,_x_IJ_4         ,_x_IJ_4         ,_x_IJ_4         ,_x_IJ_4         ,_r_IJ_4         ,_r_IJ_4         ,_r_IJ_4         ,_r_IJ_4         ,_r_IJ_4         ,_r_IJ_4         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* be */Y(0,0x17, Z(_x_IJ_1         ,_x_IJ_1         ,_x_IJ_1         ,_x_IJ_1         ,_x_IJ_1         ,_x_IJ_1         ,_r_IJ_1         ,_r_IJ_1         ,_r_IJ_1         ,_r_IJ_1         ,_r_IJ_1         ,_r_IJ_1         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* bf */Y(0,0x17, Z(_x_IJT_1        ,_x_IJT_1        ,_x_IJT_1        ,_x_IJT_1        ,_x_IJT_1        ,_x_IJT_1        ,_r_IJT_1        ,_r_IJT_1        ,_r_IJT_1        ,_r_IJT_1        ,_r_IJT_1        ,_r_IJT_1        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* c0 */Y(0,   0, Z(_unxc0          ,_unxc0          ,_unxc0          ,_DIV_D          ,_DIV_D          ,_DIV_D          ,_unxc0          ,_unxc0          ,_unxc0          ,_DIV_D          ,_DIV_D          ,_DIV_D          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW"
/* c1 */Y(0,   0, Z(_x_IJT_2        ,_x_IJT_2        ,_x_IJT_2        ,_x_IJT_2        ,_x_IJT_2        ,_x_IJT_2        ,_r_IJT_2        ,_r_IJT_2        ,_r_IJT_2        ,_r_IJT_2        ,_r_IJT_2        ,_r_IJT_2        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* c2 */Y(0,0x18, Z(_unxc2          ,_unxc2          ,_unxc2          ,_DIVU_3         ,_DIVU_3         ,_DIVU_3         ,_unxc2          ,_unxc2          ,_unxc2          ,_DIVU_3         ,_DIVU_3         ,_DIVU_3         ), 2, 0x00400000, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "ij"
/* c3 */Y(0,0x18, Z(_unxc3          ,_unxc3          ,_unxc3          ,_DIVU_4         ,_DIVU_4         ,_DIVU_4         ,_unxc3          ,_unxc3          ,_unxc3          ,_DIVU_4         ,_DIVU_4         ,_DIVU_4         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE. 
/* c4 */Y(1,   0, Z(_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ,_ORI_0          ), 1, 0x0000707f, 0x00006013, (1<<22)    ) // ORI                                                        
/* c5 */Y(0,   0, Z(_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ,_MRET_5         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* c6 */Y(0,   0, Z(_x_IJT_4        ,_x_IJT_4        ,_x_IJT_4        ,_x_IJT_4        ,_x_IJT_4        ,_x_IJT_4        ,_r_IJT_4        ,_r_IJT_4        ,_r_IJT_4        ,_r_IJT_4        ,_r_IJT_4        ,_r_IJT_4        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* c7 */Y(0,   0, Z(_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ,_QINT_1         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* c8 */Y(0,   0, Z(_unxc8          ,_unxc8          ,_unxc8          ,_DIV_7          ,_DIV_7          ,_DIV_7          ,_unxc8          ,_unxc8          ,_unxc8          ,_DIV_7          ,_DIV_7          ,_DIV_7          ), 2, 0x00200000, 0x00000000, 0          ) // BAD COMMENT Illegal as entry. Can get here from OpCode close to "SW". DIV_7 must be even ucode adr (why?)
/* c9 */Y(0,   0, Z(_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ,_MRET_2         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* ca */Y(0,   0, Z(_unxca          ,_unxca          ,_unxca          ,_DIVU_2         ,_DIVU_2         ,_DIVU_2         ,_unxca          ,_unxca          ,_unxca          ,_DIVU_2         ,_DIVU_2         ,_DIVU_2         ), 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW". 
/* cb */Y(0,   0, Z(_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ,_QINT_2         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* cc */Y(1,   0, Z(_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ,_OR_0           ), 1, 0xfe00707f, 0x00006033, (1<<15)    ) // OR
/* cd */Y(1,   0, Z(_unxcd          ,_unxcd          ,_unxcd          ,_REM_0          ,_REM_0          ,_REM_0          ,_unxcd          ,_unxcd          ,_unxcd          ,_REM_0          ,_REM_0          ,_REM_0          ), 1, 0xfe00707f, 0x02006033, (1<<15)    ) // REM
/* ce */Y(0,   0, Z(_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ,_CSRRCI_1       ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1
/* cf */Y(0,   0, Z(_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ,_MRET_7         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1
/* d0 */Y(0,0x19, Z(_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ,_ECALL_1        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d1 */Y(0,0x19, Z(_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ,_MRET_1         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d2 */Y(0,0x1a, Z(_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ,_LB_2           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d3 */Y(0,0x1a, Z(_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ,_aFaultd        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d4 */Y(0,   0, Z(_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ,_aFault_2       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d5 */Y(0,   0, Z(_unxd5          ,_i1eFetch2      ,_unxd5          ,_unxd5          ,_i1eFetch2      ,_unxd5          ,_ic0unalignd    ,_ic1eFetch2     ,_ic2Fetch2u     ,_ic0unalignd    ,_ic1eFetch2     ,_ic2Fetch2u     ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d6 */Y(0,0x1b, Z(_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ,_eILL0c         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d7 */Y(0,0x1b, Z(_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ,_ECALL_3        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* d8 */Y(1,   0, Z(_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ,_BLTU           ), 1, 0x0000707f, 0x00006063, (1<<22)    ) // BLTU
/* d9 */Y(0,   0, Z(_unxd9          ,_unxd9          ,_unxd9          ,_MULH_3         ,_MULH_3         ,_MULH_3         ,_unxd9          ,_unxd9          ,_unxd9          ,_MULH_3         ,_MULH_3         ,_MULH_3         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".
/* da */Y(0,   0, Z(_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ,_LDAF_a         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* db */Y(0,   0, Z(_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ,_jFault_1       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* dc */Y(1,   0, Z(_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ,_CSRRSI_0       ), 1, 0x0000707f, 0x00006073, (1<<22)    ) // CSRRSI
/* dd */Y(0,   0, Z(_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ,_aF_SW_1        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* de */Y(0,0x1c, Z(_i0Fetch        ,_i1Fetch        ,_i2Fetch        ,_i0Fetch        ,_i1Fetch        ,_i2Fetch        ,_ic0Fetch       ,_ic1Fetch       ,_ic2Fetch       ,_ic0Fetch       ,_ic1Fetch       ,_ic2Fetch       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* df */Y(0,0x1c, Z(_i0eFetch       ,_i1eFetch       ,_i2eFetch       ,_i0eFetch       ,_i1eFetch       ,_i2eFetch       ,_ic0eFetch      ,_ic1eFetch      ,_ic2eFetch      ,_ic0eFetch      ,_ic1eFetch      ,_ic2eFetch      ), 0, 0xffffffff, 0x00000000, 0          ) //
/* e0 */Y(0,   0, Z(_unxe0          ,_unxe0          ,_unxe0          ,_DIVU_1         ,_DIVU_1         ,_DIVU_1         ,_unxe0          ,_unxe0          ,_unxe0          ,_DIVU_1         ,_DIVU_1         ,_DIVU_1         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW"
/* e1 */Y(0,   0, Z(_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ,_ORI_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* e2 */Y(0,0x1d, Z(_unxe2          ,_unxe2          ,_unxe2          ,_MUL_1          ,_MUL_1          ,_MUL_1          ,_unxe2          ,_unxe2          ,_unxe2          ,_MUL_1          ,_MUL_1          ,_MUL_1          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
/* e3 */Y(0,0x1d, Z(_unxe3          ,_unxe3          ,_unxe3          ,_MUL_3          ,_MUL_3          ,_MUL_3          ,_unxe3          ,_unxe3          ,_unxe3          ,_MUL_3          ,_MUL_3          ,_MUL_3          ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
/* e4 */Y(1,   0, Z(_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ,_ANDI_0         ), 1, 0x0000707f, 0x00007013, (1<<22)    ) // ANDI
/* e5 */Y(0,   0, Z(_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ,_aF_SW_2        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* e6 */Y(0,0x1e, Z(_i0StdIncPc     ,_i1StdIncPc     ,_i2StdIncPc     ,_i0StdIncPc     ,_i1StdIncPc     ,_i2StdIncPc     ,_ic0StdIncPc    ,_ic1StdIncPc    ,_ic2StdIncPc    ,_ic0StdIncPc    ,_ic1StdIncPc    ,_ic2StdIncPc    ), 0, 0xffffffff, 0x00000000, 0          ) //
/* e7 */Y(0,0x1e, Z(_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ,_aFault         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* e8 */Y(0,   0, Z(_unxe8          ,_unxe8          ,_unxe8          ,_MUL_2          ,_MUL_2          ,_MUL_2          ,_unxe8          ,_unxe8          ,_unxe8          ,_MUL_2          ,_MUL_2          ,_MUL_2          ), 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW".
/* e9 */Y(0,   0, Z(_x_IJT_3        ,_x_IJT_3        ,_x_IJT_3        ,_x_IJT_3        ,_x_IJT_3        ,_x_IJT_3        ,_r_IJT_3        ,_r_IJT_3        ,_r_IJT_3        ,_r_IJT_3        ,_r_IJT_3        ,_r_IJT_3        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* ea */Y(0,   0, Z(_unxea          ,_unxea          ,_unxea          ,_MULHU_5        ,_MULHU_5        ,_MULHU_5        ,_unxea          ,_unxea          ,_unxea          ,_MULHU_5        ,_MULHU_5        ,_MULHU_5        ), 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW"
/* eb */Y(0,   0, Z(_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ,_LH_3           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* ec */Y(1,   0, Z(_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ,_AND_0          ), 1, 0xfe00707f, 0x00007033, (1<<15)    ) // AND
/* ed */Y(1,   0, Z(_unxed          ,_unxed          ,_unxed          ,_REMU_0         ,_REMU_0         ,_REMU_0         ,_unxed          ,_unxed          ,_unxed          ,_REMU_0         ,_REMU_0         ,_REMU_0         ), 1, 0xfe00707f, 0x02007033, (1<<15)    ) // REMU
/* ee */Y(0,0x1f, Z(_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ,_eILL0a         ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1
/* ef */Y(0,0x1f, Z(_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ,_WFI_5          ), 0, 0xffffffff, 0x00000000, 0          ) // Reached with LAZY_DECODE==1
/* f0 */Y(0,0x20, Z(_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ,_LBU_2          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f1 */Y(0,0x20, Z(_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ,_aFaulte        ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f2 */Y(0,0x21, Z(_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ,_SW_2           ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f3 */Y(0,0x21, Z(_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ,_aF_SW          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f4 */Y(0,0x22, Z(_i0Fetch2       ,_i1Fetch2       ,_i2Fetch2       ,_i0Fetch2       ,_i1Fetch2       ,_i2Fetch2       ,_ic0Fetch2      ,_ic1Fetch2      ,_ic2Fetch2      ,_ic0Fetch2      ,_ic1Fetch2      ,_ic2Fetch2      ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f5 */Y(0,0x22, Z(_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ,_jFault         ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f6 */Y(0,0x23, Z(_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ,_WFI_1          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f7 */Y(0,0x23, Z(_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ,_EBREAK_1       ), 0, 0xffffffff, 0x00000000, 0          ) //
/* f8 */Y(1,   0, Z(_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ,_BGEU           ), 1, 0x0000707f, 0x00007063, (1<<22)    ) // BGEU
/* f9 */Y(0,   0, Z(_unxf9          ,_unxf9          ,_unxf9          ,_MULH_2         ,_MULH_2         ,_MULH_2         ,_unxf9          ,_unxf9          ,_unxf9          ,_MULH_2         ,_MULH_2         ,_MULH_2         ), 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".
/* fa */Y(0,   0, Z(_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ,_WFI_2          ), 0, 0xffffffff, 0x00000000, 0          ) //
/* fb */Y(0,   0, Z(_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ,_SB_3           ), 2, 0x00200000, 0x00000000, 0          ) //
/* fc */Y(1,   0, Z(_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ,_CSRRCI_0       ), 1, 0x0000707f, 0x00007073, (1<<22)    ) // CSRRCI
/* fd */Y(1,   0, Z(_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ,_NMI_0          ), 3, 0xffffffff, 0x00000000, 0          ) // Reserved for NMI
/* fe */Y(1,   0, Z(_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ,_ILLe           ), 2, 0x2af56000, 0x00000000, 0          ) // Reserved for illegals
/* ff */Y(1,   0, Z(_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ,_QINT_0         ), 3, 0xffffffff, 0x00000000, 0          ) // Reserved for qualified interrupt



#include "ucode_constantundef.h"
