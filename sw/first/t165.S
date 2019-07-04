        # Test software interrupt
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
        // mepc should be the address of T.
        // mstatus.mpie should be 1.
        // mstatus.mie  should be 0.
        simdump
        
        li      x1,__read_mstatus
        lw      x1,0(x1)
        li      x2,0b1100010000000
        //                |   |
        //                |   mie
        //                mpie
        bne     x2,x1,2f

        lw      x1,%lo(__mepc)(x0)
        la      x2,T
        bne     x1,x2,5f

        // The instruction after sw interrupt should not be executed
        bne     x30,x0,6f
        simend
        
        
        
2:      simerr  2
4:      simerr  4
5:      simerr  5
6:      simerr  6
        
        # =============================================================================
#ifndef onlyEBR
        .section .text
#endif
_start:
        li      x31,0xbabe
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)

        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)

        li      x1,8
        li      x2,__write_mstatus
        sw      x1,0(x2)                // Enable global interrupts
        li      x2,__write_mie
        sw      x1,0(x2)                // Enable software interrupts
        li      x2,__write_mip
        sw      x1,0(x2)                // Request software interrupt. 

T:      mv      x30,x31                 // Is interrupted. Can't say "simerr 3" here,
                                        // the simulator evaluates "simerr 3" before
                                        // the INT has had effect. However, we
                                        // ensure all is right by examining x30
        simerr  3

