        # Accessing an illegal CSR address.
        # =============================================================================
#include "midgetv.inc"

#define NoCSR_exception 0
        
#include "midgetv_minimal_csr.S"

//#define SHORTCODE 1        
        
        .globl _start
        # =============================================================================
#ifndef onlyEBR
        .section .text
#endif
        
_start:        
        // Set trap handler address
        la      x1,_trap_handler
#if SHORTCODE        
        sw      x1,%lo(__mtvec)(x0)
#else
        csrrw   x0,mtvec,x1
#endif
        
        //
        // Access CSR register that should trap in M-mode
FaultingInstr:  
        csrrw   x31,0x7b0,x1
        simerr 1

        // -----------------------------------------------------------------------------
        // Exception handler
_trap_handler:

#if SHORTCODE

        // mcause should be 2
        lw      x29,%lo(__mcause)(x0)
        li      x2,2
        bne     x29,x2,3f
        
        // mtval should be 0
        lw      x4,%lo(__mtval)(x0)
        bne     x4,x0,4f
        
        
        // mepce should be address of faulting instr
        lw      x30,%lo(__mepc)(x0)
        la      x1,FaultingInstr
        bne     x30,x1,2f
#else
        // mcause should be 2
        csrr    x29,mcause
        li      x2,2
        bne     x29,x2,3f
        
        // mtval should be 0
        csrr    x4,mtval
        bne     x0,x4,4f
        
        // mepce should be address of faulting instr
        csrr    x30,mepc
        la      x1,FaultingInstr
        bne     x30,x1,2f
#endif
        
        simend


2:      simerr  2
3:      simerr  3
4:      simerr  4
