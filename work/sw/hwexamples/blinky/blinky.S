        # Blinky on iceblinck40-hx1k, upduino2 and icebreaker boards 
        # =============================================================================        
#include "midgetv.inc"
        .globl _start
_start:        
        li      x1,LEDREG
        addi    x3,x3,-1
        andi    x3,x3,7     
        sw      x3,0(x1)                // To LEDs
//        li      x4,0x1000     // Suitable for iceblinck40-hx1k with a 330 kHz clock
//        li      x4,0x10000    // Suitable for iceblinck40-hx1k with a 3.3 MHz clock
          li      x4, 0x40000      // Suitable for iceblink40-hx1kblink with a 33 MHz clock, upduino2 with a 12 Mhz clock
//        li      x4,0x400000      
L:      addi    x4,x4,-1
        simend
        bne     x4,x0,L
        j       _start
