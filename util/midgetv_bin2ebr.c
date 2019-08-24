/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Utility to map a binary file over to local parameters prg00, prg01, ... prg0F
 * that will ultimately end up as parameters INIT_0, INIT_1, ... INIT_F for the
 * 2, 4, 8 or 16 SB_RAM40_4K instances used as base probram mempry in midgetv.
 *
 * The strategy is simple:
 *  o The load address = relocation address starting at 0.
 *  o A binary file is read byte by byte, interpreted word by word. 
 *    The binary file is assumed little endian.
 *  o The first 4096 bits are represented as prg00, the next
 *    4096 bits goes to prg01, etc. The size of 4096 bit is chosen becase
 *    it seems to be a size that passes through all? tool-chains.
 *  o In iCE40, the maximum size to represent is 8 KiB, represented by
 *    prg00 through prg0F.
 *  o It is the work of the initcode in verilog to do the surprisingly tricky
 *    distribution and mangling of the bits so they end up in the right EBR 
 *    .INIT and at the right location in each .INIT.
 *
 * While it would be much easier to let an off-line tool handle distribution and
 * mangling of the binary file to produce a number of INIT_x's, this would have 
 * the disadvantage that a binary image would have had to be produced to a 
 * __specific__ EBR size. Midgetv can use 2, 4, 8 or 16 EBRs, and with the 
 * selected method the same program as compiled to prg0x (my version of INIT_x) 
 * can be loaded to any size midgetv (provided it is large enough of cause).
 * 
 * Possible enhancement:
 * This utility only fills the EBR used as system memory. But several ICE chips
 * will have "spare" EBRs that could be used using the SRAM or IO interface. These
 * EBRs could also be initiated. This is not done now - after all EBRs also have
 * other use.
 *
 * Available            |  The situation now             | 
 * resources  Nr   Nr   |  midget  midget  midget  Spare | Max
 * Chip       EBR  SRAM |  ucode   maxSys  maxSRAM EBRs  | Progsize 
 * -------------------- | ------------------------------ | --------- 
 * LP640        8     0 |  2        4      0        2    |   2 KiB 
 * LP1K/HX1K   16     0 |  2        8      0        6    |   4 KiB
 * LP4K/HX4K   20     0 |  2       16      0        2    |   8 KiB
 * LP8K/HX8K   32     0 |  2       16      0       14    |   8 KiB
 * ICE40UP3K   20     4 |  2       16      4        2    | 136 KiB  
 * ICE40UP5K   30     4 |  2       16      4       12    | 136 KiB  
 *
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
        
