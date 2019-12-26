        # Check DIVU
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

        li      x4,0x40
        li      x1,0x80
        li      x2,2
        divu    x3,x1,x2
        bne     x3,x4,1f
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
