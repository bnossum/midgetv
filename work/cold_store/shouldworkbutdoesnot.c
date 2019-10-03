/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
    Rudiments of serial communication.

*/
#include <stdint.h>

#define __mcycle (uint32_t volatile *)0x0000008c

#define UARTTX (uint32_t *)0x60000004 // When write: Bit 0. Leds on bits [3:1].
#define UARTRX (uint32_t volatile *)0x60000004 // When read:  Bit 0

uint32_t g_bitrate;

/////////////////////////////////////////////////////////////////////////////
/* The autobaud character is '?', 0x3F, bitpattern on the line:
 * ___------------------______---
 * S  0  1  2  3  4  5  6  7  F
 *    |                       |
 */
int autobaud( void ) {

        // Wait for falling flank startbit
        while ( *UARTRX & 1 )
                *UARTTX = 3;
        // Wait for rising flank
        while ( (*UARTRX & 1) == 0 )
                *__mcycle = 0;
        // Wait for second falling flank
        while ( *UARTRX & 1 )
                ;
        // Wait for second rising flank
        while ( (*UARTRX & 1) == 0 )
                ;
        return *__mcycle;       
}

/////////////////////////////////////////////////////////////////////////////
void near_putchar( int c ) {
        int i;
        c = (c | 0x100) << 1;

        for ( i = 0; i < 10; i++ ) {
                *__mcycle = 0;
                *UARTTX = c & 1;
                c >>= 1;
                while ( *__mcycle < g_bitrate )
                        ;
        }

//        int a;
//        for ( i = 0; i < 10; i++ ) {
//                *__mcycle = 0;
//                a = *UARTRX;
//                a = (a & 1) << 2;
//                if ( c & 1 ) 
//                        a |= 3;
//                        
//                *UARTTX = a;
//                c >>= 1;
//                while ( *__mcycle < g_bitrate )
//                        ;
//        }

//        c |= 0xffffff00;
//        c <<= 2;
//        
//        while ( c != -1 ) {
//                c /= 2;
//                *__mcycle = 0;
//                *UARTTX = c;
//                while ( *__mcycle < g_bitrate )
//                        ;
//        }
//        while ( *__mcycle < g_bitrate*4 )
//                ;
        return;
}

/////////////////////////////////////////////////////////////////////////////
int near_getchar( void ) {
        int w = g_bitrate + g_bitrate/2;
        int b = 0;
        int n = 0;

        // Wait for falling flank startbit
        while ( *UARTRX & 1 )
                *__mcycle = 0;
        // Wait until in middle of bit
        while ( *__mcycle < w )
                ;
        do {
                if ( *UARTRX & 1 ) {
                        b = (b>>1) | 0x80;
                } else {
                        b = (b>>1);
                }
                w += g_bitrate;
                while ( *__mcycle < w )
                        ;
        } while ( ++n < 8 );
        return b;
}
        

//  /////////////////////////////////////////////////////////////////////////////
//  static void near_puts( const char *s ) {
//          while ( *s ) {
//                  near_putchar( *s );
//                  s++;
//          }
//  }

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        g_bitrate = (autobaud()+4)>>3;
        //*UARTTX = 1;
        while (1) {
                //int a =
                near_getchar();
                *UARTTX = 1;
                near_putchar( 'a' );
                //near_puts( "Hello world!\n" );
        }
}
