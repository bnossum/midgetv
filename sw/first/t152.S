        # Check load from input port
        # =============================================================================
#include "midgetv.inc"

        .globl _start
        # =============================================================================
StartTrap: # Not taken
        simerr 33
        

#ifndef onlyEBR
        .section .text
#endif

_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        li      x1,SLOWREGADR

        lb      x2,0(x1)        # we always read 0xffffffbe
        li      x3,0xffffffbe
        bne     x2,x3,1f

        lb      x2,1(x1)        # we always read 0xffffffba
        li      x3,0xffffffba
        bne     x2,x3,2f

        lb      x2,2(x1)        # we always read 0xffffffad
        li      x3,0xffffffad
        bne     x2,x3,3f

        lb      x2,3(x1)        # we always read 0xffffffde
        li      x3,0xffffffde
        bne     x2,x3,4f

        lbu     x2,0(x1)        # we always read 0xbe
        li      x3,0xbe
        bne     x2,x3,11f

        lbu     x2,1(x1)        # we always read 0xba
        li      x3,0xba
        bne     x2,x3,12f

        lbu     x2,2(x1)        # we always read 0xad
        li      x3,0xad
        bne     x2,x3,13f

        lbu     x2,3(x1)        # we always read 0xde
        li      x3,0xde
        bne     x2,x3,14f

        lh      x2,0(x1)        # we always read 0xffffbabe
        li      x3,0xffffbabe
        bne     x2,x3,21f

        lh      x2,2(x1)        # we always read 0xffffdead
        li      x3,0xffffdead
        bne     x2,x3,22f

        lhu     x2,0(x1)        # we always read 0xbabe
        li      x3,0xbabe
        bne     x2,x3,31f

        lhu     x2,2(x1)        # we always read 0xdead
        li      x3,0xdead
        bne     x2,x3,32f

        lw      x2,0(x1)        # we always read 0xdeadbabe
        li      x3,0xdeadbabe
        bne     x2,x3,41f
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
11:     simerr  0x11
12:     simerr  0x12
13:     simerr  0x13
14:     simerr  0x14
21:     simerr  0x21
22:     simerr  0x22
31:     simerr  0x31
32:     simerr  0x32
41:     simerr  0x41
