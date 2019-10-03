        # Check srai
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        lui     x7,%hi(0x80000000)
        lui     x8,%hi(0xc0000000)
        srai    x6,x7,1         # Shift arithmetic right 1
        bne     x6,x8,1f
         
        lui     x7,%hi(0x80000000)
        lui     x8,%hi(0xe0000000)
        srai    x6,x7,2         # Shift arithmetic right 2
        bne     x6,x8,2f
        
        lui     x7,%hi(0x80000000)
        lui     x8,%hi(0xff800000)
        srai    x6,x7,8         # Shift arithmetic right 8
        bne     x6,x8,3f
        
        lui     x7,%hi(0x80000000)
        lui     x8,%hi(0xffff8000)
        srai    x6,x7,16        # Shift arithmetic right 16
        bne     x6,x8,4f
        
        lui     x7,%hi(0x80000000)
        addi    x8,x0,-2
        srai    x6,x7,30        # Shift arithmetic right 30
        bne     x6,x8,5f
        
        lui     x7,%hi(0x80000000)
        addi    x8,x0,-1
        srai    x6,x7,31        # Shift arithmetic right 31
        bne     x6,x8,6f
        
        lui     x7,%hi(0x80000000)
        lui     x8,%hi(0x80000000)
        srli    x6,x7,0         # Shift arithmetic right 0
        bne     x6,x8,7f
       
        simend
        
        # =============================================================================
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
        
