        # Testcase for issue #10, mcycle was reset at taken branch
        # The error was that mcycle was not read the microcode cycle before it was
        # written.
        # 
        # ttime is written in microcode cycle Fetch2 and eFetch2. All microcode
        # instructions that preceeds any Fetch2 or eFetch2 must read mcycle. This is:
        # Fetch, eFetch, BrOpFet, 
        # =============================================================================

#include "midgetv.inc"
        .globl _start
        # =============================================================================
StartTrap: # Not taken
        simerr 2
#ifndef onlyEBR
        .section .text
#endif

_start:
        // Ensure mcycle gets a "high" value at around 120 when NO_CYCLECNT == 0
        // When NO_CYCLECNT == 1, mcycle will get a rather low value of around 4,
        // but this is still enough to have a valid test
#ifndef onlyEBR
        li      x2,120
#else
        li      x2,3
#endif        
        slli    x1,x1,31
        slli    x1,x1,31
        slli    x1,x1,31
        lw      x1,%lo(__mcycle)(x0)

        // Check that mcycle fundamentally works
        bltu    x1,x2,Err

        // Previous branch was not taken, check that mcycle survived a non-taken branch
        lw      x1,%lo(__mcycle)(x0)
        bgeu    x1,x2,ShouldBeTaken
        simerr  3

ShouldBeTaken:  
        // Previous branch was taken, check that mcycle survived a taken branch
        lw      x1,%lo(__mcycle)(x0)
        bltu    x1,x2,Err2
        
        // All good
        simend

Never:
Err:    simerr  31
Err2:   simerr  33
        
