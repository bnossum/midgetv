        // At a stage midgetv had problems with EBREAK, and with C.EBREAK at address
        // ending in 0b..10
        // 
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
        .option norvc
StartTrap:
        # Should get here with mcause == 3, mepc == adr of EBREAK, mtval == 0
        li      x2,3
        lw      x1,%lo(__mcause)(x0)
        bne     x1,x2,1f
        lw      x1,%lo(__mepc)(x0)
        bne     x1,x30,2f
        lw      x1,%lo(__mtval)(x0)
        bnez    x1,3f
        lw      x1,%lo(__mepc)(x0)
        // Find out if we are here due to EBREAK or C.EBRAK
        lbu     x2,0(x1)
        and     x2,x2,1         // 0 if C.EBREAK, 1 if EBREAK
        add     x2,x2,x2        // 0 if C.EBREAK, 2 if EBREAK
        addi    x2,x2,2         // 2 if C.EBREAK, 4 if EBREAK
        add     x1,x1,x2
        sw      x1,%lo(__mepc)(x0)
        mret
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simend
        
#ifndef onlyEBR
        .section .text
#endif

_start:

        // Should have code here that checks if RVC is really implemented
        li      x31,2
        la      x30,atEBREAK
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
offending:     
atEBREAK:        
        .align 2,0x0001
        ebreak          // 32-bit instr, aligned
        .hword  0x0001  // C.NOP
        la      x30,atEBREAKunaligned
atEBREAKunaligned:
        ebreak          // 32-bit instr, unaligned
        .hword  0x0001  // C.NOP

        // Now for the compressed variants
        la      x30,atC_EBREAK_aligned
        .option rvc
atC_EBREAK_aligned:
        c.ebreak

        la      x30,atC_EBREAK_unaligned
        .align 2,0x01 // Expands to c.addi x2,0, opcode 0x0101
        c.nop
atC_EBREAK_unaligned:   
        c.ebreak

        // So here we are aligned
        simend
