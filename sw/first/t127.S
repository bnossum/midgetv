        # Check srl
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        lui     x1,%hi(0x80000000)
        addi    x9,x0,1
        lui     x8,%hi(0x40000000)
        srl     x6,x1,x9        # Shift logical right 1
        bne     x6,x8,1f
        
        addi    x9,x0,2
        lui     x8,%hi(0x20000000)
        srl     x6,x1,x9        # Shift logical right 2
        bne     x6,x8,2f
        
        addi    x9,x0,8
        lui     x8,%hi(0x00800000)
        srl     x6,x1,x9        # Shift logical right 8
        bne     x6,x8,3f
        
        addi    x9,x0,16
        lui     x8,%hi(0x00008000)
        srl     x6,x1,x9        # Shift logical right 16
        bne     x6,x8,4f
        
        addi    x9,x0,30
        addi    x8,x0,2
        srl     x6,x1,x9        # Shift logical right 30
        bne     x6,x8,5f
        
        addi    x9,x0,31
        addi    x8,x0,1
        srl     x6,x1,x9        # Shift logical right 31
        bne     x6,x8,6f
        
        addi    x9,x0,0
        lui     x8,%hi(0x80000000)
        srl     x6,x1,x9        # Shift logical right 0
        bne     x6,x8,7f
        
        simend
        
        # =============================================================================
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
        
