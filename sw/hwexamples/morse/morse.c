/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
    Blink out a morse message
*/
#include <stdint.h>


#if sim
// Simulation on PC
#include <stdio.h>
#include <stdlib.h>
int dummyled;
int volatile * volatile LED = &dummyled;
#else
#define LED (uint32_t *)0x60000004
#endif


/////////////////////////////////////////////////////////////////////////////
static void wait( int n ) {
        uint32_t k;
        volatile uint32_t a = 0;

        k = 0x20000;
        while (n--) {
                a += k;
#if sim
                printf( "%c", dummyled == 0 ? '_' : '-' );
#endif
        }
        while ( a )
                a--;
}


/////////////////////////////////////////////////////////////////////////////
static void ledon(int n){
        *LED = 2;
        wait(n);
}

/////////////////////////////////////////////////////////////////////////////
static void ledoff(int n){
        *LED = 0;
        wait(n);
}

/////////////////////////////////////////////////////////////////////////////
static void putc_morse( uint8_t c ) {
        while ( c > 1) {
                if ( c & 1 ) 
                        ledon(2);
                ledon(1);
                ledoff(1);
                c >>= 1;
        }
        ledoff(2);                                
}




/////////////////////////////////////////////////////////////////////////////
/* Rules:
 * No string should start with interword spacing.
 * No string should end with interword spacing.
 * An interword spacing is always added after a string is processed
 */
static void puts_morse( uint8_t const *  s ) {
        while ( *s ) {
                if ( *s == 0xff ) { // Interword spacing
                        ledoff(5);
                } else {
                        putc_morse( *s );
                }
                s++;
        }
        ledoff(5);
}


#define _A 0b110    ,  // .-
#define _B 0b10001  ,  // -...
#define _C 0b110101 ,  // -.-.-
#define _D 0b1001   ,  // -..  
#define _E 0b10     ,  // .    
#define _F 0b10100  ,  // ..-.
#define _G 0b1011   ,  // --.
#define _H 0b10000  ,  // ....
#define _I 0b100    ,  // ..
#define _J 0b11110  ,  // .---
#define _K 0b1101   ,  // -.-
#define _L 0b10010  ,  // .-..
#define _M 0b111    ,  // --
#define _N 0b101    ,  // -.
#define _O 0b1111   ,  // ---
#define _P 0b10110  ,  // .--.
#define _Q 0b11011  ,  // --.-
#define _R 0b1010   ,  // .-.
#define _S 0b1000   ,  // ...
#define _T 0b11     ,  // -
#define _U 0b1100   ,  // ..-
#define _V 0b11000  ,  // ...-
#define _W 0b1110   ,  // .--
#define _X 0b11001  ,  // -..-
#define _Y 0b11101  ,  // -.--
#define _Z 0b10011  ,  // --..
#define _0 0b111111 ,  // -----
#define _1 0b111110 ,  // .----
#define _2 0b111100 ,  // ..---
#define _3 0b111000 ,  // ...--
#define _4 0b110000 ,  // ....-
#define _5 0b100000 ,  // .....
#define _6 0b100001 ,  // -....
#define _7 0b100011 ,  // --...
#define _8 0b100111 ,  // ---..
#define _9 0b101111 ,  // ----.
#define __ 0xff     ,  // Interword spacing
#define __endstring__ 0

const uint8_t hello_world[] = { _H _E _L _L _O __ _W _O _R _L _D __endstring__  };

//__attribute__((noreturn)) 
int main( void ) {
        while (1) {
                puts_morse( hello_world );
                ledoff(10);
#if sim
                exit(printf( "\n" ));
#endif
        }
}
