        # Access SRAM with lh,lhu,sh
        #===========================================================
#include "midgetv.inc"
        .globl _start


_start:
        la      x1,HopefullySram
        li      x3,0xbabe
        lhu     x2,4(x1)        
        bne     x2,x3,1f
        
        li      x3,0xdead
        lhu     x2,6(x1)
        bne     x2,x3,2f

        li      x3,0xffffbabe
        lh      x2,4(x1)        
        bne     x2,x3,3f
        
        li      x3,0xffffdead
        lh      x2,6(x1)
        bne     x2,x3,4f

        li      x4,0x4321
        sh      x4,4(x1)
        lw      x5,4(x1)
        li      x6,0xdead4321
        bne     x5,x6,5f

        sh      x4,6(x1)
        lw      x5,4(x1)
        li      x6,0x43214321
        bne     x5,x6,6f
        
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
        .word   0xdeadbabe
        .word   0xfedcba98
