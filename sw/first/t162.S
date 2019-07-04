        # Read and write of MIE
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

        li      x1,__read_mie
        li      x2,__write_mie

        // mie should be ..0xx0000x000x000x000
        // i = 7;
        // while ( i ) {
        //         mie = i;
        //         if ( mie != (i & 0x30888) )
        //                 error();
        //         i <<= 1;
        // }
        li      x3,7
        li      x5,0x30888
Top:
        sw      x3,0(x2)        // mie = i
        lw      x7,0(x1)        // x7 = mie
        and     x8,x5,x3        // i & 0x30888
        bne     x7,x8,3f        //    mie != i & 0x30888 ?
        slli    x3,x3,1         // i <<= 1;
        bne     x3,x0,Top
        simend
        

3:      simdump
        simerr  3
