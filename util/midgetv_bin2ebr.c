/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Utility to map a binary file over to localparam as needed when compiling
 * m_ice40.v. 
 * Possible enhancement:
 * While this utility allows maximum utilization of EBR resources for iCE40
 * LP640, LP1K, LP4K, HX1K, HX4K and iCE40UP3K, it is conceivable to initiate
 * even more memory for LP8K, HX8K and iCE40UP5K. This is not done now.
 *
 * The strategy is simple:
 *  o The load address = relocation address starting at 0.
 *  o A binary file is read byte by byte, interpreted word by word. 
 *    The binary file is assumed little endian.
 *  o The first 4096 bits are represented as prg00, the next
 *    4096 bits goes to prg01, etc. The size of 4096 bit is chosen becase
 *    it seems to be a size that passes through all tool-chains.
 *  o In iCE40, the maximum size to represent is 8 KiB, represented by
 *    prg00 through prg0F.
 *  o It is the work of the initcode in verilog to do any division/mangling
 *    of the bits.
 */ 

#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#define ferr(...) exit(fprintf(stderr,__VA_ARGS__))

uint8_t program[16*4096/8]; // Bits

int main(int argc, char *argv[]) {
        int opt;
        FILE *fi = stdin;
        FILE *fo = stdout;
        int w = -1;
        char *finame = NULL;
        
        while ((opt = getopt(argc, argv, "hw:i:o:")) != -1) {
                switch (opt) {
                case 'w' :
                        w = atoi(optarg);
                        if ( w < 10 || w > 13 )
                                ferr( "Unsupported amount of EBR.\n"
                                      "w = 10 minimum  (1 KiB EBR, 2 EBRs used)\n"
                                      "w = 13 maximum  (9 KiB EBR, 16 EBRs used)\n" );
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
                                "    -i inname is the name of the binary image to use as source.\n"
                                "    -o outname is the name of the resulting file to be `included in Verilog source.\n"
                                "    -w The number of address bits of the EBR data path to use.\n"
                                "       Legal values are:\n"
                                "            10  256 words, 1 KiB\n"
                                "            11  512 words, 2 KiB\n"
                                "            12 1024 words, 4 KiB\n"
                                "            13 2048 words, 8 KiB\n"
                                "\n"
                                "    If w is given, and the binary file is too large, output is\n"
                                "    truncated accordingly. If w is not given, it is\n"
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
                if ( w > 0 && i >= (1<<w) ) {
                        ferr( "PP\n" );
                        break; // User imposed limit
                }
                if ( i >= (1<<13) )
                        ferr( "Binary image maximum size %d bytes exceeded (-h for help)\n", 1<<13 );
                *bp++ = c;
                i++;
        }
        fclose(fi);
        
        if ( w == -1 ) {
                for ( w = 10; w < 13; w++ )
                        if ( i <= (1<<w) )
                                break;
                if ( w >= 13 )
                        ferr( "Que?\n" );
        }

        fprintf( fo, "// Initial values for midgetv EBRs.\n"
                 "// Generated by %s from %s.\n// %d EBRs used.\n",
                 argv[0], finame, (1<<(w-9)) );
        fprintf( fo, "localparam EBRADRWIDTH = %d;\n", w-2 );

        int k;
        for ( k = 0; k < 16; k++ ) {
                fprintf( fo, "localparam prg%2.2X = 4096'h", k );
                for ( i = 511; i >= 0; i-- ) {
                        fprintf( fo, "%2.2x", program[k*512+i] );
                        if ( i && (i & 31) == 0 )
                                fprintf( fo, "_" );
                }
                fprintf( fo, ";\n" );
        }

// Does not work for SimplifyPro + Lattice iCECube2. Buffer overflow when reading edif from SimplifyPro        
//        fprintf( fo, "localparam prg = 65536'h" );
//        for ( i = 65536/8-1; i >= 0; i-- )
//                fprintf( fo, "%2.2x", program[i] );
//        fprintf( fo, ";\n" );
        
        fclose( fo );
        return 0;
}
        
