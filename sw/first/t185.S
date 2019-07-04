        # Check unaligned sw, sh to  output port
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"

        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif
_start:        
        // -----------------------------------------------------------------------------
        // Set trap handler address
        la      x1,_trap_handler
        csrrw   x0,mtvec,x1

        // First prime the register
        li      x4,0xdeadbeef
        li      x5,SLOWREGADR
        sw      x4,0(x5)
        
        // test unaligned SH
        li      x1,SLOWREGADR+1
        li      x2,0x0123
        sh      x2,0(x1)
        lw      x6,0(x5)
        bne     x6,x4,WroteAfterAll

        // test unaligned SW
        li      x2,0x76543210
        sw      x2,0(x1)
        lw      x6,0(x5)
        bne     x6,x4,WroteAfterAll
simend        

        addi    x1,x1,1
        addi    x2,x2,1
        sw      x2,0(x1)
        lw      x6,0(x5)
        bne     x6,x4,WroteAfterAll

        addi    x1,x1,1
        addi    x2,x2,1
        sw      x2,0(x1)
        lw      x6,0(x5)
        bne     x6,x4,WroteAfterAll

        simend

        // -----------------------------------------------------------------------------
        // Exception handler
_trap_handler:
        // Accept exceptions with combinations
        // x1             x2          Case
        // SLOWREGADR+1   0x00000123  A
        // SLOWREGADR+1   0x76543210  B
        // SLOWREGADR+2   0x76543211  C
        // SLOWREGADR+3   0x76543212  D
        // All other exceptions give error.
        // I do not conserve registers.
        li      x12,0x76543210
        li      x11,SLOWREGADR+1
        beq     x1,x11,CaseA_or_CaseB
        addi    x11,x11,1
        beq     x1,x11,CaseC
        addi    x11,x11,1
        beq     x1,x11,CaseD
        simerr  1

CaseA_or_CaseB:
        beq     x2,x12,Accept
        li      x12,0x123
        nop
        beq     x2,x12,Accept
        simerr  2
        
CaseC:  addi    x12,x12,1
        beq     x2,x12,Accept
        simerr  3

CaseD:  addi    x12,x12,2
        beq     x2,x12,Accept
        simerr  4

Accept:
        # increment return address
        csrr    x30,mepc
        addi    x30,x30,4
        csrw    mepc,x30
        mret

WroteAfterAll:
        simerr  5
