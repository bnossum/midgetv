/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Cycle-true simulation of midgetv where program/data is stored in EBR-ram and
 * SRAM. 
 * This file needs a cleanup.
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>

/* Naming of Verilator of generator blocks is a mystery for me. 
 * This macro __must__ correspond to parameter SRAMADRWIDTH in m_ice40sim_SRAM.v
 */
#define SRAM_ADRLINES 16
//#define SRAM_ADRLINES 17


#define _main
#include "common.h"
INFOCHUNK g_info = {
        ~0u ^ (INFO_skip_first64 | INFO_get_inexplcable | INFO_I_fields  ),
        41, // ucodetextlen
};

// To only output trace in specific regions
int g_suspendtrace;

/////////////////////////////////////////////////////////////////////////////
#define    EBRADRWIDTH  8 // Is a parameter to m_midgetv
#include "Vm_ice40sim_SRAM__Syms.h"


/////////////////////////////////////////////////////////////////////////////
#define regPC    0x88
#define regttime 0x8c

uint32_t getebr( Vm_ice40sim_SRAM *tb, uint32_t byteadr ) {
        uint32_t d;
        uint32_t wa = byteadr/4;
        if ( byteadr & 3 )
                ferr( "Que?\n" );
#if EBRADRWIDTH == 8 
//        d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__genblk5__DOT__ebr->get_as_16(wa) <<  0);
//        d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__genblk5__DOT__ebr->get_as_16(wa) << 16);
        d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->ebrb->genblk1__DOT__mem->get_as_16(wa) <<  0);
        d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->ebrh->genblk1__DOT__mem->get_as_16(wa) << 16);
#else
#error Not yet
#endif
        return d;
}

/////////////////////////////////////////////////////////////////////////////
uint32_t getsram( void *vtb, uint32_t byteadr ) {
        uint32_t d;
        if ( byteadr & 3 )
                ferr( "Que?\n" );
        /* The SRAM is addressed with its native address 0-0xffff.  In
         * case we want to dump it using the midgetv mapping (where
         * the SRAM is mapped t0 0xffff0000-0xffffffff) we mask the
         * high bits.
         */
        byteadr &= 0xFFFF; 
        uint32_t wa = byteadr/4;
        Vm_ice40sim_SRAM *tb =(Vm_ice40sim_SRAM *)vtb;
// With 16-bit ADR:
#if SRAM_ADRLINES == 16
        d =   (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__genblk1__DOT__m_ram_inst->sram0->get_as_16(wa) <<  0 );
        d |=  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__genblk1__DOT__m_ram_inst->sram1->get_as_16(wa) << 16 );
//old   d =   (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->sram0->get_as_16(wa) <<  0 );
//old   d |=  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->sram1->get_as_16(wa) << 16 );
#elif SRAM_ADRLINES == 17
        if ( (byteadr & 0x10000) == 0 ) {
                d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__0__KET____DOT__sram->get_as_16(wa) <<  0 );
                d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__1__KET____DOT__sram->get_as_16(wa) <<  0 );
//old           d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__0__KET____DOT__sram->get_as_16(wa) <<  0 );
//old           d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__1__KET____DOT__sram->get_as_16(wa) << 16 );
        } else {
                d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__0__KET____DOT__sram->get_as_16(wa) <<  0 );
                d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__1__KET____DOT__sram->get_as_16(wa) <<  0 );
//old           d =  (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__0__KET____DOT__sram->get_as_16(wa) <<  0 );
//old           d |= (tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__1__KET____DOT__sram->get_as_16(wa) << 16 );
        }
#endif
        return d;        
}

//../../obj_dir/Vm_ice40sim_SRAM_SB_SPRAM256KA.h:    uint32_t     TOP__v__inst_ice40sim_EBRonly__inst_midgetv_core__inst_ram__genblk2__DOT__genblk2__DOT__m_ram_inst__blk0__BRA__0__KET____DOT__blk1__BRA__0__KET____DOT__sram__get_as_16(uint32_t adr);

/////////////////////////////////////////////////////////////////////////////
/* Not finished.
 * Assumes a 64kBib SRAM
 */
