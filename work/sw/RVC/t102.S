        # Check c.add and an unaligned 32-bit instruction
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

        #===========================================================
        .word 0x1234567
_start:
        li      x28,280
        li      x16,-130
        c.add   x28,x16
        li      x1,150
        li      x2,203
        li      x4,3            # Back to aligned
        bne     x28,x1,1f       # 32-bit instr
        addi    x4,x4,200
        bne     x4,x2,2f
        simend 

1:      simerr  1
2:      simerr  2
