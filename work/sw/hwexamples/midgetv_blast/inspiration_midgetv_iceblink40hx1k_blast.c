/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================

    To load and/or start executing of a program in midgetv as
    implemented on a iceblink40-hx1k board without
    FPGA recompile.

    The program to be loaded must follow the format described in
    inspiration_midgetv_blast.c

*/
#include <stdint.h>
#include "midgetv.h"

#if 0
#define DBGLED(x) do { LED->D = (x); } while (0)

int near_getchar( void ) {
        while ( (EPP->S & 2) == 0 )
                ;
        return EPP->D;
}

int __attribute__((naked)) main( void ) {
        int i;
        DBGLED(1);
        for ( i = 0; i < 4; i++ )
                near_getchar(); // Throw autobaud signature
        uint8_t *p = (uint8_t *)0xb4;
        while (1) {
                int i;
                for ( i = 0; i < 8; i++ ) 
                        *p++ = near_getchar();
                uint8_t *end = *(uint8_t **)0xb4;
                uint8_t *at  = (uint8_t *)*(uint32_t *)0xb8;

                if ( end == 0 )
                        ((void (*)(void))at)();
                do {
                        uint32_t a = near_getchar();        
                        DBGLED(a);
                        *(uint8_t *)at++ = a;
                } while ( at < end );

        }
}
#endif                

//Preliminary test
int __attribute__((naked)) main( void ) {
        uint32_t cnt = 0;
        
        while (1) {

                if ( (EPP->S & 2) ) {
                        LED->D = EPP->D;
                        EPP->D = ++cnt;
                }
        }
}

