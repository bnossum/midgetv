        # Check jalr
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        la      x2,SubRut
        addi    x2,x2,10
        jalr    x1,x2,-10
_retpoint:
        addi    x10,x11,12
        simend
        .word 0xbaddead0
        
        # =============================================================================
SubRut:
        la      x5,_retpoint
        bne     x1,x5, 1f
        jalr    x0,x1,0
        
1:      simerr  1
        
