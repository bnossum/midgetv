#include <stdio.h>
#include "midgetv.h"

// hexdump -ve '"%4.4_ax  " 4/4 "%8.8x " 1/0 "\n"'  file    // Usefull command
//

void cywait(uint32_t lim) {
        volatile uint32_t i;

        for ( i = 0; i < lim; i++ )
                ;
}

int main( void ) {
        int i = 0;
        
        while (1) {
                LED->D = ++i & 2;
                cywait(0x10000);
                LED->D = 0;
                cywait(0x40000);
        }
}

