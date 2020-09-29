        # Check decoding of undefined instruction close to JALR
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

        .word 0x00001067
        .word 0x00002067
        .word 0x00003067
        .word 0x00004067
        .word 0x00005067
        .word 0x00006067
        .word 0x00007067
        .word 0x40001067
        .word 0x40002067
        .word 0x40003067
        .word 0x40004067
        .word 0x40005067
        .word 0x40006067
LastOne:.word 0x40007067
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
        li      x27,14
        bne     x28,x27,Failed
        simend

Failed:
        simerr  2
