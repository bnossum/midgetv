        # Check DIV
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

        li      x4,64
        li      x1,-128
        li      x2,-2
        div     x3,x1,x2
        bne     x3,x4,1f
        
        li      x4,-64
        li      x1,-128
        li      x2,2
        div     x3,x1,x2
        bne     x3,x4,2f
      
        li      x4,-64 // 0,1,3,5,3,4,6
        li      x1,0x80
        li      x2,-2
        div     x3,x1,x2
        bne     x3,x4,3f
        
        li      x4,0x40 // 0,1,3,4,6. M=0x00000080, Ryy = [0xb0] = 0xfffffffd
        li      x1,0x80
        li      x2,2
        div     x3,x1,x2
        bne     x3,x4,4f
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
