#include <stdio.h>
#include "midgetv.h"

// hexdump -ve '"%4.4_ax  " 4/4 "%8.8x " 1/0 "\n"'  file    // Usefull command
//    LONG(0x01071f3f)
//

void cywait(uint32_t lim) {
        volatile uint32_t i;

        for ( i = 0; i < lim; i++ )
                ;
}

int main( void ) {
        int i = 0;
        
        while (1) {
                LED->D = ++i & 1;
                cywait(0x4000);
        }
}

