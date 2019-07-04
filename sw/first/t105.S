        # Check sub
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,24
        addi    x2,x0,22
        sub     x3,x1,x2
        addi    x4,x0,2
        bne     x3,x4,1f
        simend
1:      simerr  1
