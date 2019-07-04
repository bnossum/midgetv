        # Check ori
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x1,x0,0xff
        addi    x2,x0,0xaa
        ori     x3,x2,0x55
        bne     x1,x3,1f
        simend
1:      simerr  1
        
