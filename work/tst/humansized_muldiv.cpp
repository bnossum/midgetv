#include <stdlib.h>
#include "Vhumansized_muldiv.h"
#include "verilated.h"

#define W 4     // *Must* match definition in humansized_muldiv.v W==12 -> 30min execution time
#define STEP 1  // Set higher if W big (>12)

#define ferr(...) exit(fprintf(stdout,"%s:%d:",__FILE__,__LINE__)+fprintf(stdout,__VA_ARGS__))
#define PRI(...) 
#define PRI2(...) 
//#define PRI(...) printf( __VA_ARGS__ )
//#define PRI2(...) printf( __VA_ARGS__ )

int g_dbg_decimal = 1;
int g_tables = 1;

#define WMASK ((1<<(W))-1)
//                        addtype
//                        ||shifttype
//                        ||||loadMn  
//                        |||||      
#define OP_LOAD         0b00000      
#define OP_UNSIGNED_ADD 0b00001      
#define OP_SLL          0b00111      
#define OP_SIGNED_ADD   0b01001      
#define OP_SRL          0b00011      
#define OP_SRA          0b00101      
#define OP_UNSIGNED_SUB 0b10001      

#define sext(n,v) ((((uint32_t)v)^(1u<<(n-1)))-(1u<<(n-1)))
//#define QMMASK ((1u << (2*W))-1)
#define QMMASKd2 ((1u << (2*W-1))-1)
#define QMMASK (2*QMMASKd2+1)

#define theabs(v) (( v & (1<<(W-1)) ) ? (((v^WMASK)+1)&WMASK) : v)

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
        tb->op    = OP_LOAD;
        tb->en    = 1;
        tb->loadMn= 0;
        tb->enm   = 1;
        tb->clrm  = 0;
        tb->DAT_O = a;
        tb->s_alu_carryin = 0;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void addcycle( Vhumansized_muldiv *tb, int op, int b, int ci) {

        PRI2( "addop=%x ", op );
        tb->en    = 1;
        tb->loadMn= 1;
        tb->enm   = 0;
        tb->clrm  = 0;
        tb->sa00mod = 1;
        tb->s_alu = 0b100; // ADD, may be changed to PASSQ
        tb->DAT_O = b;
        tb->op = op;
//        tb->set_ci_1 = ci;
        tb->s_alu_carryin = ci ? 0b11 : 0b00;
        toggleclock(tb);
        //PRI2( "isadd=%d cmb_rF = %d cmb_rF2 = %d ", tb->isadd, tb->cmb_rF, tb->cmb_rF2 );
}

