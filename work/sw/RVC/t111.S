        # Find an observed error.
        # Unaligned CSR instruction
        #===========================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif
ERR:        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
8:      simerr  8
9:      simerr  9
10:     simerr  10
11:     simerr  11
12:     simdump
        simerr  12
13:     simerr  13
14:     simerr  14
15:     simerr  15
16:     simerr  16
17:     simerr  17
18:     simerr  18

_start:
        // Check misa
        li      x22,0x40800100        
        c.addi  x0,1
        csrrw   x1,misa,x3
        j       Good
        bne     x1,x22,9b
        lw      x11,%lo(__misa)(x0)
        bne     x3,x11,10b
        j       Good
        
        .align 2
Good:
        simend
        
