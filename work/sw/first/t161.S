        # Ensure we can read mstatus under the condition that control registers are
        # implemented
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"

        
        .globl _start
        # =============================================================================
StartTrap:
        simerr  1

        # =============================================================================
NMI:
        simerr  99
InternalISR:
        simerr  2
        
        # =============================================================================
        // This trap handle to see if this midgetv has no system registers.
NoSysRegTrap:  
        lw      x1,%lo(__mcause)(x0)
        li      x31,5
        bne     x1,x31,5f      // ? Don't understand this
        // No system registers, so test
        // can not be performed.
        // Fake success.
        simend
5:      simerr  5

        # =============================================================================
#ifndef onlyEBR
        .section .text
#endif
_start:
        la      x1,NoSysRegTrap         // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)

        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)

        li      x1,__read_mstatus       //
        lw      x2,0(x1)

        li      x3,0x00001800
        bne     x2,x3,3f
        simend

3:      simerr  3
4:      simerr  4
                
