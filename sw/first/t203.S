        # Access SRAM with lb,lbu,sb
        #===========================================================
#include "midgetv.inc"
        .globl _start


_start:
        la      x1,HopefullySram
        li      x3,0xbe
        lbu     x2,4(x1)        
        bne     x2,x3,1f

        li      x3,0xba
        lbu     x2,5(x1)        
        bne     x2,x3,2f

        li      x3,0x0d
        lbu     x2,6(x1)        
        bne     x2,x3,3f

        li      x3,0xde
        lbu     x2,7(x1)        
        bne     x2,x3,4f

        li      x3,0xffffffbe
        lb      x2,4(x1)        
        bne     x2,x3,1f

        li      x3,0xffffffba
        lb      x2,5(x1)        
        bne     x2,x3,2f

        li      x3,0x0d
        lb      x2,6(x1)        
        bne     x2,x3,3f

        li      x3,0xffffffde
        lb      x2,7(x1)        
        bne     x2,x3,4f

        li      x3,0x12
        sb      x3,4(x1)
        lw      x4,4(x1)
        li      x5,0xde0dba12
        bne     x4,x5,5f
        
        sb      x3,5(x1)
        lw      x4,4(x1)
        li      x5,0xde0d1212
        bne     x4,x5,5f
        
        sb      x3,6(x1)
        lw      x4,4(x1)
        li      x5,0xde121212
        bne     x4,x5,5f
        
        sb      x3,7(x1)
        lw      x4,4(x1)
        li      x5,0x12121212
        bne     x4,x5,5f
        
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
#ifdef onlyEBR
#error This program only for midgetv with SRAM
#endif
        .section .data
HopefullySram:
        .word   0x76543210
        .word   0xde0dbabe
        .word   0xfedcba98
