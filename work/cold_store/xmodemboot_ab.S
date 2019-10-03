STALE. I have changed pinning on the bitbang uart.

/*  =========================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =========================================================================
*/
/////////////////////////////////////////////////////////////////////////////
        
#define IOBASE 0x60000
#define UARTOFS 8
#define mcyclelo 140
#define bitrate 0xe8
        
        .globl autobaud
        .globl near_putchar
        .globl near_getchar
        .globl near_getchar_TO

/////////////////////////////////////////////////////////////////////////////
/* uint32_t autobaud( void ); 
 * Wait for reception of character '?' to time the transmission speed of
 * a bitbang UART. The cycle counter must be included in midgetv for this
 * to work. Interrupts must be disabled. 
 *
 * Return value:
 *     Returns the number of clock cycles needed for reception of 8 databits.
 *     +/- 15 cycles. This is then 15/8 = 2 clock cycles uncertainty per
 *     data bit.
 *        
 * The autobaud character is '?', 0x3F, bitpattern on the line:
 * ___------------------______---
 * S  0  1  2  3  4  5  6  7  F
 *    |                       |
 *
 * The number of cycles needed per bit is known to +/- 2 cycles. 
 * With a 12 MHz clock, at 115200 bps, each bit should nominally 
 * need 104 cycles. Normally USART communications succeed when one
 * is inside a +/- 2.5% frequency limit.
 *
 *   01   Any of these characters can be used to
 *   03   perform autobaud.
 *   07
 *   0f
 *   1f
 *   3f
 *   7f
 *
 */ 
halt:
        lui     x14,IOBASE
        sw      x1,4(x14) 
        j       halt
        
autobaud:
        lui     x14,IOBASE
1:      lw      x15,UARTOFS(x14)        // while ( UART->D )
        bne     x15,x0,1b               //      ;
1:      lw      x15,UARTOFS(x14)        // while ( UART->D == 0)
        beq     x15,x0,1b               //      ;
        
        lw	x13,mcyclelo(x0)        // atstart = SYSEBR->mcycle;
1:      lw      x15,UARTOFS(x14)        // while ( UART->D )
        bne     x15,x0,1b               //      ;
1:      lw      x15,UARTOFS(x14)        // while ( UART->D == 0)
        beq     x15,x0,1b               //      ;
        lw      x10,mcyclelo(x0)        // retval = SYSEBR->mcycle;
        sub     x10,x10,x13             // retval = SYSEBR->mcycle - atstart;
        jalr    x0,0(x1)                // return retval

/////////////////////////////////////////////////////////////////////////////
// Not a real improvement over the 'C' version.
near_putchar:
        addi    x14,x0,0                // n = 0;
        add     x10,x10,x10             // 
        ori     x10,x10,512             // c = ((c | 0x100)<<1);
        lui     x12,IOBASE
        sw      x0,mcyclelo(x0)         // SYSEBR->mcycle = 0
Loop:   sw      x10,UARTOFS(x12)        // UART->D = c;
        andi    x10,x10,1023            // Safety. c &= 0x3ff
        srai    x10,x10,1               // c >>= 1;
        lw      x13,bitrate(x0)
        add     x14,x14,x13             // n += bitrate;
1:      lw      x13,mcyclelo(x0)        //
        bltu    x13,x14,1b              // while ( SYSEBR->mcycle < n ) ;
        bne     x10,x0,Loop
        jalr    x0,0(x1)


/////////////////////////////////////////////////////////////////////////////
// Assuming:
//  o this code executes in EBR
//  o the counter of retired instructions is included:
//  o Read latency of the UART RX pin is 1
//
// Detailed analysis below show we only need 66 cycles from startbit detected to D.0 sampled.
// For each loop of sampling, we have 100 cycles available. We use 60 cycles.
// Finally an assessment on how back-to-back near_getchar():
//     After last databit D.7 is sampled, the routine uses          47 cycles
//     When entering, until checking if we have start of startbit:  39 cycles
// Nominally we samply D.7 in the middle of the window, and will then have 150 cycles until
// we must detect the start of the new startbit. We use 86 cycles, and have 64 cycles available
// to do whatever housekeeping is needed. An example:
// while ( p != p_end ) {
//    a = near_getchar();
//    *p++ - a;
// }
//
// L:      jal     x1,near_getchar //  7   
//         sw      x10,0(x9)       // 10
//         addi    x9,x9,4         //  5
//         bne     x9,x8,L         //  8
//                                 // --
//                                 // 30
//
// Worst case correct reception mean we sample D.7 at the extreme end of the window,
// 50 cycles late. We then will have 100 cycles available until we must detect start
// of the new startbit. This leaves just 14 cycles, or < 2 instructions. Too little.
// But the loop-example above show that we may accept sampling up to 34 cycles to late.
// This should be within the error margins of autodetect.
        
