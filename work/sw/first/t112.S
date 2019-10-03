        # Check xori
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x1,x0,0xff
        addi    x2,x0,0x5a
        xori    x3,x2,0xa5
        bne     x1,x3,1f
        simend
1:      simerr  1
        
