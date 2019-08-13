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
#define NAK 0x15
#define CAN 0x18

#define CLKFRQ 12000000
#define TIMEOUTLIM_1S (CLKFRQ/36) 

/////////////////////////////////////////////////////////////////////////////
int near_getchar_TO( void ) {
        uint32_t to = 0;
        while ( UART->D == 0 )
                ; // Possibly in previous transaction, I cheat on frame bit.

        // Wait for falling flank startbit
        while ( (SYSEBR->mcycle = UART->D) != 0 ) {
                if ( ++to > TIMEOUTLIM_1S )
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
void xmodemReceive( uint32_t loadadr ) {
        int retry,c;
        
        for ( retry = 0; retry < 60; ++retry ) {
                near_putchar( NAK );
                c = near_getchar_TO();
                if ( c > 0 )
                        break;
        }
        near_putchar(CAN);
        near_putchar(CAN);
        near_putchar(CAN);

        for ( retry = 0; retry < 1000; retry++ )
                near_getchar();
        
        clumsyhexprint(c);
        while (1)
                UART->D = 15;        
}

//  /////////////////////////////////////////////////////////////////////////////
//  typedef struct {
//          uint32_t loadadr;
//          uint32_t len;
//          uint32_t chk;
//  } HDR;
//  HDR g_hdr;
//        rcv( &g_hdr, sizeof(HDR));

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int a;
        uint32_t loadadr =  0xffff0000u;
//        uint32_t len;
        
        UART->D = 1;
        uint32_t ab = autobaud();
        g_bitrate = ab/8;

        while (1) {
                 near_puts( "midgetv: (L)oad/(G)o : " );
                 a = near_getchar();
                 if ( a == 'L' ) {
                         xmodemReceive(loadadr);
                 } else if ( a == 'G' ) {
                         ((void (*)(void)) loadadr)();
                 } else {
                         near_putchar('?');
                 }
         }
}

