        # Check bltu
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,22
        addi    x2,x0,-4        # 0xfffffffc        
        bltu    x1,x2,1f        # (uint32_t) x1 < (uint32_t) x2 so shold branch
        simerr  1
1:      bltu    x2,x1,2f        # Should not branch      
        simend
2:      simerr  2
        
