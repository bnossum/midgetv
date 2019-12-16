#include <stdlib.h>
#include "Vhumansized_muldiv.h"
#include "verilated.h"

#define W 4     // *Must* match definition in humansized_muldiv.v
#define STEP 1  // Set higher if W big (>12)

#define ferr(...) exit(fprintf(stdout,"%s:%d:",__FILE__,__LINE__)+fprintf(stdout,__VA_ARGS__))
#define PRI(...) 
//#define PRI(...) printf( __VA_ARGS__ )

int g_dbg_decimal = 1;


#define WMASK ((1ll<<(W))-1)
//                        addtype
//                        ||shifttype
//                        ||||load   
//                        |||||      
#define OP_LOAD         0b00001      
#define OP_UNSIGNED_ADD 0b00000      
#define OP_SLL          0b00110      
#define OP_SIGNED_ADD   0b01000      
#define OP_SRL          0b00010      
#define OP_SRA          0b00100      
#define OP_UNSIGNED_SUB 0b10000      


enum {
        OP_MULHU,             //      addop = OP_UNSIGNED_ADD; shiftop = OP_SRL; 
        OP_MULHSU,            //      addop = OP_SIGNED_ADD;   shiftop = OP_SRA; 
        OP_MULH,              //      addop = OP_SIGNED_ADD;   shiftop = OP_SRA; 
        OP_DIVU,              //      addop = OP_UNSIGNED_SUB; shiftop = OP_SLL; 
        OP_DIV                //      addop = OP_UNSIGNED_SUB; shiftop = OP_SLL; 
};


/////////////////////////////////////////////////////////////////////////////
const char *opstr[5] =
{
        "MULHU  ",
        "MULHSU ",
        "MULH   ",
        "DIVU   ",
        "DIV    ",
};



/////////////////////////////////////////////////////////////////////////////
void toggleclock( Vhumansized_muldiv *tb ) {
        tb->clk = 0;
        tb->eval();
        tb->clk = 1;
        tb->eval();
}

