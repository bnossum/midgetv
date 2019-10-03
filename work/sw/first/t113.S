        # Check and
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x3,x0,0x2
        addi    x1,x0,0x3       # 0011
        addi    x2,x0,0x6       # 0110
        and     x4,x1,x2        # 0010
        bne     x4,x3,1f
        simend
1:      simerr  1
        
