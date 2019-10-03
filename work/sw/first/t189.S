        # Scratch file. 
        # Track an error in lowlevel instruction decode.
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
        # =============================================================================
NMI:
        simerr  1
InternalISR:
        # =============================================================================
        simerr  2
StartTrap:
        // Check that mcause == 2
        lw      x1,%lo(__mcause)(x0)
        li      x2,2
        bne     x1,x2,2f
        
        // Check that mtval contains the expected illegal instruction
        la      x1,TheIllegals
        sll     x2,x31,2
        add     x1,x1,x2
        lw      x1,0(x1)
        lw      x2,%lo(__mtval)(x0)
        bne     x1,x2,3f
        simend
2:      simerr 0x22
3:      simerr 0x23
        
        # =============================================================================
_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)

        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)
TheIllegals:    
        .word   0x00000007
        simerr  3
