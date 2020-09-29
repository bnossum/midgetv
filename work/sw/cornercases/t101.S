        # Check decoding of specific illegal opcodes close to custom-9 "ij"  instruction
        # Bits of the instruction that is used in the main index is limited to
        # i[6:2], i[14:12], i30
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
        li      x28,0   // Count nr times in trap handle
        .word 0x0000100b
        .word 0x0000200b
        .word 0x0000300b
        .word 0x0000400b
        .word 0x0000500b
        .word 0x0000600b
        .word 0x0000700b
        .word 0x4000100b
        .word 0x4000200b
        .word 0x4000300b
        .word 0x4000400b
        .word 0x4000500b
        .word 0x4000600b
LastOne:.word 0x4000700b
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
