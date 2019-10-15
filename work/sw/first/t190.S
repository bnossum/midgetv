        # Check some corner-cases regarding bus-error
        #
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif

        # =============================================================================
StartTrap:
        lw      x4,WISHREGOFS(x3)       // Read latency setting
        sw      x0,WISHREGOFS(x3)       // Reset latency of dynamic wishbone register
        bne     x4,x5,1f
        jalr    x0,0(x7)                // Expected result reached
1:      jalr    x0,0(x6)                // Error detected
        

NO_CYCLECNT_eq_1:
        // No cycle counter, so no way to get bus-errors. Simply end        
AllTestsDone:   
        simend
        
        # =============================================================================
_start:
        #
        # First find out if the program is compiled with NO_CYCLECNT == 1
        # If we have no cycle counter, this testprogram can not be used.
        #
        lw      x1,%lo(__mcycle)(x0)
        lw      x2,%lo(__mcycle)(x0)
        add     x1,x1,1
        beq     x1,x2,NO_CYCLECNT_eq_1
        
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)   
        li      x3,IOREGION
        
        #
        # Test lw from an input register with steadily increasing read latency
        #
        li      x1,0x2900               // 
        li      x5,0x2b00               // What last written to DYNWISHREG
        la      x6,Err_Test_LW          // Where to continue in case of unexpected result
        la      x7,Test_LH              // Where to continue after expected exception
Test_LW:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        lw      x4,DYNWISHREGOFS(x3)    // Read dynamic wishbine register. This is the instruction that is tested
        addi    x1,x1,0x100
        j       Test_LW

Test_LH:
        #
        # Test lh, even address and odd addresses, from an input register with steadily increasing read latency
        #
        li      x8,2                    // Byte offset
Test_LH_Loop:   
        li      x1,0x2900               // Latency start value
        li      x5,0x2b00               // What last written to DYNWISHREG
        la      x6,Err_Test_LH          // Where to continue in case of unexpected exception
        la      x7,InTest_LH            // Where to continue after expected exception
Test_LH2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        add     x2,x3,x8                // Address to use
        lh      x4,DYNWISHREGOFS(x2)    // Read. This is the tested instruction.
        addi    x1,x1,0x100
        j       Test_LH2

InTest_LH:
        addi    x8,x8,-2
        bge     x8,x0,Test_LH_Loop

Test_LHU:
        #
        # Test lhu, even address and odd addresses, from an input register with steadily increasing read latency
        #
        li      x8,2                    // Byte offset
Test_LHU_Loop:   
        li      x1,0x2900               // Latency start value
        li      x5,0x2b00               // What last written to DYNWISHREG
        la      x6,Err_Test_LHU         // Where to continue in case of unexpected exception
        la      x7,InTest_LHU           // Where to continue after expected exception
Test_LHU2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        add     x2,x3,x8                // Address to use
        lhu     x4,DYNWISHREGOFS(x2)    // Read. This is the instruction that is tested
        addi    x1,x1,0x100
        j       Test_LHU2

InTest_LHU:
        addi    x8,x8,-2
        bge     x8,x0,Test_LHU_Loop


        
Test_LB:
        #
        # Test lb, address ending in 0b00,0b01,0b10,0b11, from an input register with steadily increasing read latency
        #
        li      x8,3                    // Byte offset
Test_LB_Loop:   
        li      x1,0x2900               // Latency start value
        li      x5,0x2b00               // What last written to DYNWISHREG
        la      x6,Err_Test_LB          // Where to continue in case of unexpected exception
        la      x7,InTest_LB            // Where to continue after expected exception
Test_LB2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        add     x2,x3,x8                // Address to use
        lb      x4,DYNWISHREGOFS(x2)    // Read. This is the instruction that is tested
        addi    x1,x1,0x100
        j       Test_LB2

InTest_LB:
        addi    x8,x8,-1
        bge     x8,x0,Test_LB_Loop

Test_LBU:
        #
        # Test lbu, address ending in 0b00,0b01,0b10,0b11, from an input register with steadily increasing read latency
        #
        li      x8,3                    // Byte offset
Test_LBU_Loop:   
        li      x1,0x2900               // Latency start value
        li      x5,0x2b00               // What last written to DYNWISHREG
        la      x6,Err_Test_LBU         // Where to continue in case of unexpected exception
        la      x7,InTest_LBU           // Where to continue after expected exception
