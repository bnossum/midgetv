// To quickly generate small binary patterns.
#include <stdint.h>
#include <stdio.h>

uint8_t mem[0x200];
                  
int main( void ) {
        int i;
        
//        mem[0] = 1;
//        mem[0] = 2;        

//        mem[0x25] =  0xffffff7fu;
        mem[0x25*4+0] =  0x1u;
//        mem[0x25*4+1] =  0xffu;
//        mem[0x25*4+2] =  0xffu;
//        mem[0x25*4+3] =  0xffu;

        for ( i = 0; i < 0x200; i++ ) 
                putchar( mem[i] );
        return 0;
}
