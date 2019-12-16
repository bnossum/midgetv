        # Check sw of mcycle. This program require
        # SRAM read latency 1, SRAM write latency 0
        # Program not finished.
        # =============================================================================
#define HAS_MINSTRET     1
#define HAS_EBR_MINSTRET 1
#define NO_CYCLECNT      0
        
#include "midgetv.inc"

        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        // I first do my measurement:
        li      x21,0 //xdeadbabe
        la      x22,__mcycle
        sw      x21,0(x22)
        nop
        nop
        lw      x23,0(x22)
        
        
        // Find out if the program is compiled with NO_CYCLECNT == 1
        lw      x1,%lo(__mcycle)(x0)
        lw      x2,%lo(__mcycle)(x0)
        add     x1,x1,1
        beq     x1,x2,NO_CYCLECNT_eq_1
        
NO_CYCLECNT_eq_0:
        // Do we have a retired instruction counter?
        lw      x11,%lo(__rinst)(x0)
        lw      x12,%lo(__rinst)(x0)
        beq     x11,x12,NO_CYCLECNT_eq_0_NO_RINST

        // Executing from EBR or SRAM ?
        la      x1,_start
        bltz    x1,NO_CYCLECNT_eq_0_RINST_SRAM
        j       NO_CYCLECNT_eq_0_RINST_EBR
        
NO_CYCLECNT_eq_0_NO_RINST:
        // Executing from EBR or SRAM ?
        la      x1,_start
        bltz    x1,NO_CYCLECNT_eq_0_NO_RINST_SRAM
        j       NO_CYCLECNT_eq_0_NO_RINST_EBR


NO_CYCLECNT_eq_0_RINST_EBR:
        simerr 11
        
NO_CYCLECNT_eq_0_RINST_SRAM:
        // We have a cycle counter
        // We have a retired instruction counter
        //
        // addi : 4 + 1 (instruction couunter) + 2 (SRAM OpCode read)
        // lw   : 5 + 1 (instruction couunter) + 2 (SRAM OpCode read) + 0 (data in EBR)
        // fudge: 1
        //                              
        //              nop     nop     lw     fudge
        addi    x1,x21,(4+1+2)+(4+1+2)+(5+1+2)+1
        beq     x1,x23,Success
        simdump
        simerr 16

NO_CYCLECNT_eq_0_NO_RINST_SRAM:
        // We have a cycle counter
        // We have no instruction counter
        //
        // addi : 4 + 2 (SRAM OpCode read)
        // lw   : 5 + 2 (SRAM OpCode read) + 0 (data in EBR)
        // fudge: 1
        //
        //            nop    nop   lw   fudge
        addi   x1,x21,(4+2)+(4+2)+(5+2)+1
        beq     x1,x23,Success
        simerr 13

NO_CYCLECNT_eq_0_NO_RINST_EBR:
        simerr 14
        
NO_CYCLECNT_eq_1:
        // _mcycle degenerates to an instruction counter in this case
        addi    x1,x21,3
        beq     x1,x23,Success
        simdump
        simerr  15


Success:
        simend

//
//        
//
//        // Inherently, the addi instruction uses 5 cycles.
//        // But if the mandatory performancecounter minstret is included,
//        // addi uses 6 cycles. 
//        // And if addi executes from an SRAM, it require additional
//        // 1+SRAM_READ_LATENCY cycles.
//#ifndef onlyEBR
//        // Each instruction need 2 more cycles when from SRAM
//        // Each instruction need 1 more cycle to maintain minstret
//        addi    x5,x1,10 + 2*2 + 2*HAS_MINSTRET
//#else
//
//#if NO_CYCLECNT == 1
//        addi    x5,x1,2
//#else   
//        // Each instruction need 1 more cycle to maintain minstret
//        addi    x5,x1,10 + 2*HAS_EBR_MINSTRET
//#endif        
//#endif        
//
//
//
//
//        
//        // Inherently, the addi instruction uses 5 cycles.
//        // But if the mandatory performancecounter minstret is included,
//        // addi uses 6 cycles. 
//        // And if addi executes from an SRAM, it require additional
//        // 1+SRAM_READ_LATENCY cycles.
//#ifndef onlyEBR
//        // Each instruction need 2 more cycles when from SRAM
//        // Each instruction need 1 more cycle to maintain minstret
//        addi    x5,x1,10 + 2*2 + 2*HAS_MINSTRET
//#else
//
//#if NO_CYCLECNT == 1
//        addi    x5,x1,2
//#else   
//        // Each instruction need 1 more cycle to maintain minstret
//        addi    x5,x1,10 + 2*HAS_EBR_MINSTRET
//#endif        
//#endif        
//        lw      x4,0(x2)
//        bne     x4,x5,1f
//        simend
//1:      
//        simdump
//        simerr  1
//somedata:
//        .word 0