/////////////////////////////////////////////////////////////////////////////
void shiftcycle( Vhumansized_muldiv *tb, int op) {
        tb->en    = 1;
        tb->loadMn= 1;
        tb->enm   = 1;
        tb->clrm  = 0;
        tb->s_alu = 0b001; // PASSD
        tb->s_alu_carryin = 0;
        tb->sa00mod = 0;
        tb->DAT_O = 0;
        tb->op = op;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void divaddcycle( Vhumansized_muldiv *tb, int b) {

        int op = OP_UNSIGNED_SUB;

        PRI2( "addop=%x ", op );
        tb->en    = 1;
        tb->loadMn= 1;
        tb->enm   = 0;
        tb->clrm  = 0;
        tb->sa00mod = 1;
        tb->s_alu = 0b100; // ADD
        tb->DAT_O = b;
        tb->op = op;
        tb->s_alu_carryin = 0b11;
        tb->eval(); // Can remove
        //PRI2( "(in:%x+%x+%x  %d^%d^%d isadd=%d cmb_rF=%d cmb_rF2=%d conden=%d B=0x%x) ", tb->DAT_O, tb->Q, tb->acy & 1,tb->Dmsb, tb->Pmsb, (tb->acy>>W)&1, tb->isadd, tb->cmb_rF, tb->cmb_rF2, tb->conden, tb->B );
        toggleclock(tb);
        //PRI2( "isadd=%d cmb_rF = %d cmb_rF2 = %d conden = %d ", tb->isadd, tb->cmb_rF, tb->cmb_rF2, tb->conden );
        //PRI2( "(out:%x+%x+%x  %d^%d^%d) ", tb->DAT_O, tb->Q, tb->acy & 1,tb->Dmsb, tb->Pmsb, (tb->acy>>W)&1 );


}

/////////////////////////////////////////////////////////////////////////////
void divshiftcycle( Vhumansized_muldiv *tb) {
        int op = OP_SLL; 

        tb->en    = 1;
        tb->loadMn= 1;
        tb->enm   = 1;
        tb->clrm  = 0;
        tb->s_alu = 0b101; // SHLQ
        tb->s_alu_carryin = 0b10; // Shift M[msb] into Q[0]
        tb->sa00mod = 1;
        tb->DAT_O = WMASK;
        tb->op = op;
        toggleclock(tb);
}

//
///////////////////////////////////////////////////////////////////////////////
void test_div( Vhumansized_muldiv *tb, int operation, const char *msg ) {
        int32_t a,b;
        int i,facitA = 0;
        int32_t aa,bb;
        int facit_MOD = 0;
        
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
                        PRI( "LD  a=%3d b=%3d: rF,QM=%d,0x%4.4x\n", a, b, tb->rF, tb->QM );
                        for ( i = 0; i < W; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                divshiftcycle(tb);
                                PRI( "  sll:%d,0x%4.4x ", tb->rF, tb->QM );
                                divaddcycle(tb,invb);
                                PRI( "add:%d,0x%4.4x\n", tb->rF, tb->QM );
                        }
                        // End adjustments
                        int calcA = tb->QM & WMASK;
                        int calcM = tb->QM >> W;
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
                                PRI( "a=%d b=%3d  QM=%3d facit=%3d\n", a, b, tb->QM, facitA );
                                PRI( "a=0x%x b=0x%x  QM=0x%x facit=0x%x\n", a, b, tb->QM, facitA );
                                ferr( "Error\n" );
                        }
                        if ( calcM != facit_MOD ) {
                                PRI( "MOD error. aa=0x%x=%d bb=0x%x=%d\n", aa, aa, bb, bb );
                                PRI( "facitA = 0x%x\n", facitA );
                                ferr( "calcM = 0x%d, facit_MOD=0x%x\n", calcM, facit_MOD );                                
                        }


                        // Display for the smallest good case:
                        if ( W == 4 && g_tables ) {
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
        int32_t a,b,i,facit;
        int shiftop,addop;
        
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
                        PRI( "LD  a=%3d b=%3d:  rF,QM=%d,0x%4.4x\n", a, b, tb->rF, tb->QM );

                        //
                        // Main routine
                        //
                        int willadd __attribute__((unused));
                        for ( i = 0; i < W-1; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                willadd = tb->QM & 1;
                                addcycle(tb,addop,b,0);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                shiftcycle(tb,shiftop);
                                PRI( "shift:%d,0x%4.4x \n", tb->rF, tb->QM );
                        }
                        switch ( operation ) {
                        case OP_MULHU :
                        case OP_MULHSU :
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                willadd = tb->QM & 1;
                                addcycle(tb,addop,b,0);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                shiftcycle(tb,shiftop);
                                PRI( "shift:%d,0x%4.4x\n", tb->rF, tb->QM );
                                break;
                        case OP_MULH :
                                PRI( "i=%d a=%3d b=%3d::", i, a, b );
                                willadd = tb->QM & 1;
                                addcycle(tb,addop,invb,1);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                shiftcycle(tb,shiftop);
                                PRI( "shift:%d,0x%4.4x\n", tb->rF, tb->QM );
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
                                facit = rawfacit & QMMASK;
                                break;
                        case OP_MULH :
                                facit = sext(W,a) * sext(W,b);
                                facit &= QMMASK;
                                break;
                        }
                        
                        if ( tb->QM != (uint32_t) facit ) {
                                PRI( "a=%d b=%3d  QM=%3d facit=%3d\n", a, b, tb->QM, facit );
                                PRI( "a=0x%x b=0x%x  QM=0x%x facit=0x%x\n", a, b, tb->QM, facit );
                                ferr( "Error\n" );
                        }

                        // Display for the smallest good test case:
                        if ( W == 4 && g_tables ) {
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
                        //exit(4);
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
