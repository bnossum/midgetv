        # Check blt
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,22
        addi    x2,x0,-4        # 0xfffffffc        
        blt     x1,x2,1f        # (int32_t) x1 > (int32_t) x2 so should not branch
        blt     x2,x1,2f        # Should  branch      
1:      simerr  1
2:      simend
        