Test_LBU2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        add     x2,x3,x8                // Address to use
        lbu     x4,DYNWISHREGOFS(x2)    // Read. This is the instruction that is tested
        addi    x1,x1,0x100
        j       Test_LBU2

InTest_LBU:
        addi    x8,x8,-1
        bge     x8,x0,Test_LBU_Loop


Test_SW:
        #
        # Test sw to an output register with steadily increasing write latency
        #
        li      x1,0x28
        li      x5,0x2b                 // What last written to DYNWISHREG
        la      x6,Err_Test_SW          // Where to continue in case of unexpected result
        la      x7,Test_SHe             // Where to continue after expected exception
Test_SW2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sw      x1,DYNWISHREGOFS(x3)    // Tested instruction
        addi    x1,x1,1
        j       Test_SW2
        
Test_SHe:
        #
        # Test sh, even address, to an output register with steadily increasing write latency
        #
        li      x1,0x24
        li      x5,0x27                 // What last written to DYNWISHREG
        la      x6,Err_Test_SHe         // Where to continue in case of unexpected result
        la      x7,Test_SHo             // Where to continue after expected exception
Test_SHe2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sh      x1,DYNWISHREGOFS(x3)    // Tested instruction
        addi    x1,x1,1
        j       Test_SHe2
        
Test_SHo:       
        #
        # Test sh, odd address, to an output register with steadily increasing write latency
        #
        li      x1,0x14
        li      x5,0x18                 // What last written to DYNWISHREG
        la      x6,Err_Test_SHo         // Where to continue in case of unexpected result
        la      x7,Test_SB00            // Where to continue after expected exception
Test_SHo2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sh      x1,(DYNWISHREGOFS+2)(x3)// Tested instruction
        addi    x1,x1,1
        j       Test_SHo2
        
Test_SB00:
        #
        # Test sb, address ending in 0b00, to an output register with steadily increasing write latency
        #
        li      x1,0x24
        li      x5,0x27                 // What last written to DYNWISHREG
        la      x6,Err_Test_SB00        // Where to continue in case of unexpected result
        la      x7,Test_SB01            // Where to continue after expected exception
Test_SB00_2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sb      x1,(DYNWISHREGOFS+0)(x3)// Tested instruction
        addi    x1,x1,1
        j       Test_SB00_2
        
Test_SB01:      
        #
        # Test sb, address ending in 0b01, to an output register with steadily increasing write latency
        #
        li      x1,0x1c
        li      x5,0x20                 // What last written to DYNWISHREG
        la      x6,Err_Test_SB01        // Where to continue in case of unexpected result
        la      x7,Test_SB10            // Where to continue after expected exception
Test_SB01_2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sb      x1,(DYNWISHREGOFS+1)(x3)// Tested instruction
        addi    x1,x1,1
        j       Test_SB01_2

Test_SB10:      
        #
        # Test sb, address ending in 0b10, to an output register with steadily increasing write latency
        #
        li      x1,0x14
        li      x5,0x18                 // What last written to DYNWISHREG
        la      x6,Err_Test_SB10        // Where to continue in case of unexpected result
        la      x7,Test_SB11            // Where to continue after expected exception
Test_SB10_2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sb      x1,(DYNWISHREGOFS+2)(x3)// Tested instruction
        addi    x1,x1,1
        j       Test_SB10_2

Test_SB11:
        #
        # Test sb, address ending in 0b11, to an output register with steadily increasing write latency
        #
        li      x1,0xc
        li      x5,0x10                 // What last written to DYNWISHREG
        la      x6,Err_Test_SB11        // Where to continue in case of unexpected result
        la      x7,AllTestsDone         // Where to continue after expected exception
Test_SB11_2:   
        sw      x1,WISHREGOFS(x3)       // Set read/write latency of dynamic wishbone register
        sb      x1,(DYNWISHREGOFS+3)(x3)// Tested instruction
        addi    x1,x1,1
        j       Test_SB11_2


Err_Test_LW:    simerr  0x10
Err_Test_LH:    simerr  0x11
Err_Test_LHU:   simerr  0x12
Err_Test_LB:    simerr  0x13
Err_Test_LBU:   simerr  0x14
Err_Test_SW:    simerr  0x15
Err_Test_SHe:   simerr  0x16
Err_Test_SHo:   simerr  0x17
Err_Test_SB00:  simerr  0x18
Err_Test_SB01:  simerr  0x19
Err_Test_SB10:  simerr  0x1a
Err_Test_SB11:  simerr  0x1b