//near_getchar:
//        lui     x14,IOBASE              //            5
//1:      lw      x15,UARTOFS(x14)        //            9 while ( UART->D == 0 ) ; // previous transaction
//        beq     x15,x0,1b               //            8
//
//1:      lw      x15,UARTOFS(x14)        //            9           
//        bne     x15,x0,1b               //            8 while not startbit
//        //                              //           --
//        // From here we have 150 cycles //           39 
//        // to sampling should occur
//        sw      x0,mcyclelo(x0)         //  7           SYSEBR->mcycle = 0
//        li      x10,0                   //  5           b = 0
//        li      x11,1                   //  5           n = 1
//        lw      x12,bitrate             //  6
//        
//        srli    x13,x12,1               //  8           w = g_bitrate/2
//        li      x16,0x100               //  5
//
//Top:    add     x13,x13,x12             //  6    6      w += g_bitrate
//1:      lw      x15,mcyclelo(x0)        //  7    7      
//        bltu    x15,x13,1b              //  8    8      while ( SYSEBR->mcycle < w ) ;
//                                                        
//        lw      x15,UARTOFS(x14)        //  9    9    9  
//        //                              // --           
//        //                              // 66           cycles from detection startbit to sampling D.0
//        //                              //              
//        beq     x15,x0,1f               //       8    8 if ( UART->D )
//        or      x10,x10,x11             //       8    8   b |= n;
//1:      add     x11,x11,x11             //       6    6  n = n + n;
//        bne     x11,x16,Top             //       8    8
//        jalr    x0,0(x1)                //      --    8
//        //                              //      60   -- cycles while looping
//        //                                           47 cycles after sampling D.7


/////////////////////////////////////////////////////////////////////////////
// Assuming:
//  o this code executes in EBR
//  o the counter of retired instructions is included:
//  o Read latency of the UART RX pin is 1
//
// Detailed analysis below show we need 79 cycles from startbit detected to D.0 sampled.
// For each loop of sampling, we have 100 cycles available. We use 60 cycles.
// Finally an assessment on how back-to-back near_getchar():
//     After last databit D.7 is sampled, the routine uses          47 cycles
//     When entering, until checking if we have start of startbit:  52 cycles
// Nominally we samply D.7 in the middle of the window, and will then have 150 cycles until
// we must detect the start of the new startbit. We use 99 cycles, and have 51 cycles available
// to do whatever housekeeping is needed. An example:
// while ( p != p_end ) {
//    a = near_getchar_TO();
//    *p++ - a;
// }
//
// L:      mv      x10,x24            //  5 (load timeout constant)
//         jal     x1,near_getchar_TO //  7   
//         sw      x10,0(x9)          // 10
//         addi    x9,x9,4            //  5
//         bne     x9,x8,L            //  8
//                                    // --
//                                    // 35
//
// Worst case correct reception mean we sample D.7 at the extreme end of the window,
// 50 cycles late. We then will have 100 cycles available until we must detect start
// of the new startbit. This leaves just 1 cycle. Too little.
// But the loop-example above show that we may accept sampling up to 21 cycles to late.
// This should be within the error margins of autodetect.
        
near_getchar:
        li      x10,0x7ffff000          // Near max timeout, around 1h 47min
near_getchar_TO:
        lui     x14,IOBASE              //            5
1:      lw      x15,UARTOFS(x14)        //            9 while ( UART->D == 0 ) ; // previous transaction
        beq     x15,x0,1b               //            8

1:
        addi    x10,x10,-1              //            5                      //  5  We detect the startbit
        blt     x10,x0,Abort            //            8                      //  8  and set mcycle from 7 
        lw      x15,UARTOFS(x14)        //            9                      //  9  to 38 cycles to late.
        bne     x15,x0,1b               //            8 while not startbit   //  9  Hence compensation
        //                              //           --                      // --
        // From here we have 150 cycles //           52                      // 31
        // to sampling should occur                                          // +7 = 38
        sw      x0,mcyclelo(x0)         //  7           SYSEBR->mcycle = 0
        li      x10,0                   //  5           b = 0
        li      x11,1                   //  5           n = 1
        lw      x12,bitrate(x0)         //  6
        
        srli    x13,x12,1               //  8           w = bitrate/2
        li      x16,0x100               //  5
        addi    x13,x13,-22             //  5           Compensates for late startbit detection        
Top:    add     x13,x13,x12             //  6    6      w += bitrate
1:      lw      x15,mcyclelo(x0)        //  7    7      
        bltu    x15,x13,1b              //  8    8      while ( SYSEBR->mcycle < w ) ;
                                                        
        lw      x15,UARTOFS(x14)        //  9    9    9  
        //                              // --           
        //                              // 71           cycles from detection startbit to sampling D.0
        //                              //              
        beq     x15,x0,1f               //       8    8 if ( UART->D )
        or      x10,x10,x11             //       8    8   b |= n;
1:      add     x11,x11,x11             //       6    6  n = n + n;
        bne     x11,x16,Top             //       8    8
Abort:  jalr    x0,0(x1)                //      --    8
        //                              //      60   -- cycles while looping
        //                                           47 cycles after sampling D.7
                 
