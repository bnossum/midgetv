        # Test rinst interrupt. Only for SRAM where HAS_MINSTRET is defined.
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
        // mepc should be the address of L or L+4.
        // mstatus.mpie should be 1.
        // mstatus.mie  should be 0.
        
        li      x1,__read_mstatus
        lw      x1,0(x1)
        li      x2,0b1100010000000
        //                |   |
        //                |   mie
        //                mpie
        bne     x2,x1,2f

        lw      x1,%lo(__mepc)(x0)
        la      x2,L
        beq     x1,x2,1f
        add     x2,x2,4
        bne     x1,x2,5f
1:      
        // Ensure minstretip == 1
        li      x1,__read_mip
        lhu     x2,2(x1)
        addi    x2,x2,-2
        bne     x2,x0,6f

        // Clear minstretip by writing to minstreth
        li      x3,__write_minstreth
        lw      x2,0(x3)
        addi    x2,x2,1
        sw      x2,0(x3)

        // Ensure minstretip == 0
        lhu     x2,2(x1)
        bne     x2,x0,7f
        
        // return to the address in mepc
        mret
        
        
2:      simerr  2
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
        # =============================================================================
#ifdef onlyEBR
#error Program only for midgetv with SRAM
#endif
        .section .text
_start:
        // Check that we have minstret
        lw      x10,%lo(__read_minstreth)(x0)
        lw      x11,%lo(__read_minstreth)(x0)
        addi    x10,x10,1
        bne     x10,x11,Done
        
        li      x31,0xbabe
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)

        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)

        li      x1,8
        li      x2,__write_mstatus
        sw      x1,0(x2)                // Enable global interrupts
        li      x1,0x20000
        li      x2,__write_mie
        sw      x1,0(x2)                // Enable mrinstret interrupts
        li      x1,0xfffffff0
        sw      x1,%lo(__rinst)(x0)     // Prime rinst so we will soon have an interrupt

L:      lw      x10,%lo(__read_minstreth)(x0)
        beq     x10,x0,L

        // Due to the handle MRET, mpie should now be 1
        li      x1,__read_mstatus
        lw      x1,0(x1)
        andi    x1,x1,0x80
        beq     x1,x0,8f
Done:   
        simend

8:      simerr  8
