#include <stdio.h>
#include "midgetv.h"

/////////////////////////////////////////////////////////////////////////////
void near_putchar( int c ) {
        uint32_t n = SYSEBR->bitrate;
        c = (c | 0x100) << 1;
        c &= 0x3ff;

        SYSEBR->mcycle = 0;
        while ( c ) {
                UART->D = c;
                c >>= 1;
                while ( SYSEBR->mcycle < n )
                        ;
                n += SYSEBR->bitrate;
        }
}


/////////////////////////////////////////////////////////////////////////////
int near_getchar_TO( uint32_t tolim ) {
        uint32_t w = SYSEBR->bitrate/2;
        int b = 0;
        int n = 1;
        volatile uint32_t to = 0;

        while ( UART->D == 0 )
                ; // Possibly in previous transaction, I cheat on frame bit.

        // Wait for falling flank startbit
        while ( (SYSEBR->mcycle = UART->D) != 0 ) {
                if ( ++to > tolim )
                        return -1;
        }
                
        do {
                w += SYSEBR->bitrate;
                while ( SYSEBR->mcycle < w )
                        ;
                if ( UART->D ) 
                        b |= n;
                n = n + n; // GCC naturally selects a "slli x14,x14,1" here. But "add x14,x14,x14" would have been better in midgetv.
        } while ( n != 0x100 );
        return b;
}

/////////////////////////////////////////////////////////////////////////////
int near_getchar( void ) {
        return near_getchar_TO( 0x7ffff000 );
}

/////////////////////////////////////////////////////////////////////////////
/* puts add a newline, and returns a nonnegative number on success.
 * No newline, and returns length of string.
 */
static int near_puts( const char *s ) {
        int i = 0;
        while ( *s ) {
                near_putchar( *s );
                s++;
                i++;
        }
        return i;
}


/////////////////////////////////////////////////////////////////////////////
int isprint( int c ) {
        return ( (c >= 0x20) && (c < 0x7F) );
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

/////////////////////////////////////////////////////////////////////////////
void dump( uint32_t *p, uint32_t len ) {
        p = (uint32_t *)((uint32_t) p & ~3u);
        uint32_t *e = p + len/4;
        uint8_t *q;
        
//        near_puts( "\r\n" );
//        clumsyhexprint( (uint32_t)e );
//        near_puts( "\r\n" );
        do {
                near_puts( "\r\n" );
                clumsyhexprint( (uint32_t)p );
                near_puts( " | " );

                q = (uint8_t *)p;
                do {
                        clumsyhexprint( *p );
                        near_putchar( ' ' );
                        p++;
                } while ( ((uint32_t)p & 0x1c) != 0 );

                while ( q != (uint8_t *)p ) {
                        int c = *q++;
                        if ( isprint(c) ) {
                                near_putchar( c );
                        } else {
                                near_putchar( '.' );
                        }
                }
                        

        } while ( p != e );
        near_puts( "\r\n" );
}

// -----------------------------------------------------------------------------
void dumpEBR( void ) {
        dump( 0, 0x400 );
}

// -----------------------------------------------------------------------------
int main( void ) {
        int i = 0;
        int j;
        
        LED->D = 4;
        LED->D = 7;

        near_getchar();
        near_puts( "Visitor: Welcome to midgetv on an icebreaker board\n\r"
                   "There is not much this test program can do\n\r"
                   "Commands: (D)ump start of EBR. (L)x write leds\n\r"
                   "Bitratevalue: "
                );
        clumsyhexprint( SYSEBR->bitrate );
        near_puts( "\r\n" );
        while (1) {
                i = near_getchar();
                j = i | 0x40; // downcase
                if ( j == 'd' ) {
                        dumpEBR();
                } else if ( j == 'l' ) {
                        LED->D = near_getchar();
                } else {
                        near_putchar( i );
                        //near_puts( "?\r\n" );
                }
        }
}

