        # Check lbu
        # =============================================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif
        
_start:
        la      x20,inited_data
        addi    x2,x0,0xaa
        lbu     x1,(0)(x20)
        bne     x1,x2,1f

        addi    x2,x0,0xbb
        lbu     x1,(1)(x20)
        bne     x1,x2,2f

        addi    x2,x0,0xcc
        lbu     x1,(2)(x20)
        bne     x1,x2,3f

        addi    x2,x0,0xdd
        lbu     x1,(3)(x20)
        bne     x1,x2,4f
        
        simend
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
inited_data:    
        .word 0xddccbbaa

        
