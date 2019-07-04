        # Check sb
        # =============================================================================
#include "midgetv.inc"
        .globl _start

        .equ    STOREOFS, 0
        .equ    CHECKOFS, 16
        
#ifndef onlyEBR
        .section .text
#endif
        
_start:
        la      x20,inited_data
        addi    x9,x0,0x55

        sb      x9,(STOREOFS+0)(x20) 
        lw      x1,(STOREOFS+0)(x20)
        lw      x2,(CHECKOFS+0)(x20)
        bne     x1,x2,1f
        
        sb      x9,(STOREOFS+5)(x20)   
        lw      x1,(STOREOFS+4)(x20)
        lw      x2,(CHECKOFS+4)(x20)
        bne     x1,x2,2f
        
        sb      x9,(STOREOFS+10)(x20) 
        lw      x1,(STOREOFS+8)(x20)
        lw      x2,(CHECKOFS+8)(x20)
        bne     x1,x2,3f
        
        sb      x9,(STOREOFS+15)(x20) 
        lw      x1,(STOREOFS+12)(x20)
        lw      x2,(CHECKOFS+12)(x20)
        bne     x1,x2,4f
        
        simend
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
inited_data:    
        .word 0xffffffff
        .word 0xffffffff
        .word 0xffffffff
        .word 0xffffffff
        
        .word 0xffffff55
        .word 0xffff55ff
        .word 0xff55ffff
        .word 0x55ffffff
