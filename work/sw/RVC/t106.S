        # Find an observed error
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

        #===========================================================
_start:
        li      x7,0x100
        c.li    x6,0
        addi    x6,x7,0
        addi    x6,x7,0
        bne     x6,x7,1f
        c.li    x5,0
        simend 
1:
        simerr  1
