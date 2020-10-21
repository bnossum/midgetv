        // At a stage midgetv had problems with ?
        // This program is nearly the same as t400.S
        // only difference is that we use RVC instructions
        // globally.
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
StartTrap:
        # Should get here with mcause == 11, mepc == adr of ECALL, mtval == 0
        li      x2,11
        lw      x1,%lo(__mcause)(x0)
        bne     x1,x2,1f
        lw      x1,%lo(__mepc)(x0)
        addi    x2,x30,0
        bne     x1,x2,2f
        lw      x1,%lo(__mtval)(x0)
        bnez    x1,3f
        addi    x31,x31,-1
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        la      x30,atECALLunaligned
        mret
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5

        
#ifndef onlyEBR
        .section .text
#endif

_start:

        // Should have code here that checks if RVC is really implemented
        
        li      x31,2
        la      x30,atECALL
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        li      x4,0
        .align 2,0x0001        
atECALL:
        ecall           // 32-bit instr aligned
        c.nop
atECALLunaligned:       
        ecall           // 32-bit instr unaligned
        c.li    x4,3

        li      x1,3
        bne     x1,x4,6f
        .align 2,0x0001
        simend          // simend should be aligned - weakness of simulator
        
        simdump
6:      simerr  6
        
