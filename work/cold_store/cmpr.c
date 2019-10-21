/* Sketch of a compressing utility for ice40 images
   The idea is simple, runlength encode occurences of 0x00.

   Compression algorithm
   ======================
   1. Read a byte a. 
      If EOF go to 5
      output a
      If a != 0, go to 1.
      If a == 0, set nrzero = 1, go to 2.
   2. Read a byte a.
      If EOF go to 4
      If a == 0, increment nrzero, go to 2.
      If a != 0, go to 3.
   3. If nrzero > 255, set nrzero = nrzero-255, output 255, go to 3.
      If nrzero <= 255, output nrzero, output a, go to 1
   4. if nrzero > 255. set nrzero = nrzero-255, output 255, go to 5.
      if nrzero <= 255, output nrzero, go to 5
   5. output 0, output 0. Done


 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/////////////////////////////////////////////////////////////////////////////
// These only for statistics in comment at end
int nrin = 0;
int nrout = 0;


/////////////////////////////////////////////////////////////////////////////
// These only to check the solution
#define MAXIMAGE (1024 * 128)
uint8_t origimage[MAXIMAGE];
uint8_t recreatedimage[MAXIMAGE];
uint8_t image[MAXIMAGE];


/////////////////////////////////////////////////////////////////////////////
/* This function is the only one needed in the microcontroller.
*/
int getfromcompressed(int *i, int *nrzeros) {
        int c = 0;

        if ( *nrzeros ) {
                --*nrzeros;
        } else if ( (c = image[(*i)++]) == 0) {
                if ( (*nrzeros = image[(*i)++]) == 0 )
                        return EOF;
                --*nrzeros;
        }
        return c;
}


/////////////////////////////////////////////////////////////////////////////
void putbyte( const int c ) {
        printf( "%s0x%2.2x,", (nrout & 15) ? "" : "\n\t", c );
        image[nrout++] = c;
}

/////////////////////////////////////////////////////////////////////////////
void putnrzeros( int nrzeros ) {
        while (1) {
                if ( nrzeros < 256 ) {
                        putbyte( nrzeros );
                        return;
                } 
                putbyte( 255 );
                putbyte( 0 );
                nrzeros -= 255;                
        }
}

/////////////////////////////////////////////////////////////////////////////
/* Just to check that the solution works.
 * Normally a microcontroller will load the fpga by something like:
 * while ( (c=getfromcompressed(&compressedinx,&nrzeros)) != EOF ) 
 *     stream_byte_to_fpga(c);
 */
void make_recreated_image( void ) {
        int c, i = 0, compressedinx = 0, nrzeros = 0;

        while ( (c=getfromcompressed(&compressedinx,&nrzeros)) != EOF ) 
                recreatedimage[i++] = c;
}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {   
        int c,nrzeros = 0;
        
        printf( "static uint8_t image[] = {" );
        
        while ( (c = getchar()) != EOF ) {
                origimage[nrin] = c;
                nrin++;
                if ( nrzeros ) {
                        if ( c == 0 ) {
                                nrzeros++;
                                continue;
                        } else {
                                /* End of run of zeros */
                                putnrzeros(nrzeros);
                                nrzeros = 0;
                        }
                }
                putbyte( c );
                if ( c == 0 ) 
                        ++nrzeros;
        }
        if ( nrzeros ) 
                putnrzeros(nrzeros);
        putbyte(0 );
        putbyte(0 );
        printf( "\n};\n" );

        // Statistics
        printf( "/* Compressed to :  %5.2lf%%\n", 100.0*(nrout+0.5)/nrin );
        printf( " * In            : %7d\n", nrin );
        printf( " * Out           : %7d\n", nrout );
        printf( " */\n" );

        // Check the solution.
        make_recreated_image();
        int i;
        for ( i = 0; i < nrin; i++ ) {
                if ( recreatedimage[i] != origimage[i] ) {
                        printf( "Error at index %d\n", i );
                        return 1;
                }
        }

        return 0;
}
