        # Check MULHU
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

        li      x4,0xfffe
        li      x1,0xffff0000
        li      x2,0x0000ffff     // 0xffff0000*0x0000ffff = 0x0000fffe00010000
        mulhu   x3,x1,x2
        bne     x3,x4,5f

        li      x2,0xffff0000
        li      x1,0x0000ffff     // 0xffff0000*0x0000ffff = 0x0000fffe00010000
        mulhu   x3,x1,x2
        bne     x3,x4,6f
        
        li      x1,0x80000000
        li      x2,0x2
        mulhu   x3,x1,x2          // 0x80000000*0x00000002 = 0x0000000100000000
        li      x4,1
        bne     x3,x4,1f
        
        li      x1,0x7fffffff     // 0x7fffffff*0x7fffffff = 0x3fffffff00000001
        mv      x2,x1
        mulhu   x1,x1,x1
        srli    x2,x2,1
        bne     x1,x2,2f

        li      x1,0xffffffff   // 0xffffffff * 0xffffffff = FFFFFFFE00000001
        addi    x2,x1,-1
        mulhu   x1,x1,x1
        bne     x1,x2,3f
        
        li      x1,0x12345678
        mulhu   x1,x1,x1
        li      x2,0x14b66dc
        bne     x1,x2,4f
        
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
