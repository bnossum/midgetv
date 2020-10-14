        # Check an illegal instruction
        # =============================================================================
#include "midgetv.inc"
        .globl _start
        # =============================================================================
StartTrap:
        lw      x1,%lo(__mcause)(x0)    // Check that trap cause is "illegal instruction"
        li      x2,2
        bne     x1,x2,1f
        lw      x1,%lo(__mepc)(x0)      // Check that mepc holds the address of the illegal instruction
        la      x2,offending
        bne     x1,x2,2f
        lw      x1,%lo(__mtval)(x0)     // Check that mtval is written to 0
        bne     x1,x0,3f

        bne     x31,x0,Done             // If we have no system registers, the test is done
        li      x4,__read_mstatus
        lw      x4,0(x4)                // Want to check MIE == 0
        li      x5,0x00001800           //  but here also check MSTATUS as expected
        bne     x4,x5,4f

Done:   simend

        # =============================================================================
        // This trap handle to see if this midgetv has no system registers.
NoSysRegTrap:  
        lw      x1,%lo(__mcause)(x0)
        li      x31,5
        bne     x1,x31,5f      // ? Don't understand this
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        mret

        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7

#ifndef onlyEBR
        .section .text
#endif
        

        # =============================================================================
_start:
        // To make this test flexible, we must distinguish if midgetv has system
        // registers implemented or not.
        // Write mstatus, specifically set the MIE field
        li      x1,8
        li      x2,__write_mstatus
        sw      x1,0(x2)
        la      x1,NoSysRegTrap
        sw      x1,%lo(__mtvec)(x0)
        li      x3,__read_mstatus
        li      x31,0
        lw      x4,0(x3)
        // I use x31 to show if this midgetv has system registers or not.
        // x31 == 0 : Has system registers
        // x31 != 0 : No system registers.

        // Now for the test (the setup is perhaps a bigger test!)
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        sw      x1,%lo(__mtval)(x0)     // Soil mtval to check that the trap will actually clear it
        
offending:     
        .word 0xdeadbabe

        
