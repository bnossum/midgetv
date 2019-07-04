        # Access SRAM with sw,lw from EBR
        #===========================================================
#include "midgetv.inc"
        .globl _start

        // From EBR
_start:
        la      x1,HopefullySram
        li      x3,0xbeef3210
        lw      x2,4(x1)        # Hopefully reads 0xbeef3210
        bne     x2,x3,1f

        sw      x1,8(x1)        # Hopefully stores 0xffff0000 to 0xffff0008
        lw      x2,8(x1)        # Hopefully reads 0xffff0000
        bne     x1,x2,2f
        simend 

1:      simerr  1
2:      simerr  2
        
#ifdef onlyEBR
#error This program only for midgetv with SRAM
#endif
        .section .text
        .word   0x76543210
DefunctSramCode:     
        .section .data
        lw      x2,8(x1)       
        bne     x1,x2,3f
        simerr  111
        
3:      simerr  3

HopefullySram:
        .word   0x76543210
        .word   0xbeef3210
        .word   0xfedcba98


