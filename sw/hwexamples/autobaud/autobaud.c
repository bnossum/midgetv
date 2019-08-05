/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
*/
#include <stdint.h>

typedef struct {
        uint32_t           rrr[31]; // These are x1..x31.
        uint32_t           jj;
        volatile uint32_t  rinst;
        uint32_t           pc;
        volatile uint32_t  mcycle;
} SYSEBR_TypeDef;

typedef struct {
        volatile uint32_t D;
} UART_TypeDef;

#define IOBASE 0x60000000
#define UART_BASE (IOBASE+0x4u)
#define UART ((UART_TypeDef *)UART_BASE)

/* Attempts to aliase SYSEBR_TypeDef to address 0 lead to desasters,
   mixup with NULL in GCC suspected. */

#define SYSEBR ((SYSEBR_TypeDef *)0x4)

/////////////////////////////////////////////////////////////////////////////
uint32_t g_bitrate;
uint32_t g_bitrate_div2;


/////////////////////////////////////////////////////////////////////////////
void near_putchar( int c ) {
        uint32_t n = g_bitrate;
        c = (c | 0x100) << 1;
        c &= 0x3ff;

        SYSEBR->mcycle = 0;
        while ( c ) {
                UART->D = c;
                c >>= 1;
                while ( SYSEBR->mcycle < n )
                        ;
                n += g_bitrate;
        }
        return;
}
        
/////////////////////////////////////////////////////////////////////////////
int near_getchar( void ) {
        uint32_t w = g_bitrate + g_bitrate/2;
        int b = 0;
        int n = 8;

        while ( UART->D == 0 )
                ; // Previous transaction, I cheat on frame bit.

        // Wait for falling flank startbit
        while ( UART->D  )
                SYSEBR->mcycle = 0;
        do {
                while ( SYSEBR->mcycle < w )
                        ;
                if ( UART->D ) {
                        b = (b>>1) | 0x80;
                } else {
                        b = (b>>1);
                }
                w += g_bitrate;
        } while ( --n > 0 );
        return b;
}



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
int main( void ) {
        int a;

        UART->D = 1;
        uint32_t ab = autobaud();
        g_bitrate = ab/8;
        g_bitrate_div2 = g_bitrate/2;

        near_puts( "Cycles per 8bits:" );
        clumsyhexprint(ab);
        near_putchar( '\n' );
        while (1) {
                a = near_getchar();
                near_putchar(a);
        }
}

