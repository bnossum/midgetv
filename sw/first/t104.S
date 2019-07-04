        # Check add
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,22
        addi    x2,x0,20
        addi    x3,x0,42
        add     x4,x1,x2
        bne     x3,x4,1f
        simend
1:      simerr  1
