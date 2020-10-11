/*
 * With microcode options that retired instruction counter is 
 * implemented, but no multiplier, nore RVC, I ran into problems
 * with misaligned jumps. Unfortunately it worked during
 * simulation, so I must examine this in detail.
 * The code below is based on the RISCV-V compliance thest (copyright).
 */
# RISC-V Compliance Test I-MISALIGN_JMP-01
#
# Copyright (c) 2017, Codasip Ltd.
# Copyright (c) 2018, Imperas Software Ltd. Additions
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the Codasip Ltd., Imperas Software Ltd. nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Codasip Ltd., Imperas Software Ltd.
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Specification: RV32I Base Integer Instruction Set, Version 2.0
# Description: Testing MISALIGNED JUMP exception.

#include "dynmidgetv.inc"
        .section .DYNEBRram, "a"
        .option norelax
        .globl _start
        .extern main
        
        // The linker script will write EBR ram from location 0xb4. There are fixed addresses
        // to obey, so the start here is:
x__mepc:         .word 0                 // 0xb4 10110100  0x2d For exception handling
x__mcause:       .word 0                 // 0xb8 10111000  0x2e For exception handling
x__mtval:        .word 0                 // 0xbc 10111100  0x2f For exception handling
x__mscratch:     .word 0                 // 0xc0 Used by CSR code
x__misa:         .word 0x40800105        // 0xc4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32. RVC implemented
x_ex_dup_x0:     .word 0 		// 0xc8 | Used by CSR emulation. These
x_ex_rCSRadr:    .word 1 		// 0xcc | locations must be consequtive
x_ex_rCSRty:     .word 2 		// 0xd0 | 
x_ex_rrs1:       .word 3 		// 0xd4 | 
x_ex_rrd:        .word 4 		// 0xd8 | 
x_ex_rtmp:       .word 5 		// 0xdc | 
x_mtime:         .word 0 		// 0xe0 Read/write from user code. Updated by internal interrupt
x_mtimeh:        .word 0 		// 0xe4 Read/write from user code. Updated by internal interrupt
x__freefornow_e8:.word 0                 // 0xe8 By convention used to store bitrate
x__minstreth:    .word 0 		// 0xec Read/write from user code. Updated by internal interrupt
x__mcycleh:      .word 0 		// 0xf0 Read/write from user code. Updated by internal interrupt
x__freefornow_f4:.word 0                 // 0xf4 By convention used by compliance test code
x__mtimecmp:     .word 0xffffffff	// 0xf8 Read/write from user code. 
x__mtimecmph:    .word 0xffffffff	// 0xfc Read/write from user code. 
//        .org 0x100  			//
        // In the event of any exception, or CSR instruction, count on LEDs and hang.
CSRretadr:      .word 0                 //0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen
        nop
NMI:
        nop
InternalISR:

//        .text
// The following works if in SRAM, fails in EBR.
//_start:        
//1:
//        li      x1,LEDREG
//        addi    x3,x3,1
//        sw      x3,0(x1)                // To LEDs
//        li      x14,0xfff00000
//2:      addi    x14,x14,0x1             // Reise for delay loop
//        bne     x14,x0,2b 
//        j       1b


        // The same for this one, works in SRAM, fails in EBR.
        // strange because bne and beq is used by mb.S (midget_blast)
        .text
_start:        
1:
        li      x1,LEDREG
        addi    x3,x3,1
        sw      x3,0(x1)                // to leds
        li      x14,0xfff00000
2:      addi    x14,x14,0x1             // reise for delay loop
        bne     x14,x0,2b
        beq     x14,x0,1b



        
//_start:
        sw      x10,0xe8(x0);           // Transfer bitrate back to expected location after loading
//        li      x2,0xfffffffc           // Initiate stack pointer

        la      x1,NMI                  // Set up the internal ISR handle (not used)
        sw      x1,%lo(__rNMI_IIV)(x0)

        // Fake trap handler
        la      a0,NMI
        sw      a0,%lo(__mtvec)(x0)
        //        tail    main
        j       main
        
//#include "compliance_test.h"
//#include "compliance_io.h"
//#include "test_macros.h"
//
//# Test Virtual Machine (TVM) used by program.
//RV_COMPLIANCE_RV32M
//
//# Test code region
//RV_COMPLIANCE_CODE_BEGIN
//
//    RVTEST_IO_INIT
//    RVTEST_IO_ASSERT_GPR_EQ(x30, x0, 0x00000000)

