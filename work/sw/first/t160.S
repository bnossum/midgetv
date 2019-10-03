        # Simplified example handle for misaligned lw/lh/lhu.
        # =============================================================================
#include "midgetv.inc"
#define NoCSR_exception 0
#include "midgetv_minimal_csr.S"

        .globl _start
        # =============================================================================
Al_mepc_trap_x0:.word   0
trap_x1:        .word   0
trap_x2:        .word   0
trap_x3:        .word   0
        
StartTrap:
        // Should get here with mcause == 4, load address misaligned
        sw      x1,%lo(trap_x1)(x0) 
        sw      x2,%lo(trap_x2)(x0)
        sw      x3,%lo(trap_x3)(x0)

        lw      x1,%lo(__mcause)(x0)
        li      x2,4
        bne     x1,x2,UncoveredTrap

        /* Read value we want using two consequtive lw accesses
         * But before we do that, we should stack the interrupt
         * status, because we may get a buserror if we just fall
         * out of an IO region. Presently I do not do this, this
         * example is large enough as it is. But I must stack mepc
        */
        lw      x1,%lo(__mepc)(x0)
        sw      x1,%lo(Al_mepc_trap_x0)(x0)
        lw      x1,%lo(__mtval)(x0)     // Unaligned address
        andi    x2,x1,0xfffffffc        // Aligned
        lw      x3,4(x2)                // Need 8, 16, or 24 bits of this -- 
        lw      x2,0(x2)                // Need 8, 16, or 24 bits of this
        andi    x1,x1,3                 // 1    (r4<<24) | (r3>>8) 
        slli    x1,x1,3                 // 2    (r4<<16) | (r3>>16)
        srl     x2,x2,x1                // 3    (r4<< 8) | (r3>>24)
        neg     x1,x1
        addi    x1,x1,32
        sll     x3,x3,x1
        or      x3,x3,x2                // Value in x3
        lw      x1,%lo(Al_mepc_trap_x0)(x0)
        sw      x1,%lo(__mepc)(x0)
        // One of:
        // lh   ...001xxxxx0000011       .001xxxx
        // lw   ...010xxxxx0000011       .010xxxx
        // lhu  ...101xxxxx0000011       .101xxxx
        lw      x1,%lo(__mepc)(x0)
        lb      x1,1(x1)
        andi    x2,x1,0x20
        bnez    x2,trap_unaligned_lw
        li      x2,0xffff
        and     x3,x3,x2                // Truncate value to 16 bits
        andi    x2,x1,0x40
        bnez    x2,trap_unaligned_lhu
        li      x2,0x8000

        xor     x3,x3,x2
        sub     x3,x3,x2                // Sign-extend half-word
trap_unaligned_lhu:
trap_unaligned_lw:
        lw      x1,%lo(__mepc)(x0)
        lhu     x1,0(x1)
        srl     x1,x1,5
        andi    x1,x1,0x7c              // Destination register of lw
        li      x2,4*3
        bgt     x1,x2,NotStacked
        addi    x1,x1,%lo(Al_mepc_trap_x0)
NotStacked:     
        sw      x3,0(x1)                // Store to destination register

IgnoreLoadAccesFault:
        // Modify return address
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        
        // Restore working registers and return
        lw      x3,%lo(trap_x3)(x0)
        lw      x2,%lo(trap_x2)(x0)
        lw      x1,%lo(trap_x1)(x0)
        mret

UncoveredTrap:
#ifndef onlyEBR
        // Ignore Load Access Fault
        li      x2,5
        beq     x1,x2,IgnoreLoadAccesFault
#endif        
        simdump
        simerr  32
        
#ifndef onlyEBR
        .section .text
#endif
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
8:      simerr  8
9:      simerr  9
        
        
_start:
        la      x1,StartTrap            // Set up the exception handle
        sw      x1,%lo(__mtvec)(x0)
        la      x1,A_33221100
        
        // Check unaligned lw
        lw      x16,1(x1)
        li      x3,0x44332211
        li      x8,LEDREG
        sw      x3,0(x8)                // For a test at the end
        bne     x16,x3,1b

        lw      x14,2(x1)
        li      x5,0x55443322
        bne     x5,x14,2b

        lw      x3,3(x1)
        li      x4,0x66554433
        bne     x3,x4,3b

        // Check unaligned lhu
        lhu     x7,1(x1)
        li      x6,0x00002211
        bne     x6,x7,4b

        lhu     x4,3(x1)
        li      x2,0x00004433
        bne     x4,x2,5b

        // Check unaligned lh
        lh      x3,1(x1)
        li      x6,0x00002211
        bne     x6,x3,6b

        lh      x3,3(x1)
        li      x6,0x00004433
        bne     x6,x3,7b

        lh      x23,7(x1)
        li      x24,0xffff8877
        bne     x24,x23,8b

        lh      x23,9(x1)
        li      x24,0xffffaa99
        bne     x24,x23,9b

#ifndef onlyEBR
        // Test falling off the edge of an input operation due to alignment fault.
        // Where we have cyclecounter, and subsequently can find a bus error,
        // this is feasible. Here we first trigger an alignment fault. In the 
        // exception handle we will then subsequently get a bus error.
        lw      x25,1(x8)
#endif        
        simend

        .section .data
A_33221100:
        .word   0x33221100
        .word   0x77665544
        .word   0xbbaa9988

