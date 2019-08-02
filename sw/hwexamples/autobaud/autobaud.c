/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
    Rudiments of serial communication.

*/
#include <stdint.h>

#define __mcycle (uint32_t volatile *)0x0000008c

#define UARTTX (uint32_t volatile *)0x60000004 // When write: Bit 0. Leds on bits [3:1].
#define UARTRX (uint32_t volatile *)0x60000004 // When read:  Bit 0

/////////////////////////////////////////////////////////////////////////////
void simend( void ) {
#if sim
        exit( fprintf(stderr,"Simend\n" ) );
#else
        __asm__("sltu x0,x0,x0");
#endif
}

/////////////////////////////////////////////////////////////////////////////
void simdump( void ) {
#if sim
        ;
#else
        __asm__("sltu x0,x31,x31");
#endif
}


/////////////////////////////////////////////////////////////////////////////
/* The autobaud character is '?', 0x3F, bitpattern on the line:
 * ___------------------______---
 * S  0  1  2  3  4  5  6  7  F
 *    |                       |
 */
uint32_t autobaud( void ) {
        // Wait for falling flank startbit
        while ( *UARTRX & 1 )
                ;
        // Wait for rising flank
        do {
                *__mcycle = 0;
        } while ( (*UARTRX & 1) == 0 );
        
        // Wait for second falling flank
        while ( *UARTRX & 1 )
                ;
        // Wait for second rising flank
        while ( (*UARTRX & 1) == 0 )
                ;
        return *__mcycle;
}

/////////////////////////////////////////////////////////////////////////////
void near_putchar( uint32_t bitrate, int c ) {
        int n = bitrate;
        c = (c | 0x100) << 1;
        c &= 0x3ff;

        *__mcycle = 0;
        while ( c ) {
                *UARTTX = c;
                c >>= 1;
                while ( *__mcycle < n )
                        ;
                n += bitrate;
        }
        return;
}
        
/////////////////////////////////////////////////////////////////////////////
int near_getchar( uint32_t bitrate ) {
        uint32_t w = bitrate + bitrate/2;
        int b = 0;
        int n = 8;

        while ( (*UARTRX & 1) == 0 )
                ; // Previous transaction, I cheat on frame bit.
        // Wait for falling flank startbit
        while ( *UARTRX & 1 )
                *__mcycle = 0;
        do {
                while ( *__mcycle < w )
                        ;
                if ( *UARTRX & 1 ) {
                        b = (b>>1) | 0x80;
                } else {
                        b = (b>>1);
                }
                w += bitrate;
        } while ( --n > 0 );
        return b;
}

/////////////////////////////////////////////////////////////////////////////
static void near_puts( const uint32_t bitrate, const char *s ) {
        while ( *s ) {
                near_putchar( bitrate, *s );
                s++;
        }
}


/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int a = 32;
        *UARTTX = 1;
        uint32_t bitrate = autobaud()/8;

        near_puts( bitrate, "Hello. I am a parrot:" );
        while (1) {
                a = near_getchar(bitrate);
                near_putchar( bitrate, a+1);
                simdump();
                simend();
                //++a;
                //if ( a > 127 )
                //        a = 32;
        }
}

