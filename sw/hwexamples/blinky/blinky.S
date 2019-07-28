        # Blinky on iceblinck40-hx1k and upduino2 boards
        # =============================================================================        
#include "midgetv.inc"
        .globl _start
_start:        
        li      x1,SLOWREGADR
        addi    x3,x3,-2
        sw      x3,0(x1)                // To LEDs
//        li      x4,0x1000     // Suitable for iceblinck40-hx1k with a 330 kHz clock
//        li      x4,0x10000    // Suitable for iceblinck40-hx1k with a 3.3 MHz clock
        li      x4,0x80000      // Suitable for iceblink40-hx1kblink with a 33 MHz clock, 
L:      addi    x4,x4,-1
        bne     x4,x0,L
        simend
        j       _start
