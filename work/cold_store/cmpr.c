// Sketch of a compressing utility for ice40 images
// Not finished

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define MAXIMAGE  (128*1024)

const int dbg = 0;

uint8_t image[MAXIMAGE];

int next4_ne_00000000( uint8_t *p, int i ) {
        return *(p+i) | *(p+i+1) | *(p+i+2) | *(p+i+3);
}

int main( void ) {
        int i = 0,c,k,j;
        
        // First read supposed binary image
        while ( (c = getchar()) != EOF ) {
                image[i] = c;
                if ( ++i >= MAXIMAGE-4 ) {
                        fprintf( stderr, "Que?\n" );
                        return 1;
                }
        }
        int imagelen = i;
        int anchor = 0;
        if ( dbg )
                printf( "Incomming %d bytes\n", imagelen );
        int nroutbytes = 0;
        i = 0;
        while ( anchor+i < imagelen ) {
                
                while ( next4_ne_00000000( image, anchor+i) ) 
                        if ( ++i + anchor >= imagelen )
                                break;

                // bytes anchor, anchor+1, ... anchor+i-1 to be represented as
                // (128|len) [data].
                while (i) {
                        k = ( i > 127 ) ? 127 : i;
                        i -= k;

                        if ( dbg ) 
                                printf( " Run %d: ", k );
                        else
                                putchar( 127 | k );
                        for ( j = 0; j < k; j++ )
                                if ( dbg ) 
                                        printf( "%2.2x ", image[anchor+j] );
                                else
                                        putchar( image[anchor+j] );
                        if ( dbg ) {
                                nroutbytes += k + 1;
                                printf( "\n" );
                        }
                        anchor += k;
                } 
                if ( anchor >= imagelen )
                        break;
                
                while ( image[anchor+i] == 0 ) 
                        if ( ++i + anchor >= imagelen )
                                break;
                
                // bytes anchor, anchor+1, ... anchar+i-1 are all zero,
                // and is represented as (0 | len)
                while (i) {
                        k = ( i > 127 ) ? 127 : i;
                        i -= k;
                        if ( dbg ) {
                                printf( "zRun %d\n", k );
                                nroutbytes += 1;
                        } else {
                                putchar( k );
                        }
                        anchor += k;
                }
        }
        if ( dbg )
                printf( "Outgoing %d bytes\n", nroutbytes );
        return 0;
}

        
