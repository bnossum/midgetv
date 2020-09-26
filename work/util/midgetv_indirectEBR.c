/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This is an utility to reduce the number of columns that needs to be stored
 * in EBR. Overall description is simply given by an example.
 *
 * Originally we have a table with 42 columns. I chose a number of columns,
 * say columns 1,2,7,10,22,25,26,27,28,29,30,32,33, that is 13 columns in all. 
 * When I examine all 256 lines of the table in these columns, I see that there 
 * is only 15 distinct lines. But this mean I can replace these columns with a 
 * 4-bit index, instantiate 13 LUTs to give the original columns. The table
 * can be compressed to a table with 42-13+4 = 33 columns. This process
 * can be repeated on the remaining unused columns.
 * 
 * The trick is to find out what columns to remove. I have no good heuristics,
 * but do the following:
 *   As long as the unmasked columns leads to a table with more than
 *   (1<<LUTSIZE) lines, suppress the column that remove the most lines
 *   from a table. In case of a tie remove the first seen. Continue to mask
 *   more and more columns until the table of unmasked columns has no more
 *   than (1<<LUTSIZE) lines.
 *
 * For this particular problem it works.
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <assert.h>
#include <stdarg.h>

#include "bnvector.h"


#define ferr(...) exit( fprintf( stderr, "%s:%d: ", __FILE__, __LINE__ ) + fprintf(stderr, __VA_ARGS__))
// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)

/////////////////////////////////////////////////////////////////////////////
typedef struct {
        uint64_t a[256];      // Value for all columns given an index
        uint64_t v[256];      // Whether a column is valid or not
} TBL;

/////////////////////////////////////////////////////////////////////////////
// Definitions to work from
//

// Data input makes use of labels, define them
typedef enum {
#define X(label,txt,def,reachability,mask,instr,nrhit) label,
#include fname
        _LEND
} LABELS;

#define NREQATIONS MIDGETV_UCODE_NREQ
#define LUTSIZE 4
#define NREBR   2
#define NRCOLUMNS NREQATIONS
#define COLUMNMASK ((1uLL<<(MIDGETV_UCODE_NREQ))-1)

