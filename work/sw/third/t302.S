        # Check MUL
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

_trap_handler:
        simerr 42
        
_start:        
        // Set trap handler address
        la      x1,_trap_handler
        sw      x1,%lo(__mtvec)(x0)        

        li      x4,0x00010000
        li      x2,0xffff0000
        li      x1,0x0000ffff
        mul     x3,x1,x2
        bne     x3,x4,5f

        li      x1,1
        mul     x2,x1,x1
        bne     x1,x2,1f
        
        li      x1,0x12345678
        mul     x1,x1,x1
        li      x2,0x1df4d840
        bne     x1,x2,2f
        
        
        

        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
