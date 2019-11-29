        # Experimental. MUL
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
        li      x1,41
        li      x2,100
        //
        // Hits correct entrypoints
        //
        mul     x3,x1,x2
        mulh    x3,x1,x2
        mulhu   x3,x1,x2
        mulhsu  x3,x1,x2
        div     x3,x1,x2
        divu    x3,x1,x2
        rem     x3,x1,x2
        remu    x3,x1,x2

        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
