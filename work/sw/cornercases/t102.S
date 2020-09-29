        # Check decoding of undefined instruction close by fence and fence.i.
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
        li      x28,0
        
        
        .word 0x0000200f
        .word 0x0000300f
        .word 0x0000400f
        .word 0x0000500f
        .word 0x0000600f
        .word 0x0000700f
        .word 0x4000200f
        .word 0x4000300f
        .word 0x4000400f
        .word 0x4000500f
        .word 0x4000600f
LastOne:.word 0x4000700f

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
        li      x27,12
        bne     x28,x27,Failed
        simend

Failed:
        simerr  2