// This table is essentially the data to be selected from the 8-bit
// index
uint64_t ucode0[256] = {
#define x 0b0ull
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

// Some of the items in the table are don't care
uint64_t ucode1[256] = {
#define x 0b1ull
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

// Some input lines must be mapped to the same output line That is,
// the lines are fixed.
uint32_t fixpos[256] = {
#define Y(fixedpos,paired,...) fixedpos,
#include fname
};

// Some lines (none of the fixed lines) must appear on consequtive
// output lines. Such pairs must be placed on output pairs where the
// first line in the pair has an index xxxxxxx0. i, e, imagine a pair
// on input lines 14 and 15. A possible mapping would be to output
// lines 146 147.  155, 156 would be illegal.
uint32_t pairedpos[256] = {
#define Y(fixedpos,paired,...) paired,
#include fname
};

const char *tbltxt[256] = {
#define X(label,text,value,reachability,mask,instr,nrhit) text,
#include fname
};

char *labeltext[256] = {
#define X(label,txt,def,reachability,mask,instr,nrhit) STR(label),
#include fname
};

FILE *fo;

/////////////////////////////////////////////////////////////////////////////
void printf_preamble( void ) {
        printf( 
                "/* -----------------------------------------------------------------------------\n"
                " * Part of midgetv\n"
                " * 2019-2020. Copyright B. Nossum.\n"
                " * For licence, see LICENCE\n"
                " * -----------------------------------------------------------------------------\n"
                " * Automatically generated from %s by %s.\n"
                " * Do not edit\n"
                " */\n", fname, __FILE__ );
}


/////////////////////////////////////////////////////////////////////////////
TBL *initiate( void ) {
        TBL *tblp;
        int64_t i;
        
        if ( (tblp = calloc(1, sizeof(TBL))) == NULL )
                ferr( "Que?\n" );

        // Now fill in the entire input table
        for ( i = 0; i < 256; i++ ) {                
                tblp->a[i] = ucode0[i];
                tblp->v[i] = (ucode1[i]^ucode0[i]^~0uLL) & COLUMNMASK;
        }
        return tblp;
}

/////////////////////////////////////////////////////////////////////////////
/* Actually a bit to strict.
 */
int nrdistinctlines( int indirinx[], int usedindexes[], TBL *tp, uint64_t maskedcolumns ) {
        int j,k,kk;
        int distinct = 0;
        int aj,ak;
//        int vj,vk;
        
        for ( j = 0; j < 256; j++ ) {
                // Can line j be matched by any line already used?
                for ( k = 0; k < distinct; k++ ) {
                        for ( kk = 0; kk < NRCOLUMNS; kk++ ) {
                                if ( (maskedcolumns>>kk) & 1)
                                        continue;
                                aj = ((tp->a[j] >> kk) & 1);
//                                vj = ((tp->v[j] >> kk) & 1);
                                ak = ((tp->a[usedindexes[k]] >> kk) & 1);
//                                vk = ((tp->v[usedindexes[k]] >> kk) & 1);
                                // In colunmn k:
                                // Must have value in line j (vj) and must have value in line k (vk), and the value is not the same
//                                if ( vj && vk && aj != ak )
                                if ( aj != ak )
                                        break;  // line and j does not match
                        }
                        if ( kk == NRCOLUMNS )
                                break; // Line j matches allready seen k
                }
                indirinx[j] = k;
                if ( k == distinct ) {
                        usedindexes[distinct] = j;
                        distinct++; // No line [0:j-1] match line j
                }
        }
        return distinct;
}

/////////////////////////////////////////////////////////////////////////////
uint64_t process( TBL *tp, uint64_t maskedcolumns ) {
        int m, a, j, mi;
        uint64_t originalremoved = maskedcolumns;
        int usedindexes[256];
        int indirinx[256];
        
        m = nrdistinctlines( indirinx, usedindexes, tp, maskedcolumns );
//        if ( m < (1<<LUTSIZE) ) 
//                ferr( "Should not be here, only %d disinct lines left in untreated columns\n", m );

        fprintf( fo, " * %d distinct lines in remaining untreated columns\n * ", m );
//        for ( j = NRCOLUMNS-1; j >= 0; j-- ) { I believe this is the wrong way.
        for ( j = 0; j < NRCOLUMNS; j++ ) { 
                if (  j > 9 ) {
                        fprintf( fo, "c" );
                } else {
                        fprintf( fo, " c" );
                }
                fprintf( fo, "%d ", j );
        }
        fprintf( fo, "\n" );
        /* As long as the unmasked columns leads to a table with
         * more than (1<<LUTSIZE) lines, suppress the column that
         * remove the most lines from a table. In case of a tie
         * remove the first seen. Continue to mask more and more
         * columns until the table of unmasked columns has no
         * more than (1<<LUTSIZE) lines.
         */
        int ma;
        while ( (m  = nrdistinctlines( indirinx, usedindexes, tp, maskedcolumns )) > (1<<LUTSIZE)) {
                ma = m;
                fprintf( fo, " * " );
//                for ( j = NRCOLUMNS-1; j >= 0; j-- ) {
                for ( j = 0; j < NRCOLUMNS; j++ ) {
                        if ( maskedcolumns & (1uLL << j ) ) {
                                if (originalremoved & (1uLL << j ) ) {
                                        fprintf( fo, "  x " );
                                } else {
                                        fprintf( fo, "    " );
                                }
                                continue;
                        }
                        a = nrdistinctlines( indirinx, usedindexes, tp, maskedcolumns | (1uLL<<j));
                        fprintf( fo, "%3d ", a );

                        /*
                          Here is code to determine what column to mask
                          out. I have no good heuristics.
                          Real-life example dictate I simply
                          take the first processed line.
                        */

                        if ( a <= ma ) { // Must be "<=" to ensure mi is valid
                                ma = a; // To remove the column that simplifies mostx
                                mi = j;
                        }
                }
                
                fprintf( fo, " kill col %2d  ", mi );
                maskedcolumns |= (1uLL<<mi);
                
                fprintf( fo, "Tbl %3d cols ", NRCOLUMNS - __builtin_popcountl(maskedcolumns) );
                FVECTORPRI( fo, (uint32_t *)&maskedcolumns, NRCOLUMNS );
                int ndl = nrdistinctlines( indirinx, usedindexes, tp, maskedcolumns);
                fprintf( fo, " has %3d unique lines.\n", ndl );
                
        }        
        return maskedcolumns;
}

/////////////////////////////////////////////////////////////////////////////
uint64_t inpow2( int a, ... ) {
        va_list ap;
        uint64_t v = (1ull << a);
        if ( a == -1 )
                return 0;
        va_start(ap,a);
        while ( (a = va_arg(ap, int )) > 0 ) 
                v |= (1ull<<a);
        va_end(ap);
        return v;
}

/////////////////////////////////////////////////////////////////////////////
TBL ctbl;
// Give back untouched columns out. Here the bonus columns are included
uint64_t make_compressed_table( TBL *tblp,       // Original
                            uint64_t replaces[],
                            uint64_t direct, // Bitmask of untouched columns - in.
                            int bonus,//        Can squeeze in a number of columns due to vacancies
                            int rounds, //      Each round need LUTSIZE index bits
                            int nrebr,//        Will always be 2. Limited effort to make this general
                            int lutsize, //     Will always be 4. Limited effort to make this general
                            int indirinx[16][256], //
                            uint32_t lutval[20][NREQATIONS] //
        ) {
        int buggerall = 0;
        int k,j;
        int i;
        uint64_t direct_out = direct;
        
        if ( nrebr != 2 || lutsize != 4)
                ferr( "Revise code\n" );
        
        for ( k = 0; k < 256; k++ ) {
                int jj = 0;
                int bb = bonus;
                for ( j = 0; j < NREQATIONS; j++ ) {
                        if ( ( (direct >> j) & 1 ) || bb ) {
                                ctbl.a[k] |=  (((tblp->a[k] >> j) & 1) << jj);
                                ctbl.v[k] |=  (((tblp->v[k] >> j) & 1) << jj);
                                jj++;
                                if ( ((direct >> j) & 1) == 0  ) {
                                        /* A bonus column. So now we call the column direct, and must
                                         * remove it from the replace specification. 
                                         */
                                        bb--;
                                        direct_out |= (1uLL<<j);
                                        for ( i = 0; i < rounds; i++ ) {
                                                if ( (replaces[i] >> j) & 1 ) {
                                                        replaces[i] ^= (1uLL << j);
                                                        break;
                                                }
                                        }
                                }
                        }
                }
                if ( jj != nrebr*16 - rounds*LUTSIZE )
                        ferr( "Internal. jj=%d, while nrebr*16 - rounds*LUTSIZE = %d*16-%d*%d = %d\n",
                              jj,  nrebr, rounds, LUTSIZE, nrebr*16 - rounds*LUTSIZE);
                for ( i = 0; i < rounds; i++ ) {
                        int iix = indirinx[i][k];
                        if ( iix >= (1<<lutsize) )
                                ferr( "Internal. iix=%d lutsize=%d\n", iix, lutsize );
                        ctbl.a[k] |= (iix << jj);
                        ctbl.v[k] |= (((1<<lutsize)-1)<<jj);
                        jj += lutsize;
                }
        }

        uint32_t lutbittouched[20][NREQATIONS];
        int c;
        for ( i = 0; i < rounds; i++ ) {
                for ( c = 0; c < NREQATIONS; c++ ) {
                        lutval[i][c] = 0;
                        lutbittouched[i][c] = 0;
                        if ( (replaces[i] >> c) & 1 ) {
                                for ( k = 0; k < 256; k++ ) {
                                        unsigned int iix = indirinx[i][k];
                                        if ( iix >= (1u<<lutsize) )
                                                ferr( "Que?\n" );
                                        /* All lines with index iix should have the same value v in column c, or column c holds a don't care value.
                                         * This mean that lutbit number iix for the lut of column c should have the value v.
                                         * This is also an internal check
                                         */
                                        unsigned int a = ((tblp->a[k] >> c) & 1);
                                        unsigned int v = ((tblp->v[k] >> c) & 1);

                                        if ( v ) {
                                                if ( ((lutbittouched[i][c]>>iix) & 1) == 0 ) {
                                                        lutbittouched[i][c] |= (1u<<iix);
                                                        lutval[i][c] |= (a<<iix);
                                                } else {
                                                        if ( ((lutval[i][c] >> iix) & 1) != a ) {
                                                                printf( "%d %2d 0x%2.2x 0x%x %d %4.4x %4.4x\n", i, c, k, iix, a, lutval[i][c], lutbittouched[i][c] );
                                                                buggerall = 1; // Difficult error
                                                        }
                                                }
                                        }
                                }
                        }
                        if ( buggerall )
                                ferr( "Buggerall\n" );

                }
        }
        return direct_out;
}

/////////////////////////////////////////////////////////////////////////////
void printf_result(
        uint64_t replaces[],
        int rounds, int nrebr, int lutsize, uint64_t direct,
        uint32_t lutval[20][NREQATIONS]
        ) {
        int k,j;

        
        if ( nrebr != 2 || lutsize != 4)
                ferr( "Extend code\n" );


        printf( "module m_2ebr\n" );
        printf( "  (\n" );
        printf( "   input         clk,\n" );
        printf( "   input [7:0]   minx,\n" );
        printf( "   input         progress_ucode,\n" );
        printf( "   output [47:0] d\n" );
        printf( "   );\n" );
        
        
        // First make extensive comment
        for ( int t = rounds-1; t > 0; t-- ) {
                printf( "   %c*                      ", t == rounds-1 ? '/' : ' ' );
                for ( k = rounds-1; k > t; k-- ) 
                        printf( "| " );
                printf( "indirect_index %d\n", t );
        }

        printf( "    * inx         next     " );
        for ( int t = 0; t < rounds-1; t ++ )
                printf( "| " );
        printf( "indirect index 0\n" );
        
        printf( "    * || ucode    ucode    " );
        for ( int t = 0; t < rounds; t ++ )
                printf( "| " );
        printf( "direct representation\n" );
        
        for ( k = 0; k < 256; k++ ) {
//        for ( k = 0; k < 25; k++ ) {
                printf( "    * %2.2x ", k );
                printf( "%-8s ", labeltext[k] );
                int next = ( ucode0[k] & 255);
                if ( next ) {
                        printf( "%-8s ", labeltext[next] );
                } else {
                        printf( "         " );
                }

                for ( int t = rounds-1; t >= 0; t-- ) {
                        int a = (( ctbl.a[k] >> (16*nrebr -lutsize*rounds +lutsize*t)) & ((1<<lutsize)-1) );
                        //int v = (( ctbl.v[k] >> (16*nrebr -lutsize*rounds +lutsize*t)) & ((1<<lutsize)-1) );

                        printf( "%x ", a);
                }                
                for ( j = 31 - rounds*lutsize; j >= 0; j-- ) {
                        int a = (( ctbl.a[k] >>j) & 1);
                        int v = (( ctbl.v[k] >>j) & 1);
                        
                        printf( "%c", v ? '0'+a : 'x' );
                }

                
                printf( "| %s\n" , tbltxt[k] );
        }
        printf( "    */\n" );

        // Localparams for u1 and u2

        // Convert the 256 deep 64 bit wide ctbl to
        // 4 256 deep 16 bit wide, this is a simple slicing.
        uint16_t rom[4][256];
        int kk;
        for ( kk = 0; kk < 4; kk++ ) 
                for ( k = 0; k < 256; k++ ) 
                        rom[kk][k] = (ctbl.a[k] >> (16*kk)) & 0xffff;
        
        // Write out each of the ROMs in use with 16 entries in each INIT_x
        for ( kk = 0; kk < nrebr; kk++ ) {
                for ( k = 0; k < 16; k++ ) {
                        printf( "   localparam u%d_%X = 256'h", kk, k );
                        for ( j = 15; j >= 0; j-- ) 
                                printf( "%4.4x", rom[kk][k*16+j] );
                        printf( ";\n" );
                }
        }

        printf( "   wire [31:0]   indir;\n" );
        printf( "`ifdef verilator\n" );
        printf( "   /* verilator lint_off UNUSED */\n" );
        printf( "   wire [15:0]   sim_a;\n" );
        printf( "   wire [15:0]   sim_b;\n" );
        printf( "   /* verilator lint_on UNUSED */\n" );
        printf( "`endif\n" );
        printf( "   \n" );
        printf( "   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),\n" );
        printf( "                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),\n" );
        printf( "                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),\n" );
        printf( "                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),\n" );
        printf( "                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)\n" );
        printf( "                   ) ucode0\n" );
        printf( "     (\n" );
        printf( "      .RDATA( indir[15:0]         ),\n" );
        printf( "      .RADDR( {3'h0,minx}         ),\n" );
        printf( "      .RCLK(  clk                 ),\n" );
        printf( "      .RCLKE( 1'b1                ),\n" );
        printf( "      .RE(    progress_ucode      ),\n" );
        printf( "      .WADDR( 11'h0               ),\n" );
        printf( "      .WCLK(  1'b0                ),\n" );
        printf( "      .WCLKE( 1'b0                ),\n" );
        printf( "      .WDATA( 16'h0               ),\n" );
        printf( "      .WE(    1'b0                ),\n" );
        printf( "      .MASK(  16'h0               )\n" );
        printf( "      );\n" );
        printf( "   \n" );
        printf( "   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),\n" );
        printf( "                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),\n" );
        printf( "                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),\n" );
        printf( "                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),\n" );
        printf( "                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)\n" );
        printf( "                   ) ucode1\n" );
        printf( "     (\n" );
        printf( "      .RDATA( indir[31:16]        ),\n" );
        printf( "      .RADDR( {3'h0,minx}         ),\n" );
        printf( "      .RCLK(  clk                 ),\n" );
        printf( "      .RCLKE( 1'b1                ),\n" );
        printf( "      .RE(    progress_ucode      ),\n" );
        printf( "      .WADDR( 11'h0               ),\n" );
        printf( "      .WCLK(  1'b0                ),\n" );
        printf( "      .WCLKE( 1'b0                ),\n" );
        printf( "      .WDATA( 16'h0               ),\n" );
        printf( "      .WE(    1'b0                ),\n" );
        printf( "      .MASK(  16'h0               )\n" );
        printf( "      );\n" );
        printf( "\n" );

        // Assign columns that remain in table. 'x' goes to '0'.
        int jj = 0;
        for ( j = 0; j < NREQATIONS; j++ ) {
                if ( (direct >> j) & 1 ) {
                        printf( "   assign d[%d] = indir[%d];\n", j, jj );
                        jj++;
                }
        }

        int kluge = 32 - rounds*lutsize;
        int i;
        for ( i = 0; i < rounds; i++ ) {
                fprintf( fo, "   // replaces = " ); FVECTORPRI( fo, (uint32_t *)&replaces[i], NRCOLUMNS ); fprintf( fo, "\n" );
                for ( j = 0; j < NREQATIONS; j++ ) {
                        if ( (replaces[i] >> j) & 1) {
                                printf( "   SB_LUT4 #(.LUT_INIT(16'h%4.4x)) cmb_d%2.2d(.O(d[%d]),.I3(indir[%d]),.I2(indir[%d]),.I1(indir[%d]),.I0(indir[%d]));\n",
                                        lutval[i][j], j, j, kluge+3, kluge+2, kluge+1, kluge+0 );
                        }
                }
                kluge += 4;
        }

        for ( i = NREQATIONS; i < 48; i++ ) 
                printf( "   assign d[%d] = 1'b0;\n", i );
        
        printf( "endmodule\n" );
}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        TBL *tblp;
        uint64_t maskedcolumns = 0;
        int rounds = 0;
        int fails = 0;
        
        tblp = initiate();
        fo = stdout;
        //if ( ( fo = fopen("/dev/null","w")) == NULL ) ferr( "Que?\n" );
        
        printf_preamble();
        fprintf( fo, "/* Using LUTSIZE=%d. Using %d EBR%s Initial table has %d columns\n", LUTSIZE, NREBR, NREBR == 1 ? "." : "s.", NRCOLUMNS );
        uint64_t newmaskedcolumns;
        uint64_t removecolumns = 0;
        uint64_t reservedcolumns = 0;
        
        //removecolumns   = inpow2( 6, 7, 10, 22, 27, 29, 30, 33, -1 ); // Result out of investigate14. Can represent these columns by combinations
//38 35 32 31 30 25 21 15 14 10 9 bad
        removecolumns = 0;//inpow2( 0, -1);
        reservedcolumns = inpow2( 18, -1); // Column should be represented directly         
                                                        
        int nrremoved = __builtin_popcountll(removecolumns);
        maskedcolumns = removecolumns;
        fprintf( fo, " * Removed:  " );
        FVECTORPRI( fo, (uint32_t *)&removecolumns, NRCOLUMNS );
        fprintf( fo, " These are treated already, removed from consideration\n" );
        fprintf( fo, " * Reserved: " );
        FVECTORPRI( fo, (uint32_t *)&reservedcolumns, NRCOLUMNS );
        fprintf( fo, " Columns to be represented directly, not part of optimalization\n" );
        maskedcolumns |= reservedcolumns;

        int ttt = NRCOLUMNS - nrremoved;
        int cccnr = 0;
        uint64_t  ccc = 0;
        int extra_column_for_indexes  = 0;
        int saved_columns_by_indirect = 0;
        int usedindexes[16][256];
        int indirinx[16][256];
        uint64_t replaces[16];
        
        while (1) {
                fprintf( fo, " * Total columns to represent in EBRs: %d\n", NRCOLUMNS + extra_column_for_indexes - saved_columns_by_indirect );
                newmaskedcolumns = process( tblp, maskedcolumns );
                rounds++;
                uint64_t tablewithcolumns = (~newmaskedcolumns & ~maskedcolumns) & COLUMNMASK;
                int      replaces_nrcolumns = __builtin_popcountll(tablewithcolumns);
                if ( replaces_nrcolumns <= LUTSIZE ) {
                        fprintf( fo, "No gain, replaces %d or less columns with %d columns as index\n", LUTSIZE, LUTSIZE );
                        fails = 1;
                        break;
                }
                maskedcolumns |= (~newmaskedcolumns & COLUMNMASK);
                
                fprintf( fo, " *\n * Round %d: ", rounds);
                extra_column_for_indexes += LUTSIZE;
                saved_columns_by_indirect += replaces_nrcolumns;
                //fprintf( fo, "[MAD %d %d]", saved_columns_by_indirect, replaces_nrcolumns );

                replaces[rounds-1] = tablewithcolumns;
                FVECTORPRI( fo, (uint32_t *)&tablewithcolumns, NRCOLUMNS );                
                int ndl = nrdistinctlines(indirinx[rounds-1], usedindexes[rounds-1],tblp,newmaskedcolumns);
                fprintf( fo, " %2d columns for indexes to table representing %2d original columns (uses %d of %d lines in indirect table).\n",
                         LUTSIZE, replaces_nrcolumns, ndl, (1<<LUTSIZE) );
                
                ttt = ttt - replaces_nrcolumns + LUTSIZE;
                if ( ttt <= 16*NREBR ) {
                        fprintf( fo, " * Direct:  " );
                        ccc = (~maskedcolumns & COLUMNMASK) | reservedcolumns;
                        cccnr = __builtin_popcountll( ccc );
                        FVECTORPRI( fo, (uint32_t *)&ccc, NRCOLUMNS );
                        fprintf( fo, " %2d columns\n", cccnr );
                        break;
                }
        } 
        if ( fails ) {
                fprintf( fo, "Failed\n" );
        } else {
                int underutilization = 16*NREBR - ttt;
                if ( underutilization < 0 )
                        ferr( "Something is seriously wrong\n" );
                if ( underutilization > 0 )
                        fprintf( fo, " * Can even chose %d more column%s to be represented directly.\n", underutilization, underutilization == 1 ? "" : "s" );
                fprintf( fo, " * Success. Use %d %s", NREBR, NREBR < 2 ? "EBR" : "EBRs" );
                if ( LUTSIZE > 4 ) {
                        fprintf( fo, ".\n" );
                } else {
                        fprintf( fo, ", %d LUTs.\n", saved_columns_by_indirect-underutilization );
                }
                fprintf( fo, " */\n\n" );

                uint32_t lutval[20][NREQATIONS];
                uint64_t direct_out;
                direct_out = make_compressed_table(tblp,replaces,ccc,underutilization,rounds,NREBR,LUTSIZE, indirinx, lutval );
                printf_result(replaces, rounds,NREBR,LUTSIZE, direct_out, lutval);
        }
        return 0;
}

