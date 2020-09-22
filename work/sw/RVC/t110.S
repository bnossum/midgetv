        # Find an observed error.
        # JAL from unaligned address.
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif
#  ffff0108:	00080b37          	lui	x22,0x80
        #===========================================================
_start:
        jal     x21,rutA
        c.addi  x0,1
        jal     x21,rutA
        
        j       99f

        .align 2
        .global rutA
rutA:   jalr    x0,0(x21)
        c.addi  x0,0
        c.addi  x0,0
        simerr  3
        //        bne     x6,x7,2f                // Not taken, unaligned
        
.align 2        
99:     simdump
        simend 
1:
        simdump
        simerr  1
2:
        simdump
        simerr  2
