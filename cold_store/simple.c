/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
    One step back. 
*/
#include <stdint.h>

#if sim
// Simulation on PC
#define sim_ADRLINES 10
#define sim_RAMSIZEBYTES ((1<<sim_ADRLINES))
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
uint8_t theSRAM[sim_RAMSIZEBYTES];
uint8_t *SRAM = theSRAM;
int dummyled;
int volatile * volatile LED = &dummyled;
#else
uint8_t *SRAM = (uint8_t *)0x80000000;
#define LED (volatile uint32_t *)0x60000004
#endif



/////////////////////////////////////////////////////////////////////////////
static void simend( void ) {
#if sim
        exit( fprintf(stderr,"Simend\n" ) );
#else
        __asm__("sltu x0,x0,x0");
#endif
}

/////////////////////////////////////////////////////////////////////////////
static void simdump( void ) {
#if sim
        ;
#else
        __asm__("sltu x0,x31,x31");
#endif
}

// ///////////////////////////////////////////////////////////////////////////
// void showhalt( void ) {
//         int i = 0;
// #if sim
//         return;
// #endif
//         while (1) {
//                 i++;
//                 *LED = (i >> 12) & 3;
//         }
// }

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        volatile uint32_t *p32 = (uint32_t *)SRAM;
        uint32_t i;
#define LIM 100
        *LED = 2; 
        for ( i = 0; i < LIM; i++ )
                *(p32+i) = i;
        for ( i = 0; i < 1; i++ )
                if ( *(p32+i) != i )
                        *LED = 1;
        while ( 1) {                
                simend(); // Hang on devboard
        }
}
        
