        # Check lw, lh, lhu in EBRram and SRAM
        # =============================================================================

#include "midgetv.inc"
        .globl _start
        .org 0x108
StartTrap:
        simerr  44
        
#ifndef onlyEBR
        .section .text
#endif
//.equ START, 0x104

_start:
        lui     x3,%hi(0xf000e000)
        addi    x3,x3,%lo(0xf000e000)
        lui     x4,%hi(0xffffe000)
        lui     x5,%hi(0xfffff000)
        lui     x6,%hi(0x0000e000)
        lui     x7,%hi(0x0000f000)
        lui     x8,%hi(0x00006000)
        lui     x9,%hi(0x00007000)
        la      x1,cteA
        lw      x2,4(x1)        # x2 = 0xf000e000
        bne     x2,x3,1f

        lh      x2,4(x1)        # x2 = (int16_t)0xe000 = 0xffffe000
        bne     x2,x4,2f

        lh      x2,6(x1)        # x2 = (int16_t)0xf000 = 0xfffff000
        bne     x2,x5,3f

        lhu     x2,4(x1)        # x2 = (uint16_t)0xe000 = 0x0000e000
        bne     x2,x6,4f
        
        lhu     x2,6(x1)        # x2 = (uint16_t)0xf000 = 0x0000f000
        bne     x2,x7,5f

        lh      x2,8(x1)        # x2 = (int16_t)0x6000 = 0x00006000
        bne     x2,x8,6f

        lh      x2,10(x1)        # x2 = (int16_t)0x7000 = 0x00007000
        bne     x2,x9,6f

        simend
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
cteA:   .word   0xdeadbeaf
        .word   0xf000e000
        .word   0x70006000
