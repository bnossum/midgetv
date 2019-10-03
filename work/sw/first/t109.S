        # Check bge
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,22
        addi    x2,x0,-4        # 0xfffffffc        
        bge     x1,x2,1f        # (int32_t) x1 > (int32_t) x2 so shold branch
        simerr  1
1:      bge     x2,x1,2f        # Should not branch
        addi    x3,x1,0         
        bge     x1,x3,3f        # Should branch
2:      simerr  2
3:      simend
        
