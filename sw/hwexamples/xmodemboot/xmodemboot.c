/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
*/
#include <stdint.h>
#include "midgetv.h"

/////////////////////////////////////////////////////////////////////////////
uint32_t autobaud( void ); 
void near_putchar( int c );
int near_getchar_TO( uint32_t timeoutlim  );


/////////////////////////////////////////////////////////////////////////////
uint32_t g_bitrate;


/////////////////////////////////////////////////////////////////////////////
/* puts add a newline, and returns a nonnegative number on success.
 * I have no space to implement a printf, so I make this function.
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
#define SOH 0x01
#define EOT 0x04
#define ACK 0x06
#define NAK 0x15
#define CAN 0x18


#define CLKFRQ 12000000
#define TIMEOUTLIM_1S (CLKFRQ/36) 
#define to10s (10*TIMEOUTLIM_1S)
#define to1s (TIMEOUTLIM_1S)


#if 0
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
#endif

/////////////////////////////////////////////////////////////////////////////
enum {
        ERR_CAN = -10,          // fffffff6  -10
        ERR_COM_LOST,           // fffffff7   -9
        ERR_UNEXPECTED_BLKNR,   // fffffff8   -8
        ERR_BAD_BLKNR,          // fffffff9   -7
        ERR_HANGS_IN_BLOCK,     // fffffffa   -6
        ERR_HANGS_IN_CHECKSUM,  // fffffffb   -5
        ERR_TO_IN_BLKNR,        // fffffffc   -4
        ERR_TO_IN_CPL_BLKNR,    // fffffffd   -3
        ERR_RETRY_TO,           // fffffffe   -2
        freecode                // ffffffff   -1
};

/////////////////////////////////////////////////////////////////////////////
int xmodemReceive(uint8_t * const loadadr){ 
        uint8_t *p = loadadr;
        int retry,c;
        int blknr;
        int chksum;
        int i;
        int txchar = NAK;
//        int testerrors = 0;
        
        blknr = 1;
        while ( 1 ) {
                
                for ( retry = 0; retry < 100; ++retry ) {
                        near_putchar( txchar );
                        txchar = NAK;
                        c = near_getchar_TO(to1s);
                        if ( c > 0 ) {
                                if ( c == SOH ) {
                                        break;
                                } else if ( c ==  EOT ) {
                                        near_putchar( ACK );
                                        return p - loadadr;
                                } else if ( c == CAN ) {
                                        return ERR_COM_LOST;
                                }
                        }
                }
                if ( retry >= 10 )
                        return ERR_RETRY_TO;
                c = near_getchar_TO(to10s);
                if ( c < 0 ) 
                        return ERR_TO_IN_BLKNR;
                if ( c != blknr ) {
                        return ERR_UNEXPECTED_BLKNR;
                }
                c = near_getchar_TO(to10s);
                if ( c < 0 ) 
                        return ERR_TO_IN_CPL_BLKNR;
                if ( blknr+c != 255 )
                        return ERR_BAD_BLKNR;
                
                chksum = 0;
                for ( i = 0; i < 128; i++ ) {
                        c = near_getchar_TO(to10s);
                        if ( c < 0 )
                                return ERR_HANGS_IN_BLOCK;                        
                        *p++ = c;
//                        p++;                        
                        chksum += c;
                }
                c = near_getchar_TO(to10s);
                if ( c < 0 )
                        return ERR_HANGS_IN_CHECKSUM;

//                if ( (++testerrors & 0xf) == 0 )
//                        chksum ^= 1;
                if ( c != (chksum & 255) ) {
                        p -= 128;
                } else {
                        blknr = (blknr+1) & 255;
                        txchar = ACK;
                }
        }
 }

/////////////////////////////////////////////////////////////////////////////
int isprint( int c ) {
        return ( (c >= 0x20) && (c < 0x7F) );
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


#if 0
/*
File: printf.c

Copyright (C) 2004,2008  Kustaa Nyholm

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*/
//putchar#include <stdio.h>

//#include "printf.h"


//void putchar(char c);

static char* bf;
static char buf[12];
static unsigned int num;
static char uc;
static char zs;

static void out(char c) {
    *bf++ = c;
    }

static void outDgt(char dgt) {
	out(dgt+(dgt<10 ? '0' : (uc ? 'A' : 'a')-10));
	zs=1;
    }
	
