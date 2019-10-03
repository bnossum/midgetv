        # Check load address misaligned for lhu, part 2
        # =============================================================================
#include "midgetv.inc"
        .globl _start
        # =============================================================================
StartTrap:
        # Should get here with mcause == 4, mepc == _offending, mtval == 3
        addi    x2,x0,4
        lw      x1,%lo(__mcause)(x0)
        bne     x1,x2,1f
        lw      x1,%lo(__mepc)(x0)
        la      x2,offending
        bne     x1,x2,2f
        lw      x1,%lo(__mtval)(x0)
        addi    x2,x0,3
        bne     x1,x2,3f
// More work?
//#ifndef onlyEBR
//        csrrc   x4,mstatus,x0   # Essentially check MIE == 0
//        li      x5,0x00001800   # but here also check MSTATUS as expected
//        bne     x4,x5,4f
//#endif        
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5

#ifndef onlyEBR
        .section .text
#endif

_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
offending:     
        lhu     x0,3(x0)
6:      simerr  6
