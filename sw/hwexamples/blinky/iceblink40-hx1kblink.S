        # Hardwaretest on upduino board
        # Just enough to get anything at all on hardware.
	# 
	#  2312  python ../../../apio/apio clean
	#  2313  python ../../../apio/apio build
	#  2314  sudo python3 ../../../iceBurn/iCEburn.py -v -ew hardware.bin 
	#  2315  history 
	# bnossum@x230b:~/GITSTUFF/GIT/midgetv/tsthw/iceblink40-hx1k$ 
        #
        # =============================================================================
#define magic_start _start
#define magic_trap  StartTrap
#define magic_NMI   NMI
#define magic_x2    0x400
#include "midgetv2.inc"
//#include "midgetv_minimal_csr.S"

        
        .globl _start
//        # =============================================================================
//StartTrap:
//        simerr  1
//
//        # =============================================================================
//NMI:
//        simerr  99
//InternalISR:
//        simerr  2
//        
//        # =============================================================================
#ifndef onlyEBR
//        .section .text
#endif
        
StartTrap:
        li      x2,4 
        j       2f
        
NMI:
        j       _NMI
InternalISR:
        li      x2,2 
        li      x2,0
2:
        li      x1,SLOWREGADR
        sw      x2,0(x1)
Halt:   j       Halt

_NMI:
        li      x2,8 
        j       2b

_start:        
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)
        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)

Continue:       
        li      x1,SLOWREGADR
        addi    x3,x3,-2
        sw      x3,0(x1)                // To LEDs
        li      x4,0x1000
L:      addi    x4,x4,-1
        bne     x4,x0,L
        simend
        j       Continue
