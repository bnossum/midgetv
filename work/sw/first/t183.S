        # Check lw, lh, lb from output port
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif
_start:        
        // -----------------------------------------------------------------------------
        // Set trap handler address
//        la      x1,_trap_handler
//        csrrw   x0,mtvec,x1
        
        li      x1,LEDREG

        // test aligned LW
//        lw      x2,0x88(x0)     // PC as a comparison in trace
        lw      x2,0(x1)        
        li      x3,0xdeadbabe
        bne     x2,x3,2f

        // test aligned LHU
//        lhu     x2,0x88(x0)     // PC as a comparison in trace
        lhu     x2,0(x1)        
        li      x3,0xbabe
        bne     x2,x3,3f

        lhu     x2,2(x1)        
        li      x3,0xdead
        bne     x2,x3,4f

        // test aligned LH
        lh      x2,0(x1)
        li      x3,0xffffbabe
        bne     x2,x3,5f

        lh      x2,2(x1)
        li      x3,0xffffdead
        bne     x2,x3,6f

        // test LBU
        lbu     x2,0(x1)        
        li      x3,0xbe
        bne     x2,x3,7f

        lbu     x2,1(x1)        
        li      x3,0xba
        bne     x2,x3,8f

        lbu     x2,2(x1)        
        li      x3,0xad
        bne     x2,x3,9f

        lbu     x2,3(x1)        
        li      x3,0xde
        bne     x2,x3,10f

        // test LB
        lb      x2,0(x1)        
        li      x3,0xffffffbe
        bne     x2,x3,11f

        lb      x2,1(x1)        
        li      x3,0xffffffba
        bne     x2,x3,12f

        lb      x2,2(x1)        
        li      x3,0xffffffad
        bne     x2,x3,13f

        lb      x2,3(x1)        
        li      x3,0xffffffde
        bne     x2,x3,14f

        
        simend

        // -----------------------------------------------------------------------------
        // Exception handler
_trap_handler:
        simerr 111
        


1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
8:      simerr  8
9:      simerr  9
10:     simerr  10
11:     simerr  11
12:     simerr  12
13:     simerr  13
14:     simerr  14
15:     simerr  15
16:     simerr  16
17:     simerr  17
18:     simerr  18
19:     simerr  19