void readout_ebr_sram(const char *hdrEBR, const char *hdrSRAM, int hexdumpit, Vm_ice40sim_SRAM *tb ) {
        int i;
        uint32_t d;

        if ( hdrEBR )
                printf( "%s", hdrEBR );
        for ( i = 0; i < (1<<EBRADRWIDTH)*4; i += 4 ) {
                d = getebr(tb, i );
                if ( ! hexdumpit ) {
                        printf("%4.4x %8.8x\n", i, d);
                } else {
                        if ( (i & (15*4)) == 0 )
                                printf( "%4.4x ", i );
                        printf( "%8.8x ", d );
                        if ( (i & (15*4)) == (15*4) )
                                printf( "\n" );
                }
        }
        if ( hdrSRAM )
                printf( "%s", hdrSRAM );
        for ( i = 0; i < (1<<14)*4; i += 4 ) {
                d = getsram(tb, i);
                if ( ! hexdumpit ) {
                        printf("%4.4x %8.8x\n", i, d);
                } else {
                        if ( (i & (15*4)) == 0 )
                                printf( "%4.4x ", i );
                        printf( "%8.8x ", d );
                        if ( (i & (15*4)) == (15*4) )
                                printf( "\n" );
                }
        }                
}

/////////////////////////////////////////////////////////////////////////////
void initialize_ebr_sram( Vm_ice40sim_SRAM *tb, FILE *fi, char *finame ) {
        int i,j,c;
        const int MAXEBR =  (16 * (4*1024)); //  16 EBR blocks give this number of bits
        const int MAXSRAM = (4 * (256*1024)); // 4 SRAM blocks give this number of bits
        const int MAXMEM = MAXEBR+MAXSRAM;
        uint8_t ebr[MAXMEM/8]; // Max total memory in bytes. Misnomer, should be called mem[].
        
        for ( i = 0; i < MAXMEM/8+1; i++ ) {
                if ( (c=getc(fi)) == EOF )
                        break;
                if ( i == MAXMEM/8 )
                        ferr( "Initial program larger than %d bytes can't fit\n", MAXMEM/8 );
                ebr[i] = c;
                //printf( "%x %x\n", i, c );
        }        
        PR( "To simulate: A %d = 0x%x bytes image from %s\n", i, i, finame );
//        if ( i & 3 )
//                ferr( "Program length %d not integral number of words, not neccessarely an error. Amend me\n", i );
        while ( i & 3 ) {
                ebr[i] = 0;
                i++;
        }
        
#if EBRADRWIDTH == 8
        /* The image is assumed to start with a complete dump of
         * EBR-based RAM
         */
        uint32_t h;
        //if ( i < 1024 ) ferr( "Image can not be suited for 2 EBR rams and 2 SRAMs\n" );
        for ( j = 0; j < 1024; j += 4 ) {
                uint32_t hb,hh;
                hb = (ebr[j+1]<<8) | ebr[j+0];
                hh = (ebr[j+3]<<8) | ebr[j+2];
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->ebrb->genblk1__DOT__mem->set_as_16(j>>2,hb);
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->ebrh->genblk1__DOT__mem->set_as_16(j>>2,hh);
        }
        /* Fill in SRAM
         */
        for ( ; j < i; j += 4 ) {
                int k = j-1024;

                h = (ebr[j+1]<<8) | ebr[j+0];
//                //if ( j == 1024 ) printf( "Lowhalf = 0x%4.4x\n", h );
#if SRAM_ADRLINES == 16                
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__genblk1__DOT__m_ram_inst->sram0->set_as_16(k>>2,h);
#elif SRAM_ADRLINES == 17
                if ( (k & 0x10000) == 0 ) {
                        tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__0__KET____DOT__sram->set_as_16(k>>2,h);
                } else {
                        tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__0__KET____DOT__sram->set_as_16(k>>2,h);
                }
#endif

                h = (ebr[j+3]<<8) | ebr[j+2];
//                //if ( j == 1024 ) printf( "Highhalf= 0x%4.4x\n", h );
#if SRAM_ADRLINES == 16                
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk2__DOT__genblk1__DOT__m_ram_inst->sram1->set_as_16(k>>2,h);
#elif SRAM_ADRLINES == 17
                if ( (k & 0x10000) == 0 ) {
                        tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__0__KET____DOT__blk1__BRA__1__KET____DOT__sram->set_as_16(k>>2,h);
                } else {
                        tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ram->genblk2__DOT__genblk1__DOT__m_ram_inst->blk0__BRA__1__KET____DOT__blk1__BRA__1__KET____DOT__sram->set_as_16(k>>2,h);
                }
#endif
        }
                
                
#elif EBRADRWIDTH == 11
                
        int k;
        uint16_t ew[16];
        for ( k = 0; k < 16; k++ )
                ew[k] = 0;
        for ( j = 0; j < MAXEBR/8; j += 4 ) {
                uint32_t w;
                uint32_t wa = j/4;

                if ( j < i ) {
                        w =
                                ((uint32_t)ebr[j+0] << 0) |
                                ((uint32_t)ebr[j+1] << 8) |
                                ((uint32_t)ebr[j+2] <<16) |
                                ((uint32_t)ebr[j+3] <<24);
                } else {
                        w = 0;
                }
                
                // Two and two bits of w to each of 16 ebrs, organized as 16 wide.
                
                for ( k = 0; k < 16; k++ ) 
                        ew[k] |= ( ((w >> (k*2)) & 3) << (2*(wa&7)) );
                
                if ( (wa & 7) == 7 ) {
                        for ( k = 0; k < 16; k++ ) {
                                switch ( k ) {
                                case 0x0 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x1 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break; 
                                case 0x2 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__2__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x3 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__3__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x4 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__4__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x5 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__5__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x6 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__6__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x7 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__7__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x8 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__8__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x9 : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__9__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0xa : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__10__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xb : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__11__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xc : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__12__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xd : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__13__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xe : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__14__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xf : tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ebr->b0__BRA__15__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;                                        
                                }
                        }
                        for ( k = 0; k < 16; k++ )
                                ew[k] = 0;
                }
        }
        /* Fill in SRAM
         */
        uint32_t h;
        for ( ; j < i; j += 4 ) {
                int k = j-1024;
                h = (ebr[j+1]<<8) | ebr[j+0];
                //if ( j == 1024 ) printf( "Lowhalf = 0x%4.4x\n", h );
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_sram->genblk2__DOT__blk0__BRA__0__KET____DOT__blk1__BRA__0__KET____DOT__sram->set_as_16(k>>2,h);
                h = (ebr[j+3]<<8) | ebr[j+2];
                //if ( j == 1024 ) printf( "Highhalf= 0x%4.4x\n", h );
                tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_sram->genblk2__DOT__blk0__BRA__0__KET____DOT__blk1__BRA__1__KET____DOT__sram->set_as_16(k>>2,h);
        }
               
#else
#error Not yet
#endif
//        readout_ebr( "Just a test\n", 1, tb );

}



