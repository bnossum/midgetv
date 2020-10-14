        # Read and write of MSTATUS
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
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

        la      x1,NMI          // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)


        // MSTATUS[3] == mie should be readable/writable at address __read_mstatus/__write_mstatus
        // MSTATUS[7] == mpie should be readable/writable at address __read_mstatus/__write_mstatus
        li      x1,__read_mstatus
        li      x2,__write_mstatus

        li      x4,-1           // Test set mpie and mie
        sw      x4,0(x2)
        lw      x5,0(x1)
        li      x6,0x1888        
        bne     x5,x6,3f

        simend



3:      simdump
        simerr  3
4:      simerr  4
        
