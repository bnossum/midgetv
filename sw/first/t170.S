        # Check sw and sh
        # =============================================================================
#include "midgetv.inc"
        .globl _start

        .equ    STOREOFS, 0
        
#ifndef onlyEBR
        .section .text
#endif

_start:
        la      x7,inited_data
        lui     x3,%hi(0xdeadbabe)
        addi    x3,x3,%lo(0xdeadbabe)
        lui     x5,%hi(0xaaaababe)
        addi    x5,x5,%lo(0xaaaababe)
        lui     x6,%hi(0xbabe5555)
        addi    x6,x6,%lo(0xbabe5555)
        sw      x3,STOREOFS(x7)       # mem[] = 0xdeadbabe
        lw      x4,STOREOFS(x7)
        bne     x3,x4,1f

        sh      x3,(STOREOFS+4)(x7)   # mem[] = 0xaaaababe
        simdump
        lw      x4,(STOREOFS+4)(x7)
        bne     x5,x4,2f
        
        sh      x3,(STOREOFS+10)(x7)  # mem[] = 0xbabe5555
        lw      x4,(STOREOFS+8)(x7)
        bne     x6,x4,3f
        
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
inited_data:    
        .word 0
        .word 0xaaaa5555
        .word 0xaaaa5555

