#include <stdio.h>
#include "midgetv.h"

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
}


/////////////////////////////////////////////////////////////////////////////
int near_getchar_TO( uint32_t tolim ) {
        volatile uint32_t to = 0;
        while ( UART->D == 0 )
                ; // Possibly in previous transaction, I cheat on frame bit.

        // Wait for falling flank startbit
        while ( (SYSEBR->mcycle = UART->D) != 0 ) {
                if ( ++to > tolim )
                        return -1;
        }
                
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

/////////////////////////////////////////////////////////////////////////////
int near_getchar( void ) {
        return near_getchar_TO( 0x7ffff000 );
}

// -----------------------------------------------------------------------------
static void cywait(const uint32_t lim) {
        volatile uint32_t i;

        for ( i = 0; i < lim; i++ )
                ;
}

// -----------------------------------------------------------------------------
int main( void ) {
        int i = 0;
        
        while (1) {
                //LED->D = ++i & 2;
                //cywait(0x10000);
                //LED->D = 0;
                //cywait(0x40000);
                i = near_getchar();
                near_putchar( i + 1);
        }
}

