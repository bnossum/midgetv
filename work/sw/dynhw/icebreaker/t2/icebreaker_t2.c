//#include <stdio.h>
#include <stdint.h>
#include "midgetv.h"

/////////////////////////////////////////////////////////////////////////////
// Dummy stream
#define stdout (void *)4

typedef struct {
        uint32_t dummy;
} FILE;

/////////////////////////////////////////////////////////////////////////////
int fputc( int c, FILE *stream __attribute__((unused)) ) {
        uint8_t r = c;
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
        return r;
}
#define putc( c,s ) fputc(c,s)
#define putchar(c) putc(c,stdout)

/////////////////////////////////////////////////////////////////////////////
int getchar_TO( uint32_t tolim ) {
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
int getchar( void ) {
        return getchar_TO( 0x7ffff000 );
}

/////////////////////////////////////////////////////////////////////////////
/* puts add a newline, and returns a nonnegative number on success.
 * No newline, and returns length of string.
 */
int fputs( const char *s, FILE *stream __attribute__((unused)) ) {
        int i = 0;
        while ( *s ) {
                putchar( *s );
                s++;
                i++;
        }
        return i;
}
int puts( const char *s) {
        int i = fputs( s, stdout);
        return i + fputs( "\n", stdout );
}
#define bn_puts(s) fputs(s,stdout)

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
                        putchar( '0'+a );
                } else {
                        putchar( 'a'-10 + a );
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void dump( uint32_t *p, uint32_t len ) {
        p = (uint32_t *)((uint32_t) p & ~3u);
        uint32_t *e = p + len/4;
        uint8_t *q;
        
        do {
                bn_puts( "\r\n" );
                clumsyhexprint( (uint32_t)p );
                fputs( " | ", stdout );

                q = (uint8_t *)p;
                do {
                        clumsyhexprint( *p );
                        putchar( ' ' );
                        p++;
                } while ( ((uint32_t)p & 0x1c) != 0 );

                while ( q != (uint8_t *)p ) {
                        int c = *q++;
                        if ( isprint(c) ) {
                                putchar( c );
                        } else {
                                putchar( '.' );
                        }
                }
                        

        } while ( p != e );
        bn_puts( "\r\n" );
}

// -----------------------------------------------------------------------------
void dumpEBR( void ) {
        dump( 0, 0x400 );
}

// -----------------------------------------------------------------------------
int run_compliance_tests( void ) {
        icebreaker_rv32i();
        return 5;
}

// -----------------------------------------------------------------------------
int main( void ) {
        int i = 0;

        LED->D = 7;
        getchar();
        bn_puts( "Welcome to midgetv on an icebreaker board\n\r"
                   "There is not much this test program can do\n\r"
                   "Commands: (D)ump start of EBR. (L)x write leds, (R)un compliance tests\n\r");
        while (1) {
                //LED->D = ++i & 2;
                //cywait(0x10000);
                //LED->D = 0;
                //cywait(0x40000);
                i = getchar();
                if ( i == 'D' ) {
                        dumpEBR();
                } else if ( i == 'L' ) {
                        LED->D = getchar();
                } else if ( i == 'R' ) {
                        run_compliance_tests();
                } else {
                        putchar( i );
                        bn_puts( "?\r\n" );
                }
        }
}
