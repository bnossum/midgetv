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
SubRut:
        la      x5,_retpoint
        bne     x1,x5, 1f
        simend
1:      simerr  1
        
