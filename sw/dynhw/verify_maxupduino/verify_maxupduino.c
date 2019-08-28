// =============================================================================
// Part of midgetv
// 2019. Copyright B. Nossum.
// For licence, see LICENCE
// =============================================================================
// Verify SRAM read/write. This should really be regression code, I found
// an error in ACK_O of 17-bit wide SRAM, but it has magically disappeared...

#include <stdio.h>
#include "midgetv.h"

// -----------------------------------------------------------------------------
static void cywait(const uint32_t lim) {
        volatile uint32_t i;

        for ( i = 0; i < lim; i++ )
                ;
}

/////////////////////////////////////////////////////////////////////////////
__inline void simend( void ) {
        __asm__("sltu x0,x0,x0");
}

/////////////////////////////////////////////////////////////////////////////
__inline void simerr( void ) {
        __asm__("sltu x0,x0,x1");
}

/////////////////////////////////////////////////////////////////////////////
uint32_t * const  SRAM = (uint32_t *)0x80000000;

/*
BYTEWRITE 
| BYTEREAD 
| | cpi
0 0  7.27
0 1 10.42
1 0  9.97
1 1 10.75
 */

#define BYTETYPE  0
#define HWORDTYPE 1
#define WORDTYPE  2

#define WRITETYPE  WORDTYPE
#define READDTYPE  WORDTYPE

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        uint32_t i = 0;
        
#define LIM ((1024 * 128 - 16*4 ) /4 ) // Nr of words

        // Fill it
        for ( i = 0; i < LIM; i++ ) {
#if WRITETYPE == BYTETYPE               
                int j;
                for ( j = 0; j < 4; j++ ) 
                        *(uint8_t *)(i*4 + j + (uint8_t *)SRAM) = i >> ( j << 3 );
#elif WRITETYPE == HWORDTYPE
                int j;
                for ( j = 0; j < 2; j++ ) {
                        *(uint8_t *)(i*2 + j + (uint16_t)SRAM) = i >> ( j >> 4 );
#else                
                *(SRAM+i) = i;
#endif                
        }


        // *(SRAM+0x1234) ^= 1; // Provoke error

        // Check it
        for ( i = 0; i < LIM; i++ ) {
                uint32_t assembleword = 0;
#if READTYPE == BYTETYPE
                int j;
                for ( j = 0; j < 4; j++ ) {
                        uint8_t b = *(uint8_t *)(i*4 + j + (uint8_t *)SRAM);
                        assembleword |= (b << (j<<3));
                }
#elif READTYPE == HWORDTYPE
                int j;
                for ( j = 0; j < 2; j++ ) {
                        uint16_t h = *(uint16_t *)(i*2 + j + (uint16_t *)SRAM);
                        assembleword |= (h << (j<<4));
                }
#else
                assembleword = *(SRAM+i);
#endif

                if ( assembleword != i ) {
                        while (1) {
                                LED->D = 1;
                                simerr();
                        }
                }
        }
        simend();
        
        while (1) {
                LED->D = ++i & 2;
                cywait(0x10000);
                LED->D = 0;
                cywait(0x40000);
        }
}

