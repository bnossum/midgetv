/* investigate14
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


#define LUTSIZE 4
#define NREBR   2
#define NRCOLUMNS 42
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
uint64_t fixpos[256] = {
#define Y(fixedpos,paired,...) fixedpos,
#include fname
};

// Some lines (none of the fixed lines) must appear on consequtive
// output lines. Such pairs must be placed on output pairs where the
// first line in the pair has an index xxxxxxx0. i, e, imagine a pair
// on input lines 14 and 15. A possible mapping would be to output
// lines 146 147.  155, 156 would be illegal.
uint64_t pairedpos[256] = {
#define Y(fixedpos,paired,...) paired,
#include fname
};

const char *tbltxt[256] = {
#define X(label,text,value,reachability,mask,instr,nrhit) text,
#include fname
};


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
int tostrict_nrdistinctlines( TBL *tp, uint64_t maskedcolumns ) {
        int j,k,kk;
        int distinct = 0;
        int aj,ak;
//        int vj,vk;
        
        for ( j = 0; j < 256; j++ ) {
                // Can line j be matched by any line (k < j)
                // in unmasked columns?
                for ( k = 0; k < j; k++ ) {
                        for ( kk = 0; kk < NRCOLUMNS; kk++ ) {
                                if ( (maskedcolumns>>kk) & 1)
                                        continue;
                                aj = ((tp->a[j] >> kk) & 1);
//                                vj = ((tp->v[j] >> kk) & 1);
                                ak = ((tp->a[k] >> kk) & 1);
//                                vk = ((tp->v[k] >> kk) & 1);
                                // In colunmn k:
                                // Must have value in line j (vj) and must have value in line k (vk), and the value is not the same
//                                if ( vj && vk && aj != ak )
                                if ( aj != ak )
                                        break;  // line and j does not match
                        }
                        if ( kk == NRCOLUMNS )
                                break; // Line j matches allready seen k
                }
                if ( k == j )
                        distinct++; // No line [0:j-1] match line j
        }
        return distinct;
}

/////////////////////////////////////////////////////////////////////////////
/* Actually a bit to strict.
 */
