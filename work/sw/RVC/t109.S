        # Find an observed error.
        # Unaligned branch taken is misinterpreted
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif
#  ffff0108:	00080b37          	lui	x22,0x80
        #===========================================================
_start:
        li      x1,100
        li      x6,500
        li      x7,500          
        bne	x7,x0,L_A               // Taken, aligned
        simerr  2

        c.addi  x0,1
        
L_A:    bne     x7,x1,L_B               // Taken, unaligned
        simerr  3
        
L_B:    bne     x6,x7,1f                // Not taken, aligned
        c.addi  x0,1
        c.addi  x0,1
        c.addi  x0,1


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
