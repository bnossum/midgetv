/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Utility to map a binary file over to localparam as needed when compiling
 * m_ice40.v. The original binary file is to have a load address = relocation
 * address starting at 0.
 */
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#define ferr(...) exit(fprintf(stderr,__VA_ARGS__))

uint8_t program[16*4096/8]; // Bits
uint8_t stripe[16][4096/8]; 

int main(int argc, char *argv[]) {
        int opt;
        FILE *fi = NULL, *fo = NULL;
        int n = -1, w = -1;
        char *finame = NULL;
        
        while ((opt = getopt(argc, argv, "hw:i:o:")) != -1) {
                switch (opt) {
                case 'w' :
                        w = atoi(optarg);
                        switch (w) {
                        case 8 : n = 2; break;
                        case 9 : n = 4; break;
                        case 10 : n = 8; break;
                        case 11 : n = 16; break;
                        default :
                                ferr( "Supported address width of EBR is 8,9,10 or 11. (-h for help)\n" );
                        }
                        break;
                case 'i':
                        if ( (fi = fopen(optarg,"r")) == NULL )
                                ferr( "Can't open %s for reading (-h for help)\n", optarg );
                        finame = strdup(optarg);
                        break;
                case 'o':
                        if ( (fo = fopen(optarg,"w")) == NULL )
                                ferr( "Can't open %s for writing (-h for help)\n", optarg );
                        break;
                case 'h' :
                        fprintf( stderr, "\n" );
                default: /* '?' */
                        ferr(
                                "Utility to write a binary riscv file to localparams for inclusion in Verilog\n"
                                "source.\n"
                                "Usage: %s [-h] [-w width] -i inname -o outname\n"
                                "    -h This help\n"
                                "    -i inname is the name of the binary image to use as source. Mandatory\n"
                                "    -o outname is the name of the resulting file to be `included in Verilog\n"
                                "       source. Mandatory.\n"
                                "    -w To set the width of the EBR data path to use. Legal values are:\n"
                                "            8  Smallest supported midgetv, 256 words, 1 KiB\n"
                                "            9  512 words, 2 KiB\n"
                                "            10 1024 words, 4 KiB\n"
                                "            11 2048 words, 8 KiB\n"
                                "\n"
                                "    If w is given, and the binary file is too large, the binary file is\n"
                                "    truncated. The reason for this behaviour is that the binary image may be\n"
                                "    intended for a split between EBR and SRAM. If w is not given, it is\n"
                                "    calculated based on the size of the binary image.\n",
                                argv[0]);
                        return -1;
                }
        }
        if ( fi == NULL ) 
                ferr("Input file name not given (-h for help)\n");
        if ( fo == NULL ) 
                ferr("Output file name not given (-h for help)\n");

        int c,i = 0;
        uint8_t *bp = program; 
        while ( (c=fgetc(fi)) != EOF ) {
                if ( w > 0 && i >= (1<<(n*4)) )
                        break; // User imposed limit
                if ( i >= 8*1024 )
                        ferr( "Binary image maximum size %d bytes exceeded (-h for help)\n", 8*1024 );
                *bp++ = c;
                i++;
        }
        fclose(fi);
        
        if ( n == -1 ) {
                if ( i <= 1*1024 ) {
                        w = 8; n = 2;
                } else if ( i <= 2*1024 ) {
                        w = 9; n = 4;
                } else if ( i <= 4*1024 ) {
                        w = 10; n = 8;
                } else {
                        w = 11; n = 16;
                }
        }
        if ( i > 512*n )
                ferr( "Binary image is %d > requested maximum program %d bytes (n = %d, -h for help)\n", i, 512*n, n );

        /*
         * The below could be generalized, but for what reason?
         */
        int b,ebrnr,initposlow,initposhigh,stripenr,stripebitnr,initpos;
        if ( n == 2 ) {
                // The first 1 KiB = 8 kibi of program to be used.
                for ( i = 0; i < 8*1024; i++ ) {
                        b = (program[i/8] >> ( i & 7)) & 1;
                        initposlow  = (i >>  0) & 15; // Low part bit position in an INIT_x
                        ebrnr       = (i >>  4) & 1;  // What EBR
                        initposhigh = (i >>  5) & 15; // High part of bit position
                        stripenr    = (i >>  9) & 15; // What INIT_x
                        initpos     = (initposhigh<<4) + initposlow;
                        stripebitnr = 256*ebrnr + initpos;
                        assert( stripenr < 16 );
                        assert( stripebitnr < (8*1024/16) );
                        stripe[stripenr][stripebitnr/8] |= (b<<(stripebitnr&7));
                }
        } else if ( n == 4 ) {
                // The first 2 KiB = 16 kibi of program to be used.
                for ( i = 0; i < 16*1024; i++ ) {
                        b = (program[i/8] >> ( i & 7)) & 1;
                        initposlow  = (i >>  0) & 7;  // Low part bit position in an INIT_x
                        ebrnr       = (i >>  3) & 3;  // What EBR
                        initposhigh = (i >>  5) & 31; // High part of bit position
                        stripenr    = (i >> 10) & 15; // What INIT_x
                        initpos     = (initposhigh<<3) + initposlow;
                        stripebitnr = 256*ebrnr + initpos;
                        assert( stripenr < 16 );
                        assert( initpos < 256 );
                        assert( ebrnr < 4 );
                        assert( stripebitnr < (16*1024/16) );
                        stripe[stripenr][stripebitnr/8] |= (b<<(stripebitnr&7));
                }
        } else if ( n == 8 ) {
                // The first 4 KiB = 32 kibi of program to be used.
                for ( i = 0; i < 32*1024; i++ ) {
                        b = (program[i/8] >> ( i & 7)) & 1;
                        initposlow  = (i >>  0) & 3;  // Low part bit position in an INIT_x
                        ebrnr       = (i >>  2) & 7;  // What EBR
                        initposhigh = (i >>  5) & 63; // High part of bit position
                        stripenr    = (i >> 11) & 15; // What INIT_x
                        initpos     = (initposhigh<<2) + initposlow;
                        stripebitnr = 256*ebrnr + initpos;
                        assert( stripenr < 16 );
                        assert( initpos < 256 );
                        assert( ebrnr < 8 );
                        assert( stripebitnr < (32*1024/16) );
                        stripe[stripenr][stripebitnr/8] |= (b<<(stripebitnr&7));
                }
        } else {                
                // The first 8 KiB = 64 kibi of program to be used.
                for ( i = 0; i < 64*1024; i++ ) {
                        b = (program[i/8] >> ( i & 7)) & 1;
                        initposlow  = (i >>  0) & 1;  // Low part bit position in an INIT_x
                        ebrnr       = (i >>  1) & 15; // What EBR
                        initposhigh = (i >>  5) & 127;// High part of bit position
                        stripenr    = (i >> 12) & 15; // What INIT_x
                        initpos     = (initposhigh<<1) + initposlow;
                        stripebitnr = 256*ebrnr + initpos;
                        assert( stripenr < 16 );
                        assert( initpos < 256 );
                        assert( ebrnr < 16 );
                        assert( stripebitnr < (64*1024/16) );
                        stripe[stripenr][stripebitnr/8] |= (b<<(stripebitnr&7));
                }
        }
        
        fprintf( fo, "// Initial values for midgetv EBRs.\n"
                 "// Generated by %s from %s.\n// %d EBRs used.\n", argv[0], finame, n );
        fprintf( fo, "localparam EBRADRWIDTH = %d;\n", w );
        
        int k;
        for ( k = 0; k < 16; k++ ) {
                fprintf( fo, "localparam program%X = %d'h", k, 256*n );
                for ( i = 32*n-1; i >= 0; i-- ) {
                        fprintf( fo, "%2.2x", stripe[k][i] );
                        if ( i && (i & 31) == 0 )
                                fprintf( fo, "_" );
                }
                fprintf( fo, ";\n" );
        }
                
        fclose( fo );
        return 0;
}
        
