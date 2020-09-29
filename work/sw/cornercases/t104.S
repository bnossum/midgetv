        # Check decoding of undefined instruction close to LB/LH/LW/LHU/LBU
        # =============================================================================
#include "midgetv.inc"
//#include "midgetv_minimal_csr.S"

        .globl _start
        # =============================================================================

        
#ifndef onlyEBR
        .section .text
#endif
_start:        
        // -----------------------------------------------------------------------------
        // Set trap handler address
        la      x10,_trap_handler
        la      x11,__mtvec
        sw      x10,0(x11)
        li      x28,0
        
        .word 0x00003003
        .word 0x00006003
        .word 0x00007003
        .word 0x40003003
        .word 0x40006003
LastOne:.word 0x40007003
        simerr 1
        
        // -----------------------------------------------------------------------------
_trap_handler:
        addi    x28,x28,1
        la      x31,__mepc
        lw      x30,0(x31)
        la      x29,LastOne
        beq     x29,x30,AtEnd
        addi    x30,x30,4
        sw      x30,0(x31)
        mret

AtEnd:
        li      x27,6
        bne     x28,x27,Failed
        simend

Failed:
        simerr  2
