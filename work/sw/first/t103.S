        # Check bne
        #===========================================================
#include "midgetv.inc"
        
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,42
        addi    x2,x0,42
        bne     x2,x3,2f        # Test branch on not equal, should be taken
1:      simerr  1
        .zero 12
2:      bne     x1,x2,3f        # Test branch on equal, should not be taken
        simend
        .zero 12
3:      simerr  2