#define RVTEST_IO_WRITE_STR(dummy,_STR)         \
        .section .data.string;                  \
1:;                                             \
        .string _STR;                           \
        .section .text;                         \
        .align 2;                               \
        addi    sp,sp,-8;                       \
        sw      ra,0(sp);                       \
        sw      a0,4(sp);                       \
        la      a0,1b;                          \
        call    puts;                           \
        lw      a0,4(sp);                       \
        lw      ra,0(sp);                       \
        
//        .section thesram
        .global main
main:
        li      a0,1
        li      a1,LEDREG
        sw      a0,0(a1)
  //      call    getchar
//        li      a0,1
//        li      a1,LEDREG
//        sw      a0,0(a1)
//    RVTEST_IO_WRITE_STR(x30, "# Test Begin Reserved reg x31\n")
        j      main
        
//     # Save and set trap handler address
//     la x1, _trap_handler
//     csrrw x31, mtvec, x1
// 
//     # switch off C
//     csrrci   x0, misa, 4
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part A1 - test JAL\n");
// 
//     # Address for test results
//     la      x1, test_A1_res_exc
// 
//     # Test
//     li      x2, 0x11111111
//     jal     x0, 1f + 2
//     li      x2, 0
// 1:
// 
//     //
//     // Assert
//     //
//     RVTEST_IO_CHECK()
//     RVTEST_IO_WRITE_STR(x30, "# Test part A1  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part A2 - test JALR - NOT causing the exception\n");
// 
//     # Address for test results
//     la      x1, test_A2_res
// 
//     # Test
//     li      x2, 0x22222222
//     la      x4, 1f + 1
//     jalr    x0, x4, 0
//     li      x2, 0
// 1:
//     sw      x2, 0(x1)
//     addi    x1, x1, 4
// 
//     li      x2, 0x33333333
//     la      x4, 1f
//     jalr    x0, x4, 1
//     li      x2, 0
// 1:
//     sw      x2, 0(x1)
//     addi    x1, x1, 4
// 
//     li      x2, 0x44444444
//     la      x4, 1f
//     jalr    x0, x4, -3
//     li      x2, 0
// 
//     sw      x2, 0(x1)
// 1:
//     addi    x1, x1, 4
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part A2  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part A3 - test JALR - causing the exception\n");
// 
//     # Address for test results
//     la      x1, test_A3_res_exc
// 
//     # Test
//     li      x2, 0x55555555
//     la      x4, 1f + 2
//     jalr    x0, x4, 0
//     li      x2, 0
// 1:
// 
//     li      x2, 0x66666666
//     la      x4, 1f + 3
//     jalr    x0, x4, 0
//     li      x2, 0
// 1:
// 
//     # Test
//     li      x2, 0x77777777
//     la      x4, 1f
//     jalr    x0, x4, 2
//     li      x2, 0
// 1:
// 
//     li      x2, 0x88888888
//     la      x4, 1f
//     jalr    x0, x4, 3
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part A3  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B1 - test BEQ\n");
// 
//     # Address for test results
//     la      x1, test_B1_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     beq     x5, x6, 1f + 2
//     li      x2, 0x99999999
// 1:
//     nop
//     nop
//     beq     x5, x5, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part A4  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B2 - test BNE\n");
// 
//     # Address for test results
//     la      x1, test_B2_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     bne     x5, x5, 1f + 2
//     li      x2, 0xAAAAAAAA
// 1:
//     nop
//     nop
//     bne     x5, x6, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part A5  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B3 - test BLT\n");
// 
//     # Address for test results
//     la      x1, test_B3_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     blt     x6, x5, 1f + 2
//     li      x2, 0xBBBBBBBB
// 1:
//     nop
//     nop
//     blt     x5, x6, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part B  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B4 - test BLTU\n");
// 
//     # Address for test results
//     la      x1, test_B4_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     bltu    x6, x5, 1f + 2
//     li      x2, 0xCCCCCCCC
// 1:
//     nop
//     nop
//     bltu    x5, x6, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part C  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B5 - test BGE\n");
// 
//     # Address for test results
//     la      x1, test_B5_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     bge     x5, x6, 1f + 2
//     li      x2, 0xDDDDDDDD
// 1:
//     nop
//     nop
//     bge     x6, x5, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part D  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     RVTEST_IO_WRITE_STR(x30, "# Test part B6 - test BGEU\n");
// 
//     # Address for test results
//     la      x1, test_B6_res_exc
// 
//     # Register initialization
//     li      x5, 5
//     li      x6, 6
// 
//     # Test
//     bgeu    x5, x6, 1f + 2
//     li      x2, 0xEEEEEEEE
// 1:
//     nop
//     nop
//     bgeu    x6, x5, 1f + 2
//     li      x2, 0
// 1:
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part E  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     # restore mtvec and jump to the end
//     csrw mtvec, x31
//     jal x0, test_end
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test part A1  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
//     # Exception handler
// _trap_handler:
//     # increment return address
//     csrr    x30, mtval
//     addi    x30, x30, -2
//     csrw    mepc, x30
// 
//     # store low bits of mtval
//     csrr    x30, mtval
//     andi    x30, x30, 3
//     sw      x30, 0(x1)
// 
//     # Store MCAUSE
//     csrr    x30, mcause
//     sw      x30, 4(x1)
// 
//     # Store data from test
//     sw      x2, 8(x1)
// 
//     # increment data_exc address
//     addi    x1, x1, 12
// 
//     # return
//     mret
//     RVTEST_IO_WRITE_STR(x30, "# Test part A2  - Complete\n");
// 
//     # ---------------------------------------------------------------------------------------------
// 
// test_end:
//     RVTEST_IO_WRITE_STR(x30, "# Test part A3  - Complete\n");
// 
//     RVTEST_IO_WRITE_STR(x30, "# Test End\n")
// 
//  # ---------------------------------------------------------------------------------------------
//     # HALT
//     RV_COMPLIANCE_HALT
// 
// RV_COMPLIANCE_CODE_END
// 
// # Input data section.
//     .data
//     .align 4
// 
// 
// # Output data section.
// RV_COMPLIANCE_DATA_BEGIN
//     .align 4
// 
// test_A1_res_exc:
//     .fill 3, 4, -1
// test_A2_res:
//     .fill 3, 4, -1
// test_A3_res_exc:
//     .fill 12, 4, -1
// test_B1_res_exc:
//     .fill 3, 4, -1
// test_B2_res_exc:
//     .fill 3, 4, -1
// test_B3_res_exc:
//     .fill 3, 4, -1
// test_B4_res_exc:
//     .fill 3, 4, -1
// test_B5_res_exc:
//     .fill 3, 4, -1
// test_B6_res_exc:
//     .fill 3, 4, -1
// 
// RV_COMPLIANCE_DATA_END