/////////////////////////////////////////////////////////////////////////////
//void readout_ucode(Vm_ice40sim_SRAMsim_EBRonly *tb ) {
//        int i;
//        uint64_t d;
//        
//        for ( i = 0; i < 256; i++ ) {
//                d =  ((uint64_t)tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ucode->genblk1__DOT__inst_3ebr->ucode0->get_as_16(i) <<  0);
//                d |= ((uint64_t)tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ucode->genblk1__DOT__inst_3ebr->ucode1->get_as_16(i) << 16);
//                d |= ((uint64_t)tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->inst_ucode->genblk1__DOT__inst_3ebr->ucode2->get_as_16(i) << 32);
//                printf("%2.2x %16.16" PRIx64 "\n", i, d);
//        }
//}

/////////////////////////////////////////////////////////////////////////////
/* SLTU x0,rs1,rs2 is used to give simulation hints
 * 0000000 rs2   rs1   011 00000 0110011  SLTU x0,rs1,rs2
 * 1111111 00000 00000 111 11111 1111111  mask
 */
enum {
        ST_HINT_INACTIVE,
        ST_HINT_SILENCE,
        ST_HINT_SIMEXIT,
        ST_HINT_SIMERROR
};

int check_for_simulationhint( FILE *lfo, char *imagetosimnamep, Vm_ice40sim_SRAM *tb, int silent) {
        static uint32_t prevI = 0;
        static int st;
        uint32_t I = tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->get_I();
        
        uint32_t a;
        int use_dinx = tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->get_use_dinx();
        int accesserror = tb->v->inst_ice40sim_EBRonly->inst_midgetv_core->get_accesserror();
        if ( accesserror ) {
                printf( "ACCESS ERROR\n" );
                g_accesserror = 1;
        }
                
                
        if ( use_dinx )
                g_nrinstr++;

        switch ( st ) {
        case ST_HINT_SILENCE :
                if ( prevI == I ) break; // No change
                st = ST_HINT_INACTIVE;
                // One hint may be followed by another so fallthrough
        case ST_HINT_INACTIVE :
                if ( prevI == I ) break;             // No change
                //if ( (I & 0x3fff) != 0x3033 ) break; // No hint
                if ( (I & 0xfe007fff) != 0x3033 ) break; // No hint

                /* When running the compliance suite, "sltu x0, x1,
                 * x2" is encountered in programs I-RF_x0-01.S and
                 * I-SLTU-01.S. I take the chanse that these are the
                 * only places it is tested, and simply make a command
                 * line parameter that allow me to ignore my hints for
                 * a number of encounters
                 */
                if ( g_ignorehint ) {
                        g_ignorehint--;
                        break;
                }
                a = (I>>15) & 0x3ff;
                if ( a < 0x300 ) {
                        if ( a != 0 ) {
                                printf( "Simulation ended with error code 0x%x\n", a );
                                if ( silent < 2 ) {
                                        fprintf( lfo, "%40s: Simulation ended with error code 0x%x\n", imagetosimnamep, a );
                                }
                        }
                        return a == 0 ? ST_HINT_SIMEXIT : ST_HINT_SIMERROR;
                } else if ( a < 0x320 ) {
                        //ferr( "SFSG\n" );
                        //fprintf( stderr, "huffa a=%d [%x]", a, getebr(tb, (a-0x300)*4 ) & 0xff);
                        printf( "%c", getebr(tb, (a-0x300)*4 ) & 0xff);
                        st = ST_HINT_SILENCE;
                } else if ( a < 0x340 ) {
                        printf( "%8.8x ", getebr(tb, (a-0x320)*4 ) );
                        fflush(stdout);
                } else if ( a == 0x340 ) {
                        g_suspendtrace = 0;                        
                } else if ( a == 0x341 ) {
                        g_suspendtrace = 1;
                } else if ( a == 0x3ff ) {
                        if ( ! silent )
                                readout_ebr_sram( "core dump as requested by hint. EBR\n", "SRAM\n", 1, tb );
                        st = ST_HINT_SILENCE; // Kill output of rest of instruction
                } else {
                        // Free for now
                }
                break;
        case ST_HINT_SIMEXIT :
                ferr( "Sim exit hint was not honoured previous cycle?\n" );
        default :
                ferr( "Unknown simulationhintstate\n" );
        }
        prevI = I;
        return st;
}
                        
                
/////////////////////////////////////////////////////////////////////////////
void simprintf( uint32_t cy, Vm_ice40sim_SRAM *tb ) {
        if ( g_suspendtrace )
                return;
#define STARTOFHIER tb->v->inst_ice40sim_EBRonly->inst_midgetv_core
        g_info.minx           = STARTOFHIER->get_minx();
        g_info.a              = STARTOFHIER->get_progress_ucode_etc();
        g_info.progress_ucode = (g_info.a>>3) & 1;
        g_info.pc             = getebr(tb, regPC);
        g_info.I              = STARTOFHIER->get_I();
        g_info.ucode          = (uint32_t)(STARTOFHIER->inst_ucode->get_sa() & 0xFFFFffff);
        g_info.usedinx        = STARTOFHIER->inst_ucodepc->get_usedinx();
        g_info.dinx           = STARTOFHIER->inst_ucodepc->get_dinx();
        g_info.ucodepcinfo    = STARTOFHIER->inst_ucodepc->get_ucodepcinfo();
        g_info.rai            = STARTOFHIER->get_Rai();
        g_info.ADR_O          = STARTOFHIER->get_ADR_O();
        g_info.B              = STARTOFHIER->get_B();
        g_info.dbg_stb_ack    = STARTOFHIER->inst_progressctrl->get_dbg_stb_ack();
        g_info.stb_ack        = STARTOFHIER->get_stb_ack();
//        g_info.inexplicable   = STARTOFHIER->inst_inputmux->get_inexpliccableerror();
        g_info.interruptinfo  = STARTOFHIER->genblk1__DOT__inst_status_and_interrupts->get_interruptinfo();
        g_info.sel_O          = STARTOFHIER->get_SEL_O();
        g_info.enaQ           = STARTOFHIER->get_enaQ();
        g_info.clearQ         = STARTOFHIER->get_clearQ();
        g_info.wai            = STARTOFHIER->get_Wai();
        g_info.iwe            = STARTOFHIER->get_iwe();
        g_info.theio          = STARTOFHIER->get_theio();
        g_info.Dsram          = STARTOFHIER->get_Dsram();
        g_info.rDee           = STARTOFHIER->get_rDee();
        g_info.DAT_O          = STARTOFHIER->get_DAT_O();
        g_info.Di             = STARTOFHIER->get_Di();
        g_info.aluop          = STARTOFHIER->get_ALUOP();
        g_info.corerunning    = STARTOFHIER->get_corerunning();
        common_simprintf( &g_info, cy );
}

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
        FILE *lfo = stdout;
        FILE *imagetosim = NULL;
        char *imagetosimname = NULL;
	Vm_ice40sim_SRAM *tb = new Vm_ice40sim_SRAM;

        int cyclelimit = 300;
        int simhintstate;
        int silent = 0;
        
        parse_arguments( &g_verbose, &cyclelimit, &silent, &lfo, &imagetosim, &imagetosimname, argc,argv);
        PR( "Simulation of image %s\n", imagetosimname );
	// Initialize Verilators variables
        Verilated::commandArgs(argc, argv);
