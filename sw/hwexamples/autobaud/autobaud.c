/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
*/
#include <stdint.h>
#include "midgetv.h"

#define DBGLED(x) do { LED->D = (x); } while (1)

#define HALT(x) while (1) {DBGLED(x);}
//#define HALT(x)

/////////////////////////////////////////////////////////////////////////////
uint32_t autobaud( void ); 
void near_putchar( int c );
int near_getchar( void );

/////////////////////////////////////////////////////////////////////////////
uint32_t g_bitrate;


/////////////////////////////////////////////////////////////////////////////
static void near_puts( const char *s ) {
        while ( *s ) {
                near_putchar( *s );
                s++;
        }
}


/////////////////////////////////////////////////////////////////////////////
void clumsyhexprint( const uint32_t ab ) {
        int i,a;

        for ( i = 7; i >= 0; i-- ) {
                a = ab >> (i*4);
                a &= 15;
                if ( a < 10 ) {
                        near_putchar( '0'+a );
                } else {
                        near_putchar( 'a'-10 + a );
                }
        }
}

///////////////////////////////////////////////////////////////////////////////
//static void simend( void ) {
//#if sim
//        exit( fprintf(stderr,"Simend\n" ) );
//#else
//        __asm__("sltu x0,x0,x0");
//#endif
//}
//
///////////////////////////////////////////////////////////////////////////////
//static void simdump( void ) {
//#if sim
//        ;
//#else
//        __asm__("sltu x0,x31,x31");
//#endif
//}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int a;

        UART->D = 0x80000001;

        uint32_t ab = autobaud();
        // Not here
//        HALT(7);
        
        g_bitrate = ab/8;

        near_puts( "Cycles per 8bits: 0x" );
        clumsyhexprint(ab);
        near_putchar( '\n' );
        while (1) {
                a = near_getchar();
                near_putchar(a);
        }
}

/////////////////////////////////////////////////////////////////////////////
__inline void simend( void ) {
        __asm__("sltu x0,x0,x0");
}

/////////////////////////////////////////////////////////////////////////////
/* The autobaud character is '?', 0x3F, bitpattern on the line:
 * ___------------------______---
 * S  0  1  2  3  4  5  6  7  F
 *    |                       |
 *
 * The number of cycles needed per bit is known to +/- 2 cycles. 
 * With a 12 MHz clock, at 115200 bps, each bit should nominally 
 * need 104 cycles. Normally USART communications succeed when one
 * is inside a +/- 2.5% frequency limit.
 */
uint32_t autobaud( void ) {
        uint32_t atstart;

        // Wait for falling flank startbit
        simend();
        while ( UART->D )
                ;
        // Wait for rising flank
        while ( UART->D == 0 )
                ;
        // Start of rising flank known  with uncertainty 0-15 cycles.
        atstart = SYSEBR->mcycle; 

        // Wait for second falling flank
        while ( UART->D )
                ;
        // Wait for second rising flank
        while ( UART->D == 0 )
                ;
        // Start of rising flank known  with uncertainty 0-15 cycles.
        // Number of cycles needed for 8 bit times is know to -15 / 15 cycles.
        return SYSEBR->mcycle - atstart;
}

/////////////////////////////////////////////////////////////////////////////
void near_putchar( int c ) {
        uint32_t n = g_bitrate;
        c = (c | 0x100) << 1;
        c &= 0x3ff;

        SYSEBR->mcycle = 0;
        while ( c ) {
                UART->D = c | 0x80000000;
                c >>= 1;
                while ( SYSEBR->mcycle < n )
                        ;
                n += g_bitrate;
        }
}

/////////////////////////////////////////////////////////////////////////////
int near_getchar( void ) {

        while ( UART->D == 0 )
                ; // Possibly in previous transaction, I cheat on frame bit.

// Wait for falling flank startbit
//        while ( UART->D  )
//                SYSEBR->mcycle = 0;
// The following give shorter code:
        while ( (SYSEBR->mcycle = UART->D) )
                ;
                
        uint32_t w = g_bitrate/2;
        int b = 0;
        int n = 1;

        do {
                w += g_bitrate;
                while ( SYSEBR->mcycle < w )
                        ;
                if ( UART->D ) 
                        b |= n;
                n = n + n; // GCC naturally selects a "slli x14,x14,1" here. But "add x14,x14,x14" would have been better in midgetv.
        } while ( n != 0x100 );
        return b;
}

