/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================
    Check SRAM seems to be working by the sieve of Eratosthenes.

    This program may be simulated, but with the default size of SRAM, we have:

    Thu Jul 25 10:03:54 CEST 2019
    ../../obj_dir/erastosthenes.bin          success 26782493 instructions in 233562018 cycles, cpi =  8.72 At 24 MHz, runtime =                9.732 s
    Thu Jul 25 10:31:27 CEST 2019

    So a 30 min simulation time, long.
    Incidentially this indicates the simulator clock speed f = 233562018/1653 = 141 kHz.

    
*/
#include <stdint.h>

#if sim
// Simulation on PC
#define sim_ADRLINES 4
#define sim_RAMSIZEBYTES ((1<<sim_ADRLINES))
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
uint8_t theSRAM[sim_RAMSIZEBYTES];
uint8_t *SRAM = theSRAM;
int dummyled;
int volatile * volatile LED = &dummyled;
#else
uint8_t *SRAM = (uint8_t *)0x80000000;
#define LED (uint32_t *)0x60000004
#endif



/////////////////////////////////////////////////////////////////////////////
uint32_t find_sizeofram( void ) {
        int i = 2;
        int adr1,adr2;
        while (1) {
                adr1 = (1<<i);
                adr2 = (1<<(i+1));
#if sim
                adr1 &= (sim_RAMSIZEBYTES-1);
                adr2 &= (sim_RAMSIZEBYTES-1);
#endif
                *(SRAM+adr1) = 0;
                *(SRAM+adr2) = 0x55;
                if ( *(SRAM+adr1) != 0 )
                        break;
                i++;
        }        
        return i;
}       
        
/////////////////////////////////////////////////////////////////////////////
void simend( void ) {
#if sim
        exit( fprintf(stderr,"Simend\n" ) );
#else
        __asm__("sltu x0,x0,x0");
#endif
}

/////////////////////////////////////////////////////////////////////////////
void simdump( void ) {
#if sim
        ;
#else
        __asm__("sltu x0,x31,x31");
#endif
}

/////////////////////////////////////////////////////////////////////////////
void fillmemFFFFFFFF( uint32_t *p, unsigned int n) {
        while ( n-- )
                *p++ = 0xffffffff;
}

/////////////////////////////////////////////////////////////////////////////
int isbitset(int i ) {
        return *(SRAM + (i>>3)) & (1<<(i&7));
}

/////////////////////////////////////////////////////////////////////////////
void bitclear(int i ) {
        *(SRAM + (i>>3)) &= ~(1<<(i&7));
}


/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        volatile uint32_t facit = 0;
        uint32_t byteadrwidth;
        uint32_t bitadrwidth;
        int n;
        int looplim;
        int i,j;
        
        *LED = 0;
        byteadrwidth = find_sizeofram();
        //byteadrwidth = 10;

        bitadrwidth = byteadrwidth + 3;
        n = (1<<bitadrwidth);
        looplim = (1<<(bitadrwidth/2));
        if ( bitadrwidth & 1 )
                looplim += looplim/2; // 1.5 > sqrt(2)

        /* Special for ramsize 128 KiB. Here the first two words must be 0,
         * We move the apparent start of SRAM, and adjusts n
         */
        if ( byteadrwidth == 17 ) {
                n -= 64;
                SRAM += 8;
        }
        fillmemFFFFFFFF( (uint32_t *)SRAM, n>>2 );

//        *(uint32_t *)SRAM = looplim;
//        simdump();
//        simend();

#if sim
        printf( "Ramsize in bits : n=0x%x. Looplim = 0x%x\n", n, looplim );
#endif
        for ( i = 2; i < looplim; i++ ) {
                if ( isbitset(i) ) {
                        for ( j = 2*i; j < n; j += i ) {
                                bitclear(j);
                        }
                }
        }
        
        for ( i = 2; i < n; i++ ) {
                if ( isbitset(i) ) {
                        facit ^= i;
#if sim
                        printf( "%d ", i );
#endif
                }
        }

        int ok = 0;
        switch ( byteadrwidth ) {
        case 4 :  ok = facit == 0x0004a; break;
        case 5 :  ok = facit == 0x00081; break;
        case 6 :  ok = facit == 0x00154; break;
        case 15 : ok = facit == 0x31b85; break;
        case 16 : ok = facit == 0x10965; break;
        case 17 :
                /* If a full 2^17 bit SRAM is used, the highest recorded prime would be
                   1048573 -> ok = facit == 0xd64a6;
                   But when a 2^17 - 64 bit SRAM is used, the higest recorded prime is
                   1048507 
                */
                ok = facit == 0x29b6f;
                break;
        }
#if sim
        if ( ok ) {
                printf( "\nOK\n" );
        } else {
                printf( "\nError or %d Uncovered. Facit:0x%x\n", byteadrwidth, facit );
        }
#else
        if ( ok ) {
                *LED = 2;
        }
#endif
        while ( 1) {
                simend(); // Hang on devboard
        }
}
        
