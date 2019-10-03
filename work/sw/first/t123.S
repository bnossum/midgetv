        # Check slli
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x7,x0,0x1
        addi    x8,x0,0x2
        slli    x6,x7,1         # Shift logical left 1
        bne     x6,x8,1f
        
        addi    x7,x0,1
        addi    x8,x0,4
        slli    x6,x7,2         # Shift logical left 2
        bne     x6,x8,2f

        addi    x7,x0,1
        addi    x8,x0,256
        slli    x6,x7,8         # Shift logical left 8
        bne     x6,x8,3f

        addi    x7,x0,1
        lui     x8,%hi(0x00010000)
        slli    x6,x7,16        # Shift logical left 16
        bne     x6,x8,4f
        
        addi    x7,x0,1
        lui     x8,%hi(0x40000000)
        slli    x6,x7,30        # Shift logical left 30
        bne     x6,x8,5f
        
        addi    x7,x0,1
        lui     x8,%hi(0x80000000)
        slli    x6,x7,31        # Shift logical left 31
        bne     x6,x8,6f

        addi    x7,x0,1
        addi    x8,x0,1
        slli    x6,x7,0         # Shift logical left 0
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
        
