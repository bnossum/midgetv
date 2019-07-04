        # Check bgeu
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,22
        addi    x2,x0,-4        # 0xfffffffc        
        bgeu    x2,x1,1f        # (uint32_t) x2 > (uint32_t) x1 so should branch
        simerr  1
1:      bgeu    x1,x2,2f        # Should not branch
        addi    x3,x1,0         
        bgeu    x1,x3,3f        # Should branch
2:      simerr  2
3:      simend
        
