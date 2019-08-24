        # Check store to output port, load from output port
        # =============================================================================
#include "midgetv.inc"
        .globl _start
        # =============================================================================
StartTrap: # Not taken
        
2:      .word 0x00000020

#ifndef onlyEBR
        .section .text
#endif

_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        li      x1,LEDREG
        li      x2,0x1234567
        lw      x3,0(x1)        # Load
        sw      x2,0(x1)        # Store
//        simdump
        lw      x3,0(x1)        # Load
        bne     x2,x3,1f
        simend
        
1:      simerr  1

