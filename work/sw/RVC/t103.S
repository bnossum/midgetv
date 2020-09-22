        # Check the illegal instruction with 32-bit alignment
        #===========================================================

#include "midgetv.inc"
        .globl _start
        
        #===========================================================
        .org 0x108
StartTrap:
        li      x2,0x123
        bne     x1,x2,1f
        simend

1:      simerr  1
        
        #===========================================================
#ifndef onlyEBR
        .section .text
#endif

        
_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)   
        li      x1,0x123
        .2byte  0
        .2byte  0xbabe
.align 2