static void divOut(unsigned int div) {
    unsigned char dgt=0;
	num &= 0xffff; // just for testing the code  with 32 bit ints
	while (num>=div) {
		num -= div;
		dgt++;
		}
	if (zs || dgt>0) 
		outDgt(dgt);
    }	

void tfp_printf(char *fmt, ...)	{
	va_list va;
	char ch;
	char* p;
	
	va_start(va,fmt);
	
	while ((ch=*(fmt++))) {
		if (ch!='%') {
			near_putchar(ch);
                }
		else {
			char lz=0;
			char w=0;
			ch=*(fmt++);
			if (ch=='0') {
				ch=*(fmt++);
				lz=1;
				}
			if (ch>='0' && ch<='9') {
				w=0;
				while (ch>='0' && ch<='9') {
					w=(((w<<2)+w)<<1)+ch-'0';
					ch=*fmt++;
					}
				}
			bf=buf;
			p=bf;
			zs=0;
			switch (ch) {
				case 0: 
					goto abort;
				case 'u':
				case 'd' : 
					num=va_arg(va, unsigned int);
					if (ch=='d' && (int)num<0) {
						num = -(int)num;
						out('-');
						}
					divOut(10000);
					divOut(1000);
					divOut(100);
					divOut(10);
					outDgt(num);
					break;
				case 'x': 
				case 'X' : 
				    uc= ch=='X';
					num=va_arg(va, unsigned int);
					divOut(0x1000);
					divOut(0x100);
					divOut(0x10);
					outDgt(num);
					break;
				case 'c' : 
					out((char)(va_arg(va, int)));
					break;
				case 's' : 
					p=va_arg(va, char*);
					break;
				case '%' :
					out('%');
				default:
					break;
				}
			*bf=0;
			bf=p;
			while (*bf++ && w > 0)
				w--;
			while (w-- > 0) 
				near_putchar(lz ? '0' : ' ');
			while ((ch= *p++))
				near_putchar(ch);
			}
		}
	abort:;
	va_end(va);
}
#endif





/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int a;
        int len;

        uint8_t *loadadr = (uint8_t *)0xfffe0000u;
        
        UART->D = 1;
        uint32_t ab = autobaud();
        SYSEBR->freefornow_f4 = ab; // For debug

//        // Fill SRAM with a pattern,
//        // but leave sme space for a stack
//        uint32_t *p = (uint32_t *) 0xffffffc0;
//        do {
//                *p =  (uint32_t)p;
//        } while ( p-- != (uint32_t *)loadadr);
        
/*
 * For 115200 get bitrate  0x69 = 105 cycles.
 * Nominally, 12000000/115200 = 104.1, but my clock is not good.
 * 
 * 0x346 = 838  / 8 -> 104.75  105
 * 0x356 = 854  / 8 -? 106.75  107
 *
 * When cold:
 * 0x346.
 *
 *        g_bitrate = 104; // Flawless result at 115200, large file.
 *        g_bitrate = 100; // Also flawless result
 *
 * My autobaud is inprecise? I don't understand this.
 * Fudge factor: -4. This can not give any real errors on lower speeds.
 */
#define FUDGE (-4)        
        g_bitrate = (ab+4)/8 + FUDGE;
        while (1) {
                 near_puts( "midgetv: (L)oad/(G)o/(D)ump : " );
                 a = near_getchar_TO(to10s);
                 if ( a == 'L' ) {
                         len = xmodemReceive(loadadr);
                         near_getchar_TO(to10s); // Use as a delay
                         SYSEBR->freefornow_e8 = len;
                         if ( len > 0 ) {
                                 near_puts( "Received 0x" );
                         } else {
                                 near_puts( "Error 0x" );
                                 len = -len;
                         }
                         clumsyhexprint(len);
                         near_puts( "\r\n" );
                 } else if ( a == 'G' ) {
                         ((void (*)(void)) loadadr)();
                 } else if ( a == 'D' ) {
                         dump(0,256);
                 } else if ( a == 'd' ) {
                         dump((uint32_t *)0xfffe0000,128*1024);
                 } else {
                         near_putchar('[');
                         clumsyhexprint(a);//near_putchar(a);
                         near_putchar(']');
                 }
         }
}

