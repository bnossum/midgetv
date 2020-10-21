        # Check jal
        # =============================================================================
#include "midgetv.inc"
#ifndef onlyEBR
        .section .text
#endif
        .globl _start
_start:
        jal     x1,SubRut
_retpoint:      
1:      .word 0x00000010        # Error, should not be here

        # =============================================================================
SubRut2:
        la      x5,_retpoint2
        bne     x1,x5,2f
        simend
        
        # =============================================================================
SubRut:
        la      x5,_retpoint
        bne     x1,x5,1f
        jal     x1,SubRut2
_retpoint2:     
1:      simerr  1
2:      simerr  2
