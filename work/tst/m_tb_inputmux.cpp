/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The input multiplexer is simple in itself, but rather confiugrable
 */

#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>
#include "Vm_tb_inputmux__Syms.h"
#include "verilated.h"

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__ )+fprintf(stderr,__VA_ARGS__))

/////////////////////////////////////////////////////////////////////////////
static uint32_t expandinput( uint32_t a ) {
//        uint32_t v;
//        v = 0; //            3322222222221111111111
//        //                   10987654321098765432109876543210
//        v |= (a & 0x0001) ? 0b00000000000000000000000000000111 : 0;
//        v |= (a & 0x0002) ? 0b00000000000000000000000000001000 : 0;
//        v |= (a & 0x0004) ? 0b00000000000000000000000001110000 : 0;
//        v |= (a & 0x0008) ? 0b00000000000000000000000010000000 : 0;
//        v |= (a & 0x0010) ? 0b00000000000000000000011100000000 : 0;
//        v |= (a & 0x0020) ? 0b00000000000000000000100000000000 : 0;
//        v |= (a & 0x0040) ? 0b00000000000000001111000000000000 : 0;
//        v |= (a & 0x0080) ? 0b00000000000000010000000000000000 : 0;
//        v |= (a & 0x0100) ? 0b00000000000000100000000000000000 : 0;
//        v |= (a & 0x0200) ? 0b11111111111111000000000000000000 : 0;
//        return v;

        /* No reason to be as thorough as above, 
           there is no interdepenency between the bits
        */
        return ( (1u << a) & 0xffffffffu );
                
}

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	Vm_tb_inputmux *tb = new Vm_tb_inputmux;

        uint32_t base_DAT_I,DAT_I;
        uint32_t base_MULDIVREG, MULDIVREG;
        uint32_t STB_O;
        uint32_t base_Dsram,Dsram;
        uint32_t clrM, ceM;

        uint32_t ADR_O,sysregs;
        for ( ADR_O = 0; ADR_O < (1<<30); ADR_O += (1<<27) ) {//        For select between system registers
                //fprintf(stderr,".");
                for ( sysregs = 0; sysregs < (1<<12); sysregs++ ) {

                        uint32_t mie         = (sysregs >>  0) & 1;  // Machine Interrupt enable in MSTATUS                                        
                        uint32_t mpie        = (sysregs >>  1) & 1;  // Machine Previous Interrupt enable in MSTATUS                               
                        uint32_t meie        = (sysregs >>  2) & 1;  // Machine External Interrupt Enable in MIE                                   
                        uint32_t mrinstretie = (sysregs >>  3) & 1;  // Machine Retired Instructions Retired Interrupt Enable in MIE. RENAME       
                        uint32_t msie        = (sysregs >>  4) & 1;  // Machine Software Interrupt Enable in MIE                                   
                        uint32_t mtie        = (sysregs >>  5) & 1;  // Machine Timer Interrupt Enable in MIE                                      
                        uint32_t mtimeincie  = (sysregs >>  6) & 1;  // Machine Time Increment Interrupt Enable in MIE                             
                        uint32_t mrinstretip = (sysregs >>  7) & 1;  // Machine Retired Instructions Retired Interrupt Pending in MIP. RENAME      
                        uint32_t msip        = (sysregs >>  8) & 1;  // Machine Software Interrupt Pending in MIP                                  
                        uint32_t mtip        = (sysregs >>  9) & 1;  // Machine Timer Interrupt Pending in MIP                                     
                        uint32_t mtimeincip  = (sysregs >> 10) & 1;  // Machine Time Increment Interrupt Pending in MIP                            
                        uint32_t meip        = (sysregs >> 11) & 1;  // Machine External Interrupt Pending in MIP                                  
                        
#define VHIGH 33
                        for ( ceM = 0; ceM < 2; ceM++ ) {
                                for ( clrM = 0; clrM < 2; clrM++ ) {                        
                                        for ( STB_O = 0; STB_O < 2; STB_O++ ) {
                                                for ( base_Dsram = 0; base_Dsram < VHIGH; base_Dsram++ ) {
                                                        Dsram = expandinput( base_Dsram );
                                                        for ( base_MULDIVREG = 0; base_MULDIVREG < VHIGH; base_MULDIVREG++ ) {
                                                                MULDIVREG = expandinput( base_MULDIVREG);
                                                                for ( base_DAT_I = 0; base_DAT_I < VHIGH; base_DAT_I++ ) {
                                                                        DAT_I = expandinput( base_DAT_I );
                                                                        
                                                                        tb->clk = 0;
                                                                        tb->corerunning = 1;
                                                                        tb->STB_O     = STB_O;
                                                                        tb->DAT_I     = DAT_I;
                                                                        tb->MULDIVREG = MULDIVREG;
                                                                        tb->Dsram     = Dsram;
                                                                        tb->clrM      = clrM;
                                                                        tb->ceM       = ceM;

                                                                        tb->mie         = mie         ;
                                                                        tb->mpie        = mpie        ;
                                                                        tb->meie        = meie        ;
                                                                        tb->mrinstretie = mrinstretie ;
                                                                        tb->msie        = msie        ;
                                                                        tb->mtie        = mtie        ;
                                                                        tb->mtimeincie  = mtimeincie  ;
                                                                        tb->mrinstretip = mrinstretip ;
                                                                        tb->msip        = msip        ;
                                                                        tb->mtip        = mtip        ;
                                                                        tb->mtimeincip  = mtimeincip  ;
                                                                        tb->meip        = meip        ;
                                                                        
                                                                        tb->eval();
                                                                        tb->clk = 1;
                                                                        tb->eval();
                                                                        
                                                                        
                                                                        
                                                                        uint32_t facit_0000 = DAT_I;
                                                                        uint32_t facit_0001 = STB_O ? DAT_I : MULDIVREG;
                                                                        uint32_t facit_0010 = STB_O ? DAT_I : Dsram;
                                                                        uint32_t STB_O_or_readM = STB_O | (ceM & clrM);
                                                                        uint32_t facit_0011 = STB_O_or_readM ? (STB_O ? DAT_I : MULDIVREG) : Dsram;
                                                                        uint32_t facit_1011 = STB_O_or_readM ? (DAT_I | MULDIVREG) : Dsram;
                                                                        uint32_t facit_0100;
                                                                        uint32_t facit_0100_dontcare = 0;
                                                                        uint32_t MIP     = (mrinstretip<<17) | (mtimeincip<<16) | (meip<<11) | (mtip<<7) | (msip<<3);
                                                                        uint32_t MIE     = (mrinstretie<<17) | (mtimeincie<<16) | (meie<<11) | (mtie<<7) | (msie<<3);
                                                                        uint32_t MSTATUS =                                        (1   <<11) | (mpie<<7) | (mie <<3);
                                                                        
                                                                        if ( STB_O == 1 ) {
                                                                                facit_0100 = DAT_I;
                                                                        } else {
                                                                                switch ( ADR_O >> 27 ) {
                                                                                case 0b000 :
                                                                                case 0b001 :
                                                                                case 0b010 :
                                                                                case 0b011 : facit_0100 = DAT_I;      break;
                                                                                case 0b100 : facit_0100_dontcare = 1; break;
                                                                                case 0b101 : facit_0100 = MIP;        break;
                                                                                case 0b110 : facit_0100 = MIE;        break;
                                                                                case 0b111 : facit_0100 = MSTATUS;    break;
                                                                                default : ferr( "Internal\n" );
                                                                                }
                                                                        }
                                                                        
                                                                        if ( tb->ty0000_rDee != facit_0000 )
                                                                                ferr( "Error in the simplest implementation..\n" );                                        
                                                                        if ( tb->ty0001_rDee != facit_0001 )
                                                                                ferr( "Error in impl 0001\n" );
                                                                        if ( tb->ty0010_rDee != facit_0010 )
                                                                                ferr( "Error in impl 0010\n" );
                                                                        if ( tb->ty0011_rDee != facit_0011 )
                                                                                ferr( "Error in impl 0011\n" );
                                                                        if ( tb->ty1011_rDee != facit_1011 )
                                                                                ferr( "Error in impl 1011\n" );
                                                                        if ( !facit_0100_dontcare && tb->ty0100_rDee != facit_0100 )
                                                                                ferr( "Error in impl 0100\n" );
                                                                }
                                                        }
                                                }
                                        }
                                }
                        }
                }
        }
        return 0;
}

