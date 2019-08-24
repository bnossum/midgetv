        # Principle of the internal ISR.
        # This file is a note, not for testing and execution.
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        #define MTIMETAP 17
        
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
         * The InternalISR should be something like this:
         *
	 * void InternalISR( void ) {
	 *        if ( mtimeincip && mtimeincie ) {
	 *                if ( (_mcycle & ~((1u << MTIMETAP)-1)  == 0 ) 
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
         *       
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
         *
	 *        if ( msip && msie ) {
	 *                mcause = 3 | 0x80000000;
	 *                goto TrapHandle;
         *                // It is the responsability of the trap handle
         *                // to clear msip after the software interrupt is processed.
	 *        }
         *
	 *        if ( mtip && mtie ) {
	 *                mcause = 7 | 0x80000000; 
	 *                goto TrapHandle;
         *                // It is the responsability of the trap handle
         *                // to write to mtimecmp(h), this clears mtip.
	 *        }
	 * }
         *
         */      

        // First store two working registers. Because interrupts and csr 
        // emulation are mutually exclusive, we can use the same locations.
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
        andi    x2,x1,0x80              // 16
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
        ij      0,0x0a4+0,0                             // 24   23  22                   From internalISR to trap
ISR_meie:
        li      x1,11                                   //      16  
        j       Join1                                   //      17  
ISR_mtip:                                               //          mtip
        li      x1,7                                    //          18
        j       Join1                                   //          19
        
ISR_minstret:                                           // minstret
        li      x1,(__write_minstreth & 0xfffff000)     // 14
        lw      x2,(__write_minstreth & 0x000007ff)(x1) // 15
        addi    x2,x2,1                                 // 16   mtimeinc
        sw      x2,(__write_minstreth & 0x000007ff)(x1) // 17   shortest                Clears minstretip
Join2:  // Restore registers, return                    //      path    longest path
        lw      x2,%lo(_ex_rCSRty)(x0)                  // 18   27      37
        lw      x1,%lo(_ex_rCSRadr)(x0)                 // 19   28      38
        mret                                            // 20   29      39

ISR_mtimeinc:
        lw      x1,%lo(__mcycle)(x0)                    //      11      11
        li      x2,~((1<<MTIMETAP)-1)                   //      12      12
        and     x2,x2,x1                                //      13      13
        bne     x2,x0,1f                                //      14      15
        lw      x1,%lo(__mcycleh)(x0)                   //              16
        addi    x1,x1,1                                 //              17
        sw      x1,%lo(__mcycleh)(x0)                   //              18
1:
        li      x2,(__write_mtime & 0xfffff000)         //      15      19
        lw      x1,(__write_mtime & 0x00000fff)(x2)     //      16      20
        addi    x1,x1,1                                 //      17      21
        sw      x1,(__write_mtime & 0x00000fff)(x2)     //      18      22              Clears mtimeincip
        lw      x2,%lo(changeme_mtimeh)(x0)             //      19      23
        bne     x1,x0,1f                                //      20      24
        addi    x2,x2,1                                 //              25
        sw      x2,%lo(changeme_mtimeh)(x0)             //              26
1:
        sw      x3,%lo(_ex_rrs1)(x0)                    //      21      27
        lw      x3,%lo(__mtimecmph)(x0)                 //      22      28
        bgtu    x3,x2,PostTimerInterrupt                //      23      29
        bne     x3,x2,end_ISR_mtimeinc                  //      24      30
        lw      x3,%lo(__mtimecmp)(x0)                  //              31
        bltu    x3,x1,end_ISR_mtimeinc                  //              32
PostTimerInterrupt: // Data written to __write_bit_mtip is irrelevant
        li      x1,(__write_bit_mtip & 0xfffff000)      //              33
        sw      x0,(__write_bit_mtip & 0x00000fff)(x1)  //              34
end_ISR_mtimeinc:       
        lw      x3,%lo(_ex_rrs1)(x0)                    //      25      35
        j       Join2                                   //      26      36
        
        # =============================================================================
#ifndef onlyEBR
        .section .text
#endif
_start:
        simend
