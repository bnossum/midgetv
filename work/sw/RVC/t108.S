        # Find an observed error.
        # But can't recreate it?
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif
#  ffff0108:	00080b37          	lui	x22,0x80
        #===========================================================
_start:
        lui     x22,0x80
.align 2        
99:     simdump
        simend 
1:
        simdump
        simerr  1