/////////////////////////////////////////////////////////////////////////////
void initregs( Vhumansized_muldiv *tb, int a) {
        tb->op = OP_LOAD;
        tb->Di = a;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void addcycle( Vhumansized_muldiv *tb, int multype, int b, int ci) {
        tb->op = multype;
        tb->Di = b;
        tb->ci = ci;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void shiftcycle( Vhumansized_muldiv *tb, int shifttype) {
        tb->op = shifttype;
        tb->Di = 0xba; // Don't care
        toggleclock(tb);
}

#define sext(n,v) ((((uint64_t)v)^(1ull<<(n-1)))-(1ull<<(n-1)))
//#define PMMASK ((1ull << (2*W))-1)
#define PMMASKd2 ((1ull << (2*W-1))-1)
#define PMMASK (2*PMMASKd2+1)

#define theabs(v) (( v & (1<<(W-1)) ) ? (((v^WMASK)+1)&WMASK) : v)

/////////////////////////////////////////////////////////////////////////////
void test_div( Vhumansized_muldiv *tb, int operation, const char *msg ) {
        int64_t a,b;
        int i,facitA = 0;
        int addop;
        int shiftop;
        int64_t aa,bb;
        int facit_MOD = 0;
        
        addop = OP_UNSIGNED_SUB;
        shiftop = OP_SLL; 

        for ( aa = 0; aa <= WMASK; aa += STEP ) {
                //fprintf( stderr, "." );
                a = ( operation == OP_DIVU ) ? aa : theabs(aa);
                
                for ( bb = 0; bb <= WMASK; bb += STEP ) {

                        //
                        // Setting up
                        //
                        b = ( operation == OP_DIVU ) ? bb :theabs(bb);

                        uint32_t invb = b^WMASK;                        
                        initregs( tb, a );

                        //
                        // Main routine
                        //
                        PRI( "LD  a=%3d b=%3d: rF,PM=%d,0x%4.4x\n", a, b, tb->dbg_rF, tb->PM );
                        for ( i = 0; i < W; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                shiftcycle(tb,shiftop);
                                PRI( "  sll:%d,0x%4.4x ", tb->dbg_rF, tb->PM );
                                addcycle(tb,addop,invb,1);
                                PRI( "add:%d,0x%4.4x\n", tb->dbg_rF, tb->PM );
                        }
                        // End adjustments
                        int calcA = tb->PM & WMASK;
                        int calcM = tb->PM >> W;
                        if ( operation == OP_DIV ) {
                                if ( ((aa ^ bb) & (1<<(W-1))) != 0 && bb != 0 ) {
                                        calcA = ((calcA^WMASK)+1) & WMASK;
                                }
                                if ( aa & (1<<(W-1))) {
                                        calcM = ((calcM^WMASK)+1) & WMASK;
                                }
                                PRI( "calcM=0x%x calcA=0x%x\n", calcM, calcA );

                        }

                        //
                        // Checking
                        //
                        switch ( operation ) {
                        case OP_DIVU  :
                                facitA = ( b == 0 ) ? WMASK : aa/bb;
                                facit_MOD = a - b * facitA;
                                facit_MOD &= WMASK;
                                break;
                        case OP_DIV :
                                // Facit to check against.
                                if ( bb == 0 ) {
                                        // Division by zero. Spec say: n/0 = -1 remainder = n
                                        facitA = WMASK;
                                        facit_MOD = aa;
                                        facitA &= WMASK;
                                } else if ( bb == WMASK && aa == (1<<(W-1)) ) {
                                        // Special case, division overflow. Spec say minint/-1 = minint, remainder = 0
                                        facitA = (1<<(W-1));
                                        facit_MOD = 0;
                                        facitA &= WMASK;
                                } else {                                        
                                        facitA = (int)sext(W,aa)/(int)sext(W,bb);
                                        facit_MOD = (aa - bb * facitA) & WMASK;
                                        facitA &= WMASK;
                                }
                                break;
                        }
                        
                        if ( calcA != facitA ) {
                                PRI( "DIV error. facitA = 0x%x = %d  calcA = 0x%x = %d\n", facitA, facitA, calcA, calcA );
                                PRI( "aa=0x%x=%d bb=0x%x=%d\n", aa, aa, bb, bb );
                                PRI( "a=%d b=%3d  PM=%3d facit=%3d\n", a, b, tb->PM, facitA );
                                PRI( "a=0x%x b=0x%x  PM=0x%x facit=0x%x\n", a, b, tb->PM, facitA );
                                ferr( "Error\n" );
                        }
                        if ( calcM != facit_MOD ) {
                                PRI( "MOD error. aa=0x%x=%d bb=0x%x=%d\n", aa, aa, bb, bb );
                                PRI( "facitA = 0x%x\n", facitA );
                                ferr( "calcM = 0x%d, facit_MOD=0x%x\n", calcM, facit_MOD );                                
                        }


                        // Display for the smallest good case:
                        if ( W == 4 ) {
                                int j;
                                if ( a == 0 && b == 0 ) {
                                        printf( "%s", opstr[operation] );
                                        for ( j = 0; j < 16; j++ ) {
                                                if ( g_dbg_decimal ) {
                                                        if ( operation == OP_DIVU ) {
                                                                printf( "  %3d ", j );
                                                        } else {
                                                                printf( "  %3d ", (int)sext(4,j) );
                                                        }
                                                } else {
                                                        printf( " 0x%x  ", j );
                                                }
                                        }                                        
                                        printf( "\n------" );
                                        for ( j = 0; j < 16; j++ ) 
                                                printf( "------" );
                                        printf( "\n" );
                                }
                                if ( b == 0 ) {
                                        if ( g_dbg_decimal ) {
                                                if ( operation == OP_DIVU ) {
                                                        printf( " %3d | ", (int) aa );
                                                } else {
                                                        printf( " %3d | ", (int)sext(4,aa) );
                                                }
                                        } else {
                                                printf( "0x%x | ", (int) aa );
                                        }
                                }
                                if ( g_dbg_decimal ) {
                                        if ( operation == OP_DIVU ) {
                                                printf( "%2d.%2d ", (int) facitA, (int) facit_MOD);
                                        } else {
                                                printf( "%2d.%2d ", (int)sext(4,facitA), (int)sext(4,facit_MOD) );
                                        }
                                } else {
                                        printf( "  %1.1x.%1.1x ", (int) facitA, (int) facit_MOD);
                                }
                                if ( bb == 15 )
                                        printf( "\n" );
                        }
                        
                }
        }
        printf( "%s", msg );
}



/////////////////////////////////////////////////////////////////////////////
void test_mul( Vhumansized_muldiv *tb, int operation, const char *msg ) {
        int64_t a,b,i,facit;
        int addop;
        int shiftop;
        
        switch ( operation ) {
        case OP_MULHU :  addop = OP_UNSIGNED_ADD; shiftop = OP_SRL; break;
        case OP_MULHSU : addop = OP_SIGNED_ADD;   shiftop = OP_SRA; break;
        case OP_MULH   : addop = OP_SIGNED_ADD;   shiftop = OP_SRA; break;
        default : ferr( "QQ?\n" );
        }

        for ( a = 0; a <= WMASK; a += STEP ) {
                //fprintf( stderr, "." );
                for ( b = 0; b <= WMASK; b += STEP ) {

                        //
                        // Set up
                        //
                        uint32_t invb = b ^ WMASK;                        
                        initregs( tb, a );
                        PRI( "LD  a=%3d b=%3d: rF,PM=%d,0x%4.4x\n", a, b, tb->dbg_rF, tb->PM );

                        //
                        // Main routine
                        //
                        for ( i = 0; i < W-1; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                addcycle(tb,addop,b,0);
                                PRI( "  add:%d,0x%4.4x ", tb->dbg_rF, tb->PM );
                                shiftcycle(tb,shiftop);
                                PRI( "slr:%d,0x%4.4x\n", tb->dbg_rF, tb->PM );
                        }
                        switch ( operation ) {
                        case OP_MULHU :
                        case OP_MULHSU :
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                addcycle(tb,addop,b,0);
                                PRI( "  add:%d,0x%4.4x ", tb->dbg_rF, tb->PM );
                                shiftcycle(tb,shiftop);
                                PRI( "slr:%d,0x%4.4x\n", tb->dbg_rF, tb->PM );
                                break;
                        case OP_MULH :
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                addcycle(tb,addop,invb,1);
                                PRI( "  add:%d,0x%4.4x ", tb->dbg_rF, tb->PM );
                                shiftcycle(tb,shiftop);
                                PRI( "slr:%d,0x%4.4x\n", tb->dbg_rF, tb->PM );
                                break;
                        default : ferr( "Que?\n" );
                        }

                        //
                        // Checking
                        //
                        uint32_t rawfacit;
                        switch ( operation ) {
                        case OP_MULHU  :
                                facit = a * b;
                                break;
                        case OP_MULHSU :
                                rawfacit = (a * sext(W,b));
                                facit = rawfacit & PMMASK;
                                break;
                        case OP_MULH :
                                facit = sext(W,a) * sext(W,b);
                                facit &= PMMASK;
                                break;
                        }
                        
                        if ( tb->PM != (uint64_t) facit ) {
                                PRI( "a=%d b=%3d  PM=%3d facit=%3d\n", a, b, tb->PM, facit );
                                PRI( "a=0x%x b=0x%x  PM=0x%x facit=0x%x\n", a, b, tb->PM, facit );
                                ferr( "Error\n" );
                        }

                        // Display for the smallest good case:
                        if ( W == 4 ) {
                                int j;
                                if ( a == 0 && b == 0 ) {
                                        printf( "%s", opstr[operation] );
                                        for ( j = 0; j < 16; j++ ) {
                                                if ( g_dbg_decimal ) {
                                                        if ( operation == OP_MULHU ) {
                                                                printf( "  %3d ", j );
                                                        } else {
                                                                printf( "  %3d ", (int)sext(4,j) );
                                                        }
                                                } else {
                                                        printf( " 0x%x  ", j );
                                                }
                                        }                                        
                                        printf( "\n------" );
                                        for ( j = 0; j < 16; j++ ) 
                                                printf( "------" );
                                        printf( "\n" );
                                }
                                if ( b == 0 ) {
                                        if ( g_dbg_decimal ) {
                                                if ( operation != OP_MULH ) {
                                                        printf( " %3d | ", (int) a );
                                                } else {
                                                        printf( " %3d | ", (int)sext(4,a) );
                                                }
                                        } else {
                                                printf( "0x%x | ", (int) a );
                                        }
                                }
                                if ( g_dbg_decimal ) {
                                        if ( operation == OP_MULHU ) {
                                                printf( " %4d ", (int) facit);
                                        } else {
                                                printf( " %4d ", (int)sext(8,facit));
                                        }
                                } else {
                                        printf( " 0x%2.2x ", (int) facit);
                                }
                                if ( b == 15 )
                                        printf( "\n" );
                        }
                }
        }
        printf( "%s", msg );
}


/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);
	Vhumansized_muldiv *tb = new Vhumansized_muldiv;	

        printf( "Calculate for W = %d\n", W );
        test_mul(tb, OP_MULHU,  "MUL u * u OK\n" );
        test_mul(tb, OP_MULHSU, "MULHSU u * s OK\n" );
        test_mul(tb, OP_MULH,   "MULH s * s OK\n" );
        test_div(tb, OP_DIVU,   "DIVU u/u and REM u/u OK\n" );
        test_div(tb, OP_DIV,    "DIV s/s and REM s/s OK\n" );
        
        exit(EXIT_SUCCESS);
}
