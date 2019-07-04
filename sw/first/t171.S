        # Check sw of mcycle. This program require
        # SRAM read latency 1, SRAM write latency 0
        # HAS_MINSTRET and HAS_EBR_MINSTRET must match the definition in ucode.h
        # =============================================================================
#define HAS_MINSTRET     1
#define HAS_EBR_MINSTRET 1

#include "midgetv.inc"

        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start: 
        li      x1,0xcafebabe
        la      x2,__mcycle
        la      x3,somedata
        sw      x1,0(x3)
        sw      x1,0(x2)

        // Inherently, the addi instruction uses 5 cycles.
        // But if the mandatory performancecounter minstret is included,
        // addi uses 6 cycles. 
        // And if addi executes from an SRAM, it require additional
        // 1+SRAM_READ_LATENCY cycles.
#ifndef onlyEBR
        // Each instruction need 2 more cycles when from SRAM
        // Each instruction need 1 more cycle to maintain minstret
        addi    x5,x1,10 + 2*2 + 2*HAS_MINSTRET
#else
        // Each instruction need 1 more cycle to maintain minstret
        addi    x5,x1,10 + 2*HAS_EBR_MINSTRET
#endif        
        lw      x4,0(x2)
        bne     x4,x5,1f
        simend
1:      
        simdump
        simerr  1
somedata:
        .word 0