/////////////////////////////////////////////////////////////////////////////
/* Bitbang a character to the USART                
 * At entry:
 * ra   Return address
 * a0   character to output
 * At exit:
 * a0   corrupted
 * Requires: 
 *    sp legal and 2 free words of stack.
 *    mcycle implemented
 *    bitrate present in 0x000000e8
 *
 * As a convenience, a '\n' may be output as '\r\n'
 */
        .global putchar
putchar: 
        addi    sp,sp,-8
        sw      t0,0(sp)                // Store t0
        sw      t1,4(sp)                // Store t1
        slli    a0,a0,1                 // c <<= 1
        andi    a0,a0,1023              // c |= 0x3ff;
        ori     a0,a0,512               // c |= 0x200;
#if DOS_CRLF                
        li      t1,512 + 20             // Outputs '\n' ?
        bne     t1,a0,1f                // No

        li      a0,13                   // '\r'
        mv      t1,ra                   // save
        jal     ra,putchar              // Recurse
        mv      ra,t1                   // restore
        li      a0,512 + 20             // restore
#endif        
1:      
        lw      t0,0xe8(x0)             // __freefornow_e8(x0) is bitrate
        slli    t0,t0,4                 // t = bitrate*16;
        lw      t1,0x8c(x0)             // n = mcycle
        add     t0,t0,t1                // t = bitrate*16 + n;
        bgeu    t0,t1,2f                // if ( t >= n ) goto L2;
        addi    t0,x0,100               // t = 100;                                        
