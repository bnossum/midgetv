/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * A test to see if I can get better compression while considering don't cares.



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

#define NREQATIONS (MIDGETV_UCODE_NREQ+8)
#define LUTSIZE 4
#define NREBR   2
#define NRCOLUMNS NREQATIONS
#define COLUMNMASK ((1uLL<<(MIDGETV_UCODE_NREQ+8))-1)

// This table is essentially the data to be selected from the 8-bit
// index
uint64_t ucode0[256] = {
#define x 0b0
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

// Some of the items in the table are don't care
uint64_t ucode1[256] = {
#define x 0b1
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
                " * 2019. Copyright B. Nossum.\n"
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
/* Gives back a modified table (some don't cares may have been transformed to fixed values).
 * fills in the indirect index and usedindex tables
 */
int nrdistinctlines( TBL **outtpp, int indirinx[], int usedindexes[], TBL const * const intp, uint64_t maskedcolumns ) {
        int j,k,kk;
        int distinct = 0;
        int aj,ak;
        int vj,vk;
        TBL *tp;

        if ( (tp = malloc( sizeof(TBL))) == NULL )
                ferr( "Mem\n");
        *tp = *intp;
        *outtpp = tp;
        
        for ( j = 0; j < 256; j++ ) {
                // Can line j be matched by any line already used?
                for ( k = 0; k < distinct; k++ ) {
                        for ( kk = 0; kk < NRCOLUMNS; kk++ ) {
                                if ( (maskedcolumns>>kk) & 1)
                                        continue;
                                aj = ((tp->a[j] >> kk) & 1);
                                vj = ((tp->v[j] >> kk) & 1);
                                ak = ((tp->a[usedindexes[k]] >> kk) & 1);
                                vk = ((tp->v[usedindexes[k]] >> kk) & 1);
                                // In colunmn kk:
                                // If we have valid value in line j (vj) and valid value in line k (vk), and the value is not the same
                                if ( vj && vk && aj != ak )
                                        break;  // line and j does not match under any circumstances
                        }
                        if ( kk == NRCOLUMNS ) {
                                // Lines match, but we may have to change some 'x' to a fixed value
                                for ( kk = 0; kk < NRCOLUMNS; kk++ ) {
                                        if ( (maskedcolumns>>kk) & 1)
                                                continue;
                                        aj = ((tp->a[j] >> kk) & 1);
                                        vj = ((tp->v[j] >> kk) & 1);
                                        ak = ((tp->a[usedindexes[k]] >> kk) & 1);
                                        vk = ((tp->v[usedindexes[k]] >> kk) & 1);
                                        
                                        // In colunmn kk, four cases
                                        // vj vk
                                        // 0  0  Both aj and ak are don't care, so there is no action to take
                                        // 0  1  Line j must be modified
                                        // 1  0  Line k must be modified
                                        // 1  1  We have aj == ak, or we would not be here. No action to take
                                        if ( vj != vk ) {
                                                if ( vk ) {
                                                        // Modify in line j
                                                        tp->a[j] &= ~(1ull << kk);        // Punch hole
                                                        tp->a[j] |= ((uint64_t)ak << kk); // Set to value                                                
                                                        tp->v[j] |= (1ull << kk);         // Column kk of line j now contain valid value
                                                } else {
                                                        // Modify in line usedindexes[k]
                                                        tp->a[usedindexes[k]] &= ~(1ull << kk);        // Punch hole
                                                        tp->a[usedindexes[k]] |= ((uint64_t)aj << kk); // Set to value                                                
                                                        tp->v[usedindexes[k]] |= (1ull << kk);         // Column kk of line k now contain valid value
                                                }
                                        }
                                }
                                break; // Line j matches allready seen k
                        }
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
/* Just plain stupid. Can't possibly run to completion,
   but show that there are combinations where I can 
   represent 15 columns with an indirect index.
   This is better than my presently running program,
   that represents 13 columns with an indirect index.
   Were I to reach at least 14 columns with my favoured 
   solution, I save 4 LUTs.

 111111111111111111111111111111111000000001 41 33 -1
 111111111111111111111111111111101000000001 32 32 33
 111111111111111111111111111110001100000001 31 31 32
 111111111111111111101111111110001100000001 30 30 31
 111111111111111110101111111100001100100001 29 29 30
 111111111111111010001111111100001100110001 28 28 -1
 111111111111110000001111111101001100110001 27 27 28


* Total columns to represent in EBRs: 42
 * 176 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 174 176 174 176 176 176 176 175 176 176 176 176 176 176 176 176 176 176 176 176 176 176 175 176 175 176 176 175 176 176 173 176 176 176 176 176 173 174 175 176 175   x  kill col  5  Tbl  40 cols 000000000000000000000000000000000000100001 has 173 unique lines.
 * 171 173 171 173 173 173 173 172 173 173 173 173 173 173 173 173 173 173 173 173 173 173 172 173 172 173 173 171 173 173 170 173 173 173 173 173     170 171 173 172   x  kill col  4  Tbl  39 cols 000000000000000000000000000000000000110001 has 170 unique lines.
 * 168 170 168 170 170 170 169 169 170 170 170 170 170 170 170 170 170 170 170 170 170 170 169 170 169 170 170 168 170 170 167 170 170 170 170 170         164 170 169   x  kill col  3  Tbl  38 cols 000000000000000000000000000000000000111001 has 164 unique lines.
 * 162 164 162 164 164 164 163 163 164 164 164 164 164 164 164 164 164 164 164 164 164 164 163 164 162 164 164 160 164 164 160 164 164 164 164 164             163 163   x  kill col 11  Tbl  37 cols 000000000000000000000000000000100000111001 has 160 unique lines.
 * 158 160 158 160 160 158 158 159 160 160 160 160 160 160 160 160 160 160 160 160 160 160 159 160 158 160 160 156 160 160     160 160 160 160 160             159 159   x  kill col 14  Tbl  36 cols 000000000000000000000000000100100000111001 has 156 unique lines.
 * 154 156 153 155 156 154 154 154 156 156 156 156 156 156 156 156 156 156 156 156 156 156 155 156 155 156 156     156 156     156 156 156 156 156             155 155   x  kill col 39  Tbl  35 cols 001000000000000000000000000100100000111001 has 153 unique lines.
 * 150 153     152 151 150 148 150 153 153 153 153 153 153 153 153 153 153 153 153 153 153 152 153 152 153 153     153 153     153 153 153 153 153             152 152   x  kill col 35  Tbl  34 cols 001000100000000000000000000100100000111001 has 148 unique lines.
 * 144 148     145 144 145     142 148 148 148 148 148 148 148 148 148 148 148 148 148 148 147 148 146 148 147     148 148     148 148 146 148 148             147 147   x  kill col 34  Tbl  33 cols 001000110000000000000000000100100000111001 has 142 unique lines.
 * 138 140     137 137 138         142 142 142 142 142 142 142 142 142 142 142 142 142 142 141 141 139 141 141     142 142     142 142 140 142 142             141 141   x  kill col 37  Tbl  32 cols 001010110000000000000000000100100000111001 has 137 unique lines.
 * 133 134     129     128         137 137 137 137 137 137 137 137 137 137 137 137 137 137 136 136 133 136 135     137 137     137 136 133 137 136             136 136   x  kill col 36  Tbl  31 cols 001011110000000000000000000100100000111001 has 128 unique lines.
 * 120 122     117                 128 128 128 128 128 128 128 127 128 128 128 128 128 127 127 127 123 126 124     128 128     128 126 125 128 127             127 127   x  kill col 38  Tbl  30 cols 001111110000000000000000000100100000111001 has 117 unique lines.
 * 107 105                         117 117 117 117 117 117 116 114 117 117 117 117 117 115 115 116 112 114 113     117 117     117 114 115 117 114             116 116   x  kill col 40  Tbl  29 cols 011111110000000000000000000100100000111001 has 105 unique lines.
 *  89                             105 105 105 105 105 105 103 102 105 104 105 105 102 103 103 104  97 100  98     105 105     105 102 100 105 102             104 104   x  kill col 41  Tbl  28 cols 111111110000000000000000000100100000111001 has  89 unique lines.
 *                                  89  89  89  89  89  89  88  87  89  88  88  89  86  86  87  88  78  79  81      89  89      89  86  85  89  85              88  88   x  kill col 17  Tbl  27 cols 111111110000000000000000100100100000111001 has  78 unique lines.
 *                                  78  78  78  78  78  78  77  76  77  77  76  78  75  76  76  77      69  68      78  78      78  75  74  78  73              77  77   x  kill col 15  Tbl  26 cols 111111110000000000000000101100100000111001 has  68 unique lines.
 *                                  67  68  68  68  68  68  67  66  67  67  66  68  65  66  65  66      59          68  68      68  66  64  68  63              67  67   x  kill col 16  Tbl  25 cols 111111110000000000000000111100100000111001 has  59 unique lines.
 *                                  58  59  58  59  58  59  58  57  58  58  57  59  55  58  56  57                  59  59      59  58  55  59  55              58  58   x  kill col  6  Tbl  24 cols 111111110000000000000000111100100001111001 has  55 unique lines.
 *                                  54  55  54  55  54  55  54  53  54  54  53  55  51  54  52  53                  55  55      55  54  52  55                  54  54   x  kill col 21  Tbl  23 cols 111111110000000000001000111100100001111001 has  51 unique lines.
 *                                  50  51  49  51  50  51  50  50  50  50  49  51      48  47  48                  51  51      51  49  48  51                  50  50   x  kill col 19  Tbl  22 cols 111111110000000000001010111100100001111001 has  47 unique lines.
 *                                  46  47  43  47  46  47  46  46  46  46  45  47      45      43                  47  47      47  45  44  47                  46  46   x  kill col 18  Tbl  21 cols 111111110000000000001011111100100001111001 has  43 unique lines.
 *                                  42  43  39  43  42  43  42  42  42  42  41  43      41                          43  43      42  41  40  43                  42  42   x  kill col 31  Tbl  20 cols 111111110010000000001011111100100001111001 has  39 unique lines.
 *                                  38  38      39  38  39  38  38  38  38  37  38      34                          39  38      38  37  36  39                  38  38   x  kill col 20  Tbl  19 cols 111111110010000000001111111100100001111001 has  34 unique lines.
 *                                  32  31      34  33  33  33  33  33  33  31  33                                  33  32      33  32  32  34                  33  33   x  kill col 23  Tbl  18 cols 111111110010000000101111111100100001111001 has  31 unique lines.
 *                                  29  29      31  30  29  30  30  30  27      30                                  30  29      30  29  29  31                  30  30   x  kill col 24  Tbl  17 cols 111111110010000001101111111100100001111001 has  27 unique lines.
 *                                  26  25      27  26  25  26  26  26          26                                  26  25      26  25  25  27                  26  26   x  kill col  8  Tbl  16 cols 111111110010000001101111111100100101111001 has  25 unique lines.
                                                                                                                                                                                                      111111111111111111111111111111111000000001 41 33 -1 
 *                                  24  23      24  23  23  24  24  24          24                                  24  23      24  22      25                  24  24   x  kill col  9  Tbl  15 cols 111111110010000001101111111100101101111001 has  22 unique lines.
                                                                                                                                                                                                      111111111111111111111111111111101000000001 32 32 33
 *                                  21  19      21  20  20  21  21  20          21                                  20  19      21          22                  21  21   x  kill col 12  Tbl  14 cols 111111110010000001101111111101101101111001 has  19 unique lines.
                                                                                                                                                                                                      111111111111111111111111111110001100000001 31 31 32
 *                                  18  17      18  17  17  18  18  17          18                                  18          18          19                  18  18   x  kill col 25  Tbl  13 cols 111111110010000011101111111101101101111001 has  17 unique lines.
                                                                                                                                                                                                      111111111111111111101111111110001100000001 30 30 31
 *                                  16  15      16  15  15  16  16              16                                  16          16          17                  16  16   x  kill col 28  Tbl  12 cols 111111110010010011101111111101101101111001 has  15 unique lines.  aka 29
                                                                                                                                                                                                      111111111111111110101111111100001100100001 29 29 30
                                                                                                                                                                                                      111111111111111010001111111100001100110001 28 28 -1
                                                                                                                                                                                                      111111111111110000001111111101001100110001 27 27 28
                                                                                                                                                                                                      
 */
int g_maxlevel = 24; //28;
int g_sollevel = -1;
void process2( TBL *tpin, uint64_t maskedcolumns, int startloopat, int level ) {
        int j,a;
        TBL *outtp;
        int usedindexes[256];
        int indirinx[256];

        if ( level > g_maxlevel )
                return;
        
        
        for ( j = startloopat; j >= 0; j-- ) {
                if ( (maskedcolumns >> j) & 1 )
                        continue;
                a = nrdistinctlines( &outtp, indirinx, usedindexes, tpin, maskedcolumns | (1uLL<<j) );
                if ( a <= (1<<LUTSIZE)) {
                        //printf( "Solution removing %d columns\n", level );
                        FVECTORPRI( stderr, (uint32_t *)&maskedcolumns, NRCOLUMNS );
                        printf( " %d %d %d\n", g_maxlevel, level, g_sollevel );
                        
                        g_sollevel = level;
                        g_maxlevel = level - 1;
                        free( outtp );
                        return;
                }
                process2( outtp, maskedcolumns | (1uLL<<j), j-1, level+1 );
                free( outtp );
        }
}

/////////////////////////////////////////////////////////////////////////////
void printheader( TBL *tp, uint64_t maskedcolumns ) {
        int m,j;
        TBL *outtp;
        int usedindexes[256];
        int indirinx[256];
        
        m = nrdistinctlines( &outtp, indirinx, usedindexes, tp, maskedcolumns );
        free( outtp );
        fprintf( fo, " * %d distinct lines in remaining untreated columns\n * ", m );
        for ( j = NRCOLUMNS-1; j >= 0; j-- ) {
                if (  j > 9 ) {
                        fprintf( fo, "c" );
                } else {
                        fprintf( fo, " c" );
                }
                fprintf( fo, "%d ", j );
        }
        fprintf( fo, "\n" );
}

/////////////////////////////////////////////////////////////////////////////
void dbg_enterprocess( TBL *tp, uint64_t maskedcolumns ) {
        int i;
        printf( "m= " );
        FVECTORPRI( stdout, (uint32_t *)&maskedcolumns, NRCOLUMNS );
        printf( "\n" );
        for ( i = 0; i < 25; i++ ) {
                printf( "%2.2x ", i );
                VECTOR3PRI( (uint32_t *)&tp->a[i], (uint32_t *)&tp->v[i], NRCOLUMNS ); printf( "\n" );
        }
}

/////////////////////////////////////////////////////////////////////////////
//
int g_best_so_far = 0;
int g_reportlevelback = 0;

TBL g_besttable;
uint64_t g_mask;
uint64_t g_doc_maskedcolumns;

int process( TBL *tpin, uint64_t maskedcolumns, int level ) {
        int a, j;
        int usedindexes[256];
        int indirinx[256];
        TBL *outtp;
        int ma = 100000;
        TBL *tp = tpin;
        int lines_if_col_removed[NRCOLUMNS];
        uint64_t m;

        /* First find out how many lines would be in a table if a column j is removed
         * Try this for all columns that has not been used allready.
         * Retain the lowest number of lines we find (ma).
         */
        for ( j = 0; j < NRCOLUMNS; j++ ) {
                if ( (maskedcolumns >> j) & 1 ) 
                        continue;                
                a = nrdistinctlines( &outtp, indirinx, usedindexes, tp, maskedcolumns | (1uLL<<j));
                free( outtp );
                lines_if_col_removed[j] = a;
                if ( a < ma  ) 
                        ma = a; 
        }

        /* For each of the columns that lead to a table with only ma lines:
         * 
         */
        for ( j = 0; j < NRCOLUMNS; j++ ) {
                if ( (maskedcolumns >> j) & 1 ) 
                        continue;
                if ( lines_if_col_removed[j] > ma ) 
                        continue;
                
                m = maskedcolumns | (1uLL<<j);
                a = nrdistinctlines( &outtp, indirinx, usedindexes, tp, m);
                if ( a <= (1<<LUTSIZE ) ) {
//                if ( a <= 11 ) { // Just to force 3 rounds temporarely
                        // Solution
                        int nrcolumnsreplaced = NRCOLUMNS - __builtin_popcountl(m);
                        if ( nrcolumnsreplaced > g_best_so_far ) {
                                fprintf( fo, "\n *          " );
                                uint64_t replacedcolumns    = (~m & ~g_doc_maskedcolumns) & COLUMNMASK;
                                FVECTORPRI( fo, (uint32_t *)&replacedcolumns, NRCOLUMNS );
                                fprintf( fo, " replaces %3d cols ", nrcolumnsreplaced );
                                g_best_so_far = nrcolumnsreplaced;
                                g_besttable = *outtp;
                                g_mask = m;
                                g_reportlevelback = level;
                        }
//                        return 1; Early out
                        return 0;
                }
                int success = process( outtp, m, level+1 );
                free( outtp );
                if ( success )
                        return 1;
        }
        /* Exhausted all possibilities */
        if ( level <= g_reportlevelback ) {
                g_reportlevelback = level;
                fprintf( stderr, "%d ", level );
        }

        /* Cut off. I assume that the first 10 columns that are replaced would be
         * replaced anyway. So if we are back at level < 10 with a solution we are done.
         */
        if ( level <= 10 )
                return g_best_so_far;
        else
                return 0;
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
void make_compressed_table( TBL *tblp,       // Specification
                            uint64_t replaces[],
                            uint64_t direct, // Bitmask of untouched columns
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
                                if ( ((direct >> j) & 1) == 0  )
                                        bb--;
                        }
                }
                if ( jj != nrebr*16 - rounds*LUTSIZE )
                        ferr( "Internal\n" );
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
                                        if ( iix >= (1ull<<lutsize) )
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
}

/////////////////////////////////////////////////////////////////////////////
void printf_result(
        uint64_t replaces[],
        int rounds, int nrebr, int lutsize, uint64_t direct, int bonus,
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
        printf( "   /*\n" );
        for ( k = 0; k < 256; k++ ) {
//        for ( k = 0; k < 25; k++ ) {
                printf( "    * %2.2x ", k );
                printf( "%-8s ", labeltext[k] );
                int next = (( ucode0[k] >> (NREQATIONS-8)) & 255);
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
        int bb = bonus;
        for ( j = 0; j < NREQATIONS; j++ ) {
                if ( ( (direct >> j) & 1 ) || bb ) {
                        printf( "   assign d[%d] = indir[%d];\n", j, jj );
                        jj++;
                        if ( ((direct >> j) & 1) == 0  )
                                bb--;
                }
        }

        int kluge = 32 - rounds*lutsize;
        int i;
        bb = bonus;
        for ( i = 0; i < rounds; i++ ) {
                fprintf( fo, "   // replaces = " ); FVECTORPRI( fo, (uint32_t *)&replaces[i], NRCOLUMNS ); fprintf( fo, "\n" );
                for ( j = 0; j < NREQATIONS; j++ ) {
                        if ( (replaces[i] >> j) & 1) {
                                if ( bb ) {
                                        bb--;
                                        continue;
                                }
                                printf( "   SB_LUT4 #(.LUT_INIT(16'h%4.4x)) cmb_d%2.2d(.O(d[%2d]),.I3(indir[%d]),.I2(indir[%d]),.I1(indir[%d]),.I0(indir[%d]));\n",
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
        int rounds = 0;
        int fails = 0;
        int extra_column_for_indexes  = 0;
        int saved_columns_by_indirect = 0;
        uint64_t newmaskedcolumns;
        
        tblp = initiate();
        fo = stderr;
        
//        printf_preamble();
//        fprintf( fo, "/* Using LUTSIZE=%d. Using %d EBR%s Initial table has  %d columns\n", LUTSIZE, NREBR, NREBR == 1 ? "." : "s.", NRCOLUMNS );

        
        uint64_t maskedcolumns = 1; // Critical signal sa00 is not to be part of optimalization
//        uint64_t maskedcolumns = 0b000000001001111010010100000000010010000111;
        
        fprintf( fo, " * Reserved:" );
        FVECTORPRI( fo, (uint32_t *)&maskedcolumns, NRCOLUMNS );
        fprintf( fo, " (columns to be represented directly, not part of optimalization)\n" );

//        int ttt = NRCOLUMNS;
//        int cccnr = 0;
//        uint64_t  ccc = 0;
//        int usedindexes[16][256];
//        int indirinx[16][256];
//        uint64_t replaces[16];
//
//        process2( tblp, maskedcolumns, NRCOLUMNS-1, 0 );
//        ferr( "SFSG\n" );
        
        while (1) {
                fprintf( fo, " * Total columns to represent in EBRs: %d+%d-%d = %d ",
                         NRCOLUMNS, extra_column_for_indexes, saved_columns_by_indirect,
                         NRCOLUMNS + extra_column_for_indexes - saved_columns_by_indirect
                        );

                /* Result is given back in global variables
                 * For next iteration we have a more extensive mask
                 */
                g_doc_maskedcolumns = maskedcolumns;
                process( tblp, maskedcolumns, 0 ); 
                newmaskedcolumns = g_mask;
                g_best_so_far = 0;
                //*tblp = g_besttable;

                
                rounds++;
                uint64_t replacedcolumns    = (~newmaskedcolumns & ~maskedcolumns) & COLUMNMASK;
                int      replaces_nrcolumns = __builtin_popcountll(replacedcolumns);

                //fprintf( fo, "\n" );
                //FVECTORPRI( fo, (uint32_t *)&maskedcolumns,    NRCOLUMNS );  fprintf( fo, " maskedcolumns\n" );
                //FVECTORPRI( fo, (uint32_t *)&newmaskedcolumns, NRCOLUMNS );  fprintf( fo, " newmaskedcolumns\n" );
                //FVECTORPRI( fo, (uint32_t *)&replacedcolumns,  NRCOLUMNS );  fprintf( fo, " replacedcolumns\n" );
                

                if ( replaces_nrcolumns <= LUTSIZE ) {
                        fprintf( fo, "\nNo gain, replaces %d columns with %d columns as index\n", replaces_nrcolumns, LUTSIZE );
                        fails = 1;
                        break;
                }
                maskedcolumns |= replacedcolumns;
                
                fprintf( fo, " *\n * Round %d: ", rounds);
                extra_column_for_indexes += LUTSIZE;
                saved_columns_by_indirect += replaces_nrcolumns;

                if ( NRCOLUMNS + extra_column_for_indexes - saved_columns_by_indirect <= (16*NREBR) )
                        break;
        }
                
//                replaces[rounds-1] = replacedcolumns;
//                FVECTORPRI( fo, (uint32_t *)&replacedcolumns, NRCOLUMNS );                
//                TBL *outtp;
//                int ndl = nrdistinctlines(&outtp, indirinx[rounds-1], usedindexes[rounds-1],tblp,replacedcolumns);
//                free( tblp);
//                tblp = outtp;
//                fprintf( fo, " %2d columns for indexes to table representing %2d original columns (uses %d of %d lines in indirect table).\n",
//                         LUTSIZE, replaces_nrcolumns, ndl, (1<<LUTSIZE) );
//                
          //      ttt = ttt - replaces_nrcolumns + LUTSIZE;
          //      if ( ttt <= 16*NREBR ) {
          //              fprintf( fo, " * Direct:  " );
          //              ccc = (~maskedcolumns & COLUMNMASK) | reservedcolumns;
          //              cccnr = __builtin_popcountll( ccc );
          //              FVECTORPRI( fo, (uint32_t *)&ccc, NRCOLUMNS );
          //              fprintf( fo, " %2d columns\n", cccnr );
          //              break;
          //      }
         
        if ( fails ) {
                fprintf( fo, "Failed\n" );
        } else {
                fprintf( fo, " * Total columns to represent in EBRs: %d+%d-%d = %d ",
                         NRCOLUMNS, extra_column_for_indexes, saved_columns_by_indirect,
                         NRCOLUMNS + extra_column_for_indexes - saved_columns_by_indirect
                        );
//                 int underutilization = 16*NREBR - ttt;
//                 if ( underutilization < 0 )
//                         ferr( "Something is seriously wrong\n" );
//                 if ( underutilization > 0 )
//                         fprintf( fo, " * Can even chose %d more column%s to be represented directly.\n", underutilization, underutilization == 1 ? "" : "s" );
//                 fprintf( fo, " * Success. Use %d %s", NREBR, NREBR < 2 ? "EBR" : "EBRs" );
//                 if ( LUTSIZE > 4 ) {
//                         fprintf( fo, ".\n" );
//                 } else {
//                         fprintf( fo, ", %d LUTs.\n", saved_columns_by_indirect-underutilization );
//                 }
//                 fprintf( fo, " */\n\n" );
// 
//                 uint32_t lutval[20][NREQATIONS];
//                 make_compressed_table(tblp,replaces,ccc,underutilization,rounds,NREBR,LUTSIZE, indirinx, lutval );
// //                printf_result(replaces, rounds,NREBR,LUTSIZE,ccc,underutilization,lutval);
                fprintf( fo, "Success\n" );
        }
        return 0;
}