int nrdistinctlines( TBL *tp, uint64_t maskedcolumns ) {
        int j,k,kk;
        int distinct = 0;
        int aj,vj,ak,vk;
        int usedindexes[256] = { 0, };
        
        for ( j = 0; j < 256; j++ ) {
                // Can line j be matched by any line already used
                for ( k = 0; k < distinct; k++ ) {
                        for ( kk = 0; kk < NRCOLUMNS; kk++ ) {
                                if ( (maskedcolumns>>kk) & 1)
                                        continue;
                                aj = ((tp->a[j] >> kk) & 1);
                                vj = ((tp->v[j] >> kk) & 1);
                                ak = ((tp->a[usedindexes[k]] >> kk) & 1);
                                vk = ((tp->v[usedindexes[k]] >> kk) & 1);
                                // In colunmn k:
                                // Must have value in line j (vj) and must have value in line k (vk), and the value is not the same
                                if ( vj && vk && aj != ak )
                                        break;  // line and j does not match
                        }
                        if ( kk == NRCOLUMNS )
                                break; // Line j matches allready seen k
                }
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
        
        m = nrdistinctlines( tp, maskedcolumns );
//        if ( m < (1<<LUTSIZE) ) 
//                ferr( "Should not be here, only %d disinct lines left in untreated columns\n", m );

        printf( "%d distinct lines in remaining untreated columns\n", m );
        for ( j = NRCOLUMNS-1; j >= 0; j-- ) {
                if (  j > 9 ) {
                        printf( "c" );
                } else {
                        printf( " c" );
                }
                printf( "%d ", j );
        }
        printf( "\n" );
        /* As long as the unmasked columns leads to a table with
         * more than (1<<LUTSIZE) lines, suppress the column that
         * remove the most lines from a table. In case of a tie
         * remove the first seen. Continue to mask more and more
         * columns until the table of unmasked columns has no
         * more than (1<<LUTSIZE) lines.
         */
        int ma;
        while ( (m  = nrdistinctlines( tp, maskedcolumns )) > (1<<LUTSIZE)) {
                ma = m;
                for ( j = NRCOLUMNS-1; j >= 0; j-- ) {
                        if ( maskedcolumns & (1uLL << j ) ) {
                                if (originalremoved & (1uLL << j ) ) {
                                        printf( "  x " );
                                } else {
                                        printf( "    " );
                                }
                                continue;
                        }
                        a = nrdistinctlines( tp, maskedcolumns | (1uLL<<j));
                        printf( "%3d ", a );

                        /*
                          Here is code to determine what column to mask
                          out. I have no good heuristisc.
                          Real-life example dictate I simply
                          take the first processed line.
                        */

                        if ( a <= ma ) { // Must be "<=" to ensure mi is valid
                                ma = a; // To remove the column that simplifies mostx
                                mi = j;
                        }
                }
                
                printf( " kill col %2d  ", mi );
                maskedcolumns |= (1uLL<<mi);
                
                printf( "Tbl %3d cols ", NRCOLUMNS - __builtin_popcountl(maskedcolumns) );
                VECTORPRI( (uint32_t *)&maskedcolumns, NRCOLUMNS );
                printf( " has %3d unique lines.\n", nrdistinctlines( tp, maskedcolumns));
                
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
int main( void ) {
        TBL *tblp;
        uint64_t maskedcolumns = 0;
        int rounds = 0;
        int fails = 0;
        
        tblp = initiate();

        printf( "Using LUTSIZE=%d. Using %d EBR%s Initial table has  %d columns\n", LUTSIZE, NREBR, NREBR == 1 ? "." : "s.", NRCOLUMNS );
        uint64_t newmaskedcolumns;
        uint64_t removecolumns = 0;
        uint64_t reservedcolumns = 0;
        
        removecolumns = 0;//inpow2( 6, 7, 10, 22, 27, 29, 30, 33, -1 ); // Result out of investigate14. Can represent these columns by combinations
        reservedcolumns = inpow2( 0, -1); // Column should be represented directly         
        // reservedcolumns = inpow2( 1,2,3,4,-1);
                                                        
        int nrremoved = __builtin_popcountll(removecolumns);
        maskedcolumns = removecolumns;
        printf( "Removed:  " );
        VECTORPRI( (uint32_t *)&removecolumns, NRCOLUMNS );
        printf( " These are treated already, removed from consideration\n" );
        printf( "Reserved: " );
        VECTORPRI( (uint32_t *)&reservedcolumns, NRCOLUMNS );
        printf( " Columns to be represented directly, not part of optimalization\n" );
        maskedcolumns |= reservedcolumns;

        int ttt = NRCOLUMNS - nrremoved;
        int cccnr = 0;
        int expand_lutrequirement = 0;
        while (1) {
                printf( "Total columns to represent in EBRs: %d\n", ttt );
                newmaskedcolumns = process( tblp, maskedcolumns );
                rounds++;
                uint64_t tablewithcolumns = (~newmaskedcolumns & ~maskedcolumns) & COLUMNMASK;
                int      replaces_nrcolumns = __builtin_popcountll(tablewithcolumns);
                if ( replaces_nrcolumns <= LUTSIZE ) {
                        printf( "No gain, replaces %d or less columns with %d columns as index\n", LUTSIZE, LUTSIZE );
                        fails = 1;
                        break;
                }
                maskedcolumns |= (~newmaskedcolumns & COLUMNMASK);
                
                printf( "Round %d: ", rounds);
                VECTORPRI( (uint32_t *)&tablewithcolumns, NRCOLUMNS );
                printf( " %2d columns for indexes to table representing %2d original columns (has %d lines).\n",
                        LUTSIZE, replaces_nrcolumns, nrdistinctlines(tblp,newmaskedcolumns));
                expand_lutrequirement += replaces_nrcolumns;
                
                ttt = ttt - replaces_nrcolumns + LUTSIZE;
                if ( ttt <= 16*NREBR ) {
                        printf( "Direct:  " );
                        uint64_t ccc = (~maskedcolumns & COLUMNMASK) | reservedcolumns;
                        cccnr = __builtin_popcountll( ccc );
                        VECTORPRI( (uint32_t *)&ccc, NRCOLUMNS );
                        printf( " %2d columns\n", cccnr );
                        break;
                }
        } 
        if ( fails ) {
                printf( "Failed\n" );
        } else {
                int h = cccnr + rounds*LUTSIZE;
                if (  h < 16*NREBR ) {
                        h = 16*NREBR - h;
                        printf( "Can even chose %d more column%s to be represented directly.\n", h, h == 1 ? "" : "s" );
                }
                printf( "Success. Use %d EBR, %d LUTs\n", NREBR, expand_lutrequirement-h );
        }
        return 0;
}