1:      //                                 L1:;
        lw      t1,0x8c(x0)             // n = mcycle;
        bltu    t0,t1,1b                // if ( 100 < mcycle ) goto L1;
2:      //                                 L2:;
        lui     t0,0x60000              //
        sw      a0,8(t0)                // UART->D = c;
        srai    a0,a0,1                 // c >>= 1;
        lw      t0,0xe8(x0)             // __freefornow_e8(x0) // 
        add     t1,t1,t0                // n += bitrate;
3:      //                                 L4:;
        lw      t0,0x8c(x0)             // tt = mcycle;;
        bltu    t0,t1,3b                // if ( mcycle < b ) goto L3;
        bne     a0,x0,2b                // if ( c ) goto L2;
putchar_tail2:                 
        lw      t1,4(sp)                // Restore t1
putchar_tail1:         
        lw      t0,0(sp)                // Restore t0
        addi    sp,sp,8                 // Restore SP
        jalr    x0,0(ra)                // Return

/* Write a string to the UART
 * 
 * At entry:
 * ra   Return address
 * a0   Points to string to output
 * At exit:
 * a0   corrupted
 * Requires: 
 *    sp legal and +2 free words of stack.
 */
        .global puts
puts:         
        addi    sp,sp,-8                // Make space to store registers used
        sw      t0,0(sp)                // Store t0
        sw      ra,4(sp)                // Store return adrress
        mv      t0,a0                   // char *p = s;  
        j       2f                      // do {
1:      jal     ra,putchar              //     bn_asm_putchar(c);
        addi    t0,t0,1                 //     s++;
2:      lbu     a0,0(t0)                //     c = *s;
        bne     a0,x0,1b                // } while ( c );
        lw      ra,4(sp)                // Restore return address
        lw      t0,0(sp)                // Restore t0
        addi    sp,sp,8                 // Restore sp
        jalr    x0,0(ra)                // Return

        .global getchar
getchar:
        addi    sp,sp,-20 
        sw      t0,0(sp)
        sw      t1,4(sp)
        sw      t2,8(sp)
        sw      t3,12(sp)
        sw      t4,16(sp)
        li      t4,1                    // Bitmask
        lw      t3,0xe8(x0)             // Bitrate
        srli    t3,t3,1                 // Bitrate/2
        lui     t0,0x60000              // Wait until RX high.
1:      lw      a0,8(t0)                // We may possibly be in the previous transaction, 
        beq     a0,x0,1b                // because we cheat on the frame bit.
1:      lw      a0,8(t0)                // Wait until RX low, the start bit (also clears a0).
        bne     a0,x0,1b                // When the startbit was detected,
        lw      t1,0x8c(x0)             // mcycle has a specific value
2:      lw      t2,0xe8(x0)             // Bitrate
        add     t3,t3,t2                // When to sample
1:      lw      t2,0x8c(x0)
        sub     t2,t2,t1                // Delta time
        bltu    t2,t3,1b                // Wait for a specific time, 1.5 or 1 bit time
        lw      t2,8(t0)                // Sample RX
        beq     t2,x0,1f
        or      a0,a0,t4
1:      add     t4,t4,t4                // Shift bitmask
        addi    t2,t4,-0x100            // Sampled 8 bits?
        bne     t2,x0,2b                // 
        lw      t4,16(sp)
        lw      t3,12(sp)
        lw      t2,8(sp)
        addi    sp,sp,12
        jump    putchar_tail2,t0
//        lw      t1,4(sp)
//        lw      t0,0(sp)
//        addi    sp,sp,20
//        ret

        
        .global puthex32
puthex32:       
// In:   a0 value to write
//       ra Return address        
        addi    sp,sp,-12
        sw      t0,0(sp)
        sw      t1,4(sp)
        sw      ra,8(sp)
        mv      t0,a0
        li      t1,28
1:      srl     a0,t0,t1
        andi    a0,a0,0xf        
        li      ra,10
        blt     a0,ra,2f
        addi    a0,a0,'a'-'0'-10
2:      addi    a0,a0,'0'
        jal     ra,putchar
        addi    t1,t1,-4
        bge     t1,x0,1b
        lw      ra,8(sp)
        lw      t1,4(sp)
        lw      t0,0(sp)
        addi    sp,sp,12
        ret

