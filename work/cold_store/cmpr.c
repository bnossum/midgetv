/* A compressing utility for ice40 images.
   Compile:
   gcc -o cmpr cmpr.c

   Use:
   ./cmpr < fpgaimage.bin > tmp.c

   For testing:
   gcc -DDECOMPRESSTEST=1 tmp.c
   ./a.out > tmp.bin
   cmp fpgaimage.bin tmp.bin


   A binary image is transformed to a static array of bytes,
   and a function to access the image. For more info see cmpr_base.c

   The idea is simple, run-length encode occurences of 0x00.

   Example:
   An incomming image of bytes x,y,z,0,0,0,a,0,b,0,0,0,0,0,e,...,f
   is converted to: x,y,z,0,3,a,0,1,b,0,5,e,...f,0,0
   Every occurence of n 0's are represented as 0,n
   If the run of 0's is more than 255, we split it in two or more,
   for example 509 zeros are output as: 0,255,0,254
               510 zeros are output as: 0,255,0,255
               511 zeros are output as: 0,255,0,255,0,1


   Compression algorithm
   ======================
   1. Read a byte a. 
      If a == EOF go to 5
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
int nrin = 0;
int nrout = 0;

/////////////////////////////////////////////////////////////////////////////
void putbyte( const int c ) {
        printf( "%s0x%2.2x,", (nrout & 15) ? "" : "\n\t", c );
        nrout++;
}

/////////////////////////////////////////////////////////////////////////////
void putnrzeros( int nrzeros ) {
        while (1) {
                if ( nrzeros <= 255 ) {
                        putbyte( nrzeros );
                        break;
                } 
                putbyte( 255 );
                putbyte( 0 );
                nrzeros -= 255;                
        }
}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {   
        int c,nrzeros = 0;
        
        printf( "#include <stdint.h>\n"
                "#include <stdio.h>\n"
                "static uint8_t image[] = {" );
        
        while ( (c = getchar()) != EOF ) {
                nrin++;
                if ( nrzeros ) {
                        if ( c == 0 ) {
                                nrzeros++;
                                continue;
                        } else {
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

        printf( "/* Compressed to :  %5.2lf%%\n", 100.0*(nrout+0.5)/nrin );
        printf( " * In            : %7d\n", nrin );
        printf( " * Out           : %7d\n", nrout );
        printf( " */\n\n" 
                "int getfromcompressed(int *i, int *nrzeros) {\n"
                "        int c = 0;\n\n"
                "        if ( *nrzeros ) {\n"
                "                --*nrzeros;\n"
                "        } else if ( (c = image[(*i)++]) == 0) {\n"
                "                if ( (*nrzeros = image[(*i)++]) == 0 )\n"
                "                        return EOF;\n"
                "                --*nrzeros;\n"
                "        }\n"
                "        return c;\n"
                "}\n" 
                "#if DECOMPRESSTEST\n"
                "int main( void ) {\n"
                "        int c, compressedinx = 0, nrzeros = 0;\n\n"
                "        while ( (c=getfromcompressed(&compressedinx,&nrzeros)) != EOF ) \n"
                "                putchar(c);\n"
                "}\n"
                "#endif\n"
                );
        return 0;
}
