        # Check C.ADDI4SPN 
        #===========================================================

        
#include "midgetv.inc"
        .globl _start
        
        #===========================================================
        .org 0x108
StartTrap:
        simerr 44
        
        #===========================================================
#ifndef onlyEBR
        .section .text
#endif

1:      simerr  1
2:      simerr  2
        
_start:
        la              x2,StartTrap
        sw              x2,%lo(__mtvec)(x0)
        li              x3,0x158
        c.addi4spn      x11,sp,80
        c.addi          x4,5
        bne             x11,x3,1b

        c.addi          x3,16
        c.addi4spn      x11,sp,96
        bne             x11,x3,2b
        
        simend
.align 2