//        readout_ebr( "Virgin\n", 1, tb );

        tb->eval(); // This does do the 'initial' of verilog
//        readout_ebr( "After tb->eval()\n", 1, tb );
        
        initialize_ebr_sram( tb, imagetosim, imagetosimname );
//        readout_ebr_sram( "After custom init with program to simulate. EBR\n", "SRAM\n", 1, tb );
//        exit(0);
//        //readout_ucode( tb );

        int cy;
        for ( cy = 0; cy < cyclelimit; cy++ ) {

                tb->CLK_I = 0;
                tb->eval();
                
                simhintstate = check_for_simulationhint(lfo, imagetosimname, tb, silent);

                if ( simhintstate == ST_HINT_SIMEXIT ||
                     simhintstate == ST_HINT_SIMERROR ) {
                        break;
                } else if ( simhintstate != ST_HINT_SILENCE ) {
                        if ( ! silent )
                                simprintf(cy,tb);
                }

                tb->CLK_I = 1;
                tb->eval();
        }
        if ( cy >= cyclelimit ) {
                printf( "Not finished after %d cycles\n", cyclelimit );
                fprintf( lfo, "%-40s Not finished after %d cycles\n", imagetosimname, cyclelimit );
        } else if ( simhintstate == ST_HINT_SIMEXIT ) {
                if ( silent < 2 ) {
                        if ( g_accesserror ) {
                                fprintf( lfo, "%-40s EBR read/write access error\n", imagetosimname );
                        } else {
                                fprintf( lfo, "%-40s success %5d instructions in %6d cycles, cpi = %5.2lf",                                         
                                         imagetosimname, g_nrinstr, cy, (cy-64)/1.0/g_nrinstr );
                                fprintf( lfo, " At 24 MHz, runtime = %-20.3lf s\n", cy/24000000.0 );
                        }
                }
        }
        exit(EXIT_SUCCESS);
}
