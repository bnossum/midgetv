        # Not really a corner case, but debugging of check_illegals
        # =============================================================================
#include "midgetv.inc"
//#include "midgetv_minimal_csr.S"

        .globl _start
        # =============================================================================

        
#ifndef onlyEBR
        .section .text
#endif

        # =============================================================================
        .global nrillegaltraps
nrillegaltraps:        
        .word   0
        
        .extern opcode
        # =============================================================================
#define rtmp x31
VerySimpleTrapHandle:
        li      t5,0                            
        lw      t6,%lo(__mepc)(x0)              // rtmp == faulting address
        addi    t6,t6,4
        sw      t6,%lo(CSRretadr)(x0)
        ij      0,0x100,0                       // Exit

        # =============================================================================

        // Return: 0  rv32i
        //         1  rv32im
        //         2  rv32ic
        //         3  rv32imc
        .global check_what_options
check_what_options:
        // First set a fake trap handler
        la      a0,VerySimpleTrapHandle
        sw      a0,__mtvec,t0
        li      t5,1
        .word   0x02000033              // mul     x0,x0,x0
        addi    a0,t5,0                 // rv32im(c), a0 = 1, 0 otherwise
        j       UnalignedInstr
        ret
        
        .hword  0x0001                  // C.NOP
UnalignedInstr: 
        .hword  0x0001                  // C.NOP
        // Here only if RVC implemented
        ori     a0,a0,2
        ret


_start:        
        call    check_what_options
        simend
        
        // -----------------------------------------------------------------------------
Failed:
        simerr  2
