        # Check fundamental sw 
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start: 
        li      x1,0x11223344
        la      x2,thedata
        sw      x1,0(x2)
        lw      x3,0(x2)
        bne     x1,x3,1f
        simend
thedata:
        .word 0xbaddead0
1:      simdump
        simerr  1
        
