#include <stdio.h>
#include "midgetv.h"

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
                LED->D = ++i & 2;
                cywait(0x10000);
                LED->D = 0;
                cywait(0x40000);
        }
}

