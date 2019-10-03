/* This is a primitive crt0 for morse.c
 */

#include "midgetv.inc"
        
        .globl _start
        .extern main
        # =============================================================================
StartTrap:
        nop
NMI:
        nop
InternalISR:
Continue:       
        li      x1,LEDREG
        sw      x3,0(x1)                // To LEDs
        addi    x3,x3,1
        li      x4,0x40000
L:      addi    x4,x4,-1
        bne     x4,x0,L
        j       Continue


_start:        
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)
        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)
        j       main
