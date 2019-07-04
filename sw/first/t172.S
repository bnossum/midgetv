        # Check that fence and fence.i executes as NOP.
        # Visual confirmation needed.
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start: 
        fence
        fence.i
        simend
