        # Check WFI
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
StartTrap:
        simdump
        simerr 8
        
_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        wfi

        simend
        
        # =============================================================================
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
        
