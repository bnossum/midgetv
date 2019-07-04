        # Check sll
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x9,x0,1
        addi    x1,x0,1
        addi    x8,x0,2
        sll     x6,x1,x9        # Shift logical left 1
        bne     x6,x8,1f
        
        addi    x9,x0,2
        addi    x8,x0,4
        sll     x6,x1,x9        # Shift logical left 2
        bne     x6,x8,2f

        addi    x9,x0,8
        addi    x8,x0,256
        sll     x6,x1,x9        # Shift logical left 8
        bne     x6,x8,3f

        addi    x9,x0,16
        lui     x8,%hi(0x00010000)
        sll     x6,x1,x9        # Shift logical left 16
        bne     x6,x8,4f
        
        addi    x9,x0,30
        lui     x8,%hi(0x40000000)
        sll     x6,x1,x9        # Shift logical left 30
        bne     x6,x8,5f
        
        addi    x9,x0,31
        lui     x8,%hi(0x80000000)
        sll     x6,x1,x9        # Shift logical left 31
        bne     x6,x8,6f

        addi    x9,x0,0
        addi    x8,x0,1
        sll     x6,x1,x9        # Shift logical left 0
        bne     x6,x8,7f

        simend
        
        # =============================================================================
1:      simerr    1 
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
        
