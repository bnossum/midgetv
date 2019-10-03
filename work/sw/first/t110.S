        # Check andi
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x2,x0,0xaa
        addi    x1,x0,0xff
        andi    x3,x1,0xaa
        bne     x2,x3,1f
        simend
1:      simerr  1
        
