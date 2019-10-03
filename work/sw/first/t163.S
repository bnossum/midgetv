        # Read and write of MIP
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
#ifndef onlyEBR
        .section .text
#endif
_start:
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)

        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)

        // MIP[3] == msip should be readable/writable at address __read_mip/__write_mip
        // MIP[7] == mtip should be readable/writable at address __read_mip/__write_bit_mtip
        li      x1,__read_mip
        li      x2,__write_mip
        li      x3,__write_bit_mtip

        li      x4,-1           // Test set msip
        sw      x4,0(x2)
        lw      x5,0(x1)
        addi    x5,x5,-8
        bne     x5,x0,3f

        sw      x4,0(x3)        // Test set mtip
        lw      x5,0(x1)
        li      x6,0x88
        bne     x5,x6,4f
        simend



3:      simdump
        simerr  3
4:      simerr  4
        
