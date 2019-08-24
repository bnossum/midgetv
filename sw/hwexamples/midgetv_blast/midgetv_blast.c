/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================

    To load and/or start executing of a program in midgetv without
    FPGA recompile. This assumes a midgetv that has a bitbang UART.
    For boards with FDTI chips for loading.
*/
#include <stdint.h>
#include "midgetv.h"
/*
 * The program is preceeded by an identificator word: 
 * 0x01071f3f    this is used to set the bitrate of the bitbang UART.
 *
 * Then follows zero or more of these packets:
 * load          Where to write a block. 
 * len != 0      Size of data in bytes
 * [data]        len bytes of payload then follows.
 *
 * Then follows the last block:
 * exec          Where to start execution. (Usually word aligned)
 * len == 0      Flags last packet

 *
 * Most used scenario, a file compiled for SRAM, starting execution at
 * 0xffff0000:
 *
 * 0x01071f3f
 * 0xffff0000
 * len
 * [data]
 * 0xffff0000
 * 0x00000000
 *
 * It is conceivable to make a linker script so that such a file can
 * be written directly.
 *
 * A scenario where there is a system library to load to EBR and a
 * program to load to SRAM:
 *
 * 0x01071f3f
 * 0x00000300    System library start
 * len           System library length
 * [data]        [System library binary code]
 * 0xfffe0000    Program load address
 * len           Program length
 * [data]        [Program binary code]
 * 0xfffe0000    Start address
 * 0x00000000    Go
 *
 * There is no error checking during transfer- the assumption is that
 * this program is used during primary development where one quickly
 * will see if the program was loaded ok or not.
 * 
 * Note in particular that data is stored using byte addresses, and
 * any data block may be any number of bytes. However, when a program
 * is started, the start address must be word-aligned (but perhaps you
 * actually want an unalignment trap at startup).
 */

uint32_t autobaud( void ); 
int near_getchar( void );

#define DBGLED(x) do { LED->D = (x); } while (0)

/////////////////////////////////////////////////////////////////////////////
static __inline uint32_t get32(void) {
        uint32_t r = 0;
        for ( int i = 0; i < 32; i += 8 ) 
                r += (near_getchar() << i );
        return r;
}

#if 0
/////////////////////////////////////////////////////////////////////////////
int __attribute__((naked)) main( void ) {

        UART->D = 1; /* Our TX line should be high */
        DBGLED(1);
        
        /* Autobaud */
#define FUDGE (-4)
        uint32_t ab = 0;
        for ( int i = 0; i < 4; i++ )
                ab += autobaud();
        SYSEBR->bitrate = (ab+16)/32 + FUDGE;
        DBGLED(2);

        while (1) {
                DBGLED(4);
                uint8_t *load = (uint8_t *)get32();
                uint32_t len = get32();
                if ( len == 0 ) 
                        ((void (*)()) load)();
                while ( len-- > 0 ) {
                        uint8_t a = near_getchar();        
                        DBGLED(a);
                        *load++ = a;
                }
        }
}
// 2d0
#endif

#if 0
typedef union {
        uint8_t b[8];
        struct {
                uint8_t *end;
                union {
                        uint8_t *load;
                        void (*go)(void);
                } b;
        } a;
} PARAM;

int __attribute__((naked)) main( void ) {
        PARAM *p = (PARAM *)0xb4;
        UART->D = 1; /* Our TX line should be high */
        DBGLED(1);
        
        /* Autobaud */
#define FUDGE (-4)
        uint32_t ab = 0;
        for ( int i = 0; i < 4; i++ )
                ab += autobaud();
        SYSEBR->bitrate = (ab+16)/32 + FUDGE;

        while (1) {
                int i;
                for ( i = 0; i < 8; i++ ) 
                        p->b[i] = near_getchar();
                if ( p->a.end == 0 )
                        p->a.b.go();
                while ( p->a.end > p->a.b.load ) {
                        uint32_t a = near_getchar();        
                        DBGLED(a);
                        *(p->a.b.load) = a;
                        p->a.b.load += 1;
                }
        }
}
// 2c0
#endif


int __attribute__((naked)) main( void ) {
        UART->D = 1; /* Our TX line should be high */
        DBGLED(1);
        
        /* Autobaud */
#define FUDGE (-4)
        uint32_t ab = 0;
        for ( int i = 0; i < 4; i++ )
                ab += autobaud();
        SYSEBR->bitrate = (ab+16)/32 + FUDGE;

        uint8_t *p = (uint8_t *)0xb4;
        while (1) {
                int i;
                for ( i = 0; i < 8; i++ ) 
                        *p++ = near_getchar();
                uint8_t *end = *(uint8_t **)0xb4;
                uint8_t *at  = (uint8_t *)*(uint32_t *)0xb8;

//                uint32_t end,at;
//                for ( i = 0; i < 8; i++ ) {
//                        at = ( at << 8) | (end >> 24);
//                        end = ( end << 8 ) | near_getchar();
//                }
                if ( end == 0 )
                        ((void (*)(void))at)();
                do {
                        uint32_t a = near_getchar();        
                        DBGLED(a);
                        *(uint8_t *)at++ = a;
                } while ( at < end );

        }
}
