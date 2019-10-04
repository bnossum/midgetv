/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================

*/
#include <stdint.h>
#include "midgetv.h"

/////////////////////////////////////////////////////////////////////////////
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

#define CTE  (18904/17843.0) // 2^(1/12)


/////////////////////////////////////////////////////////////////////////////
uint32_t g_lowsideband;
const uint32_t g_has_max_iceblink = 1; // Tried to get this to work with ICE40UP - failed.

const uint8_t msg[] = { _H _E _L _L _O __ _W _O _R _L _D __
                                _N _I _C _E __ _T _O __ _S _E _E __ _Y _O _U
                                __endstring__  };

// *2.75 because upduino2 at 12 MHz and iceblink at 33 MHz.

static const uint32_t note[12] = {
        33000000 / ( 880 * 2.75  * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
        33000000 / ( 880 * 2.75  * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE * CTE ),
};



/////////////////////////////////////////////////////////////////////////////
#if 0
static void wait( int n ) {
        uint32_t k;
        volatile uint32_t a = 0;

        k = 0x20000;
        while (n--) {
                a += k;
        }
        while ( a )
                a--;
}
#endif

/////////////////////////////////////////////////////////////////////////////
static void fmwait( int modulate, int n ) {
        volatile uint32_t a = 0;
        uint32_t k = 0x2900;
        int sh = 12; 
        if ( g_has_max_iceblink ) {
                sh = 13;
                k  = 0x8000;
        }
        while (n--) {
                a += k;
        }
        while ( a ) {
                a--;
                if ( modulate ) {
                        k = (SYSEBR->mcycle >> sh) & 2;
                        FMXMIT->D = g_lowsideband + k;
                } else {
                        FMXMIT->D = g_lowsideband + 2;
                }
        }
}


/////////////////////////////////////////////////////////////////////////////
/*
 * max_iceblink40: 33 MHz  
 * max_upduino2    12 MHz  
 * iceblink = 2.75 upduino 
 */
static void scale( void ) {
        uint32_t i,j,m,N;

        for ( j = 0; j < 3; j++ ) {
                for ( i = 0; i < 12; i++ ) {
                        LED->D = i;
                        N = note[i];
                        if ( g_has_max_iceblink ) 
                                N = (N*2) + (N>>1) + (N>>2);
                        
                        switch ( j ) {
                        case 0 : N  += N;
                        case 1 : N  += N;
                        }
                        SYSEBR->mcycle = 0;
                        m = N;
                        do {
                                FMXMIT->D = g_lowsideband;
                                while ( SYSEBR->mcycle < m )
                                        ;
                                m += N;
                                FMXMIT->D = g_lowsideband+2;
                                while ( SYSEBR->mcycle < m )
                                        ;
                                m += N;
                        } while ( SYSEBR->mcycle < 4000000 );
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
static void ledon(int n){
        LED->D = 2;
        fmwait(1,n);
}

/////////////////////////////////////////////////////////////////////////////
static void ledoff(int n){
        LED->D = 0;
        fmwait(0,n);
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


/////////////////////////////////////////////////////////////////////////////
#if 0
static void show32( uint32_t d ) {
        int i;

        for ( i = 0; i < 8; i++ ) {
                LED->D = i | 8;            wait(4);
                LED->D = 0;                wait(4);
                LED->D = i | 8;            wait(4);
                LED->D = 0;                wait(4);
                LED->D = (d >> (i<<2));    wait(16);
                LED->D = 0;                wait(4);
        }
}
#endif


/////////////////////////////////////////////////////////////////////////////
int main( void ) {


// Works        
//        uint32_t d = SYSEBR->mcycle;
//        while (1) 
//                show32(d);
//
// Works        
//        uint32_t d,pd =0,cnt=0;
//        FMXMIT->D = FM_OE | FM_FCLKEN | 1;
//        while (1) {
//                d = (FMXMIT->D >> 8) & 1;
//                if ( d & ~pd )
//                        cnt++;
//                LED->D = cnt>>16;
//                pd = d;
//        }
//        // 13+16+4 = 33
//        // 2^33/54 = 159 MHz only (icestorm)
//        // 2^33/27 = 318 MHz (iceCube2)

        /* Find out if we are on the max_iceblink40 or on upduino
         */
//        g_has_max_iceblink = 0;
//        *(uint8_t *)0x8ffffff00 = 0xde;
//        if ( *(uint32_t *)(0x8ffffff00 - (16*1024)) == 0xde ) 
//                g_has_max_iceblink = 1;
//        


        
        // Calibrate
        uint32_t d;
        FMXMIT->D = FM_OE | FM_FCLKEN | 1;
        while ( (FMXMIT->D & 0x100) == 0 )
                ; // Ensure msb accumulator high
        while ( FMXMIT->D & 0x100 ) 
                ; // Wait until low
        SYSEBR->mcycle = 0;
        for ( d = 0; d < 8; d++ ) {
                while ( (FMXMIT->D & 0x100) == 0 )
                        ; // Wait until high
                while ( (FMXMIT->D & 0x100) )
                        ; // Wait until low
        }
        d = SYSEBR->mcycle;
        d /= 16;
        
//        show32(d);


        /* I presume this code runs at CLK_I = 33 MHz,
           hence a cycle time of 30.3 ns.
           I measured 2^12 cycles of fmclk to be d*30.3ns,
           fm_cycle = d*30.3/(2^12)
           fm_frq = 2^12/(d*30.3*10^-9) = 10^9*2^12/(30.3*d)
           d = 0x1b0 = 432, so 
           fm_frq = 313 MHz

           I want:
           aTHECENTER = (2^13) * 91000000 / fm_frq;
           aTHECENTER = (2^13) * 91000000 / (10^9*2^12/(30.3*d))
           aTHECENTER = d * 30.3 * (2^13) * 91000000 / (10^9*2^12)
           aTHECENTER = d * 30.3 * 2 * 0.091000000
           aTHECENTER = d * 5.5146

           Approximates: aTHECENTER = d * 5.5155
  
           
           For upduino2: CLK_I = 12 MHz, Cycle time 83.3 ns
           fm_cycle = d*83.3*10^-9/2^12
           fm_frq = 2^12*10^9/(83.3*d)
           I want:
           aTHECENTER = (2^13) * 91000000 / fm_frq;
           aTHECENTER = (2^13) * 91000000 * 83.3 * d / (2^12*10^9)
           aTHECENTER = d * 83.3 * 2 * 0.091
           aTHECENTER = d * 15.1606
           
           Approximates: aTHECENTER = d * 15.125
      */
        uint32_t aTHECENTER;
        if ( g_has_max_iceblink ) {
                aTHECENTER = d * 5 + d/2 + d/64;
        } else {
                aTHECENTER = d*15 + d/8;
        }
        
        /* Want the 2 lsb to be 0, hence: */
        aTHECENTER &= ~3u;
        g_lowsideband = FM_OE | FM_FCLKEN | aTHECENTER;
//        while (1) 
//                show32(g_lowsideband);
        
//        while (1) {
//                puts_morse( msg );
//                ledoff(10);
//        }

        while (1) {
                puts_morse( msg );
                ledoff(10);
                scale();
        }

}
