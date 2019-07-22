        # Principle of the internal ISR.
        # This file is a note, not for testing and execution.
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
StartTrap:
        simerr  1

        # =============================================================================
InternalISR:
        /* Inevitably, interrupt latency sucks in midgetv. The overhead in this
         * ISR preprocessing routine is from 20 to 23 instructions. Assume 6 cpi,
         * this give around 200 clock cycles latency.
         * For my "hidden" interrupt sources, the processing time is between 28 and 39
         * instructions for mtimeinc. Hence a performance hit of around 180 to 240 cycles
         * each 0x4000 cycles, around 240/0x4000*100 = 1.5% If we assume a clock frequency
         * of 16 MHz, and want a time resolution of around 10 ms, we want an interrupt
         * at 100 Hz, or 160000 instructions. The closest is interrupts each 0x20000
         * instructions, (MTIMETAP = 17) at 122 Hz. Overhead is then around
         * 100*240/0x20000 = 0.2% Acceptable.
         *
         * The ISR should be something like this (assumes MTIMETAP = 14):
         *
	 * void ISR( void ) {
	 *        if ( mtimeincip && mtimeincie ) {
	 *                if ( (_mcycle & 0xffffc000) = 0 )                 
	 *                        _mcyvcleh++; // overflow in mcycle
	 *                if ( ++_mtime == 0 ) // Clears mtimeincip
	 *                        ++_mtimeh;
	 *                if ( (mtimeh > mtimecmph) ||
	 *                     (mtimeh == mtimecmh &&
	 *                      mtime >= mtimecmp ) ) {
	 *                        // Post timer interrupt
	 *                        __write_bit_mtip = 0x80;
	 *                }
	 *                return; // Must return, for timer interrupts have lowest 
         *                        // priority, and we may have pending external or
         *                        // software interrupts.
	 *        }
	 *        if ( minstretip ) {
	 *                minstreth++; // Clears minstrethip
	 *                return;
	 *        }
	 *
	 *        if ( meip && meie ) {
	 *                mcause = 11 | 0x80000000;
	 *                goto TrapHandle;
         *                // It is the responsability of the trap handle
         *                // to write to the external device that give interrupts.
	 *        }
	 *        if ( msip && msie ) {
	 *                mcause = 3 | 0x80000000;
	 *                goto TrapHandle;
         *                // It is the responsability of the trap handle
         *                // to clear msip after the software interrupt is processed.
	 *        }
	 *        if ( mtip && mtie ) {
	 *                mcause = 7 | 0x80000000; 
	 *                goto TrapHandle;
         *                // It is the responsability of the trap handle
         *                // to write ti mtimecmp, this clears mtip.
	 *        }
	 *}
         */      

        // First store working registers. Because interrupts and csr emulation
        // is mutually exclusive, we can use the same locations.
        sw      x1,%lo(_ex_rCSRadr)(x0)
        sw      x2,%lo(_ex_rCSRty)(x0)
        li      x1,__read_mip
        lw      x1,0(x1)
        li      x2,__read_mie
        lw      x2,0(x2)
        and     x1,x2,x1
        li      x2,0x10000
        and     x2,x1,x2
        bne     x2,x0,ISR_mtimeinc      // 10
        li      x2,0x20000              // 11
        and     x2,x1,x2                // 12
        bne     x2,x0,ISR_minstret      // 13
        andi    x2,x1,0xfffff800        // 14
        bne     x2,x0,ISR_meie          // 15
        andi    x2,x1,8                 // 16
        beq     x2,x0,ISR_mtip          // 17
ISR_msip:       
        li      x1,3                                    // 18   meie
Join1:                                                  // 
        li      x2,0x80000000                           // 19   18
        or      x1,x1,x2                                // 20   19
        sw      x1,%lo(__mcause)(x0)                    // 21   20
        // Restore registers, continue at Trap                      mtip
        lw      x2,%lo(_ex_rCSRty)(x0)                  // 22   21  20
        lw      x1,%lo(_ex_rCSRadr)(x0)                 // 23   22  21
        ij      0,0x0a4+0,0 // From internalISR to trap // 24   23  22
ISR_meie:
        li      x1,11                                   //      16  
        j       Join1                                   //      17  
ISR_mtip:                                               //          mtip
        li      x1,7                                    //          18
        j       Join1                                   //          19
        
ISR_minstret:                                           // minstret
        li      x1,__write_minstreth                    // 14
        lw      x2,0(x1)                                // 15
        addi    x2,x2,1                                 // 16   mtimeinc
        sw      x2,0(x1)        // Clears minstretip    // 17   shortest
Join2:  // Restore registers, return                    //      path    longest path
        lw      x2,%lo(_ex_rCSRty)(x0)                  // 18   26      37
        lw      x1,%lo(_ex_rCSRadr)(x0)                 // 19   27      38
        mret                                            // 20   28      39

ISR_mtimeinc:
        lw      x1,%lo(__mcycle)(x0)                    //      11      11
        li      x2,0xffffc000                           //      12      12
        and     x2,x2,x1                                //      13      13
        beq     x2,x0,1f                                //      14      15
        lw      x1,%lo(_mcycleh)(x0)                    //              16
        addi    x1,x1,1                                 //              17
        sw      x1,%lo(_mcycleh)(x0)                    //              18
1:
        lw      x1,%lo(_mtime)(x0)                      //      15      19
        addi    x1,x1,1                                 //      16      20
        sw      x1,%lo(_mtime)(x0) // Clears mtimeincip //      17      21
        lw      x2,%lo(changeme_mtimeh)(x0)             //      18      22
        bne     x1,x0,1f                                //      19      23
        addi    x2,x2,1                                 //              24
        sw      x2,%lo(changeme_mtimeh)(x0)             //              25
1:
        sw      x3,%lo(_ex_rrs1)(x0)                    //      20      26
        lw      x3,%lo(_mtimecmph)(x0)                  //      21      27
        bgtu    x3,x2,PostTimerInterrupt                //      22      28
        bne     x3,x2,end_ISR_mtimeinc                  //      23      29
        lw      x3,%lo(_mtimecmp)(x0)                   //              30
        bltu    x3,x1,end_ISR_mtimeinc                  //              31
PostTimerInterrupt:             
        li      x1,__write_bit_mtip                     //              32
        li      x2,0x80                                 //              33
        sw      x2,0(x1)                                //              34
end_ISR_mtimeinc:       
        lw      x3,%lo(_ex_rrs1)(x0)                    //      24      35
        j       Join2                                   //      25      36
        
        # =============================================================================
#ifndef onlyEBR
        .section .text
#endif
_start:
        simend
