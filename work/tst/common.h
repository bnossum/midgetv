/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 */
#ifndef _common_h
#define _common_h

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__ )+fprintf(stderr,__VA_ARGS__))
#define PR(...) if (g_verbose ) fprintf(stderr,__VA_ARGS__)

#define INFO_skip_first64    0x00000001
#define INFO_cy              0x00000002
#define INFO_minx_ucode      0x00000004
#define INFO_I               0x00000008
#define INFO_I_fields        0x00000010
#define INFO_pc              0x00000020
#define INFO_rai             0x00000040
#define INFO_ADR_O           0x00000080
#define INFO_stb_ack         0x00000100
#define INFO_get_inexplcable 0x00000200
#define INFO_interruptinfo   0x00000400
#define INFO_sel             0x00000800
#define INFO_B               0x00001000
#define INFO_wai             0x00002000
#define INFO_DAT_O           0x00004000
#define INFO_rDee            0x00008000
#define INFO_theio           0x00010000
#define INFO_Dsram           0x00020000
#define INFO_Di              0x00040000
#define INFO_ALUOP           0x00080000
#define INFO_dbg_stb_ack     0x00100000
#define INFO_ucodedbg        0x00200000
#define INFO_dissassembly    0x00400000
#define INFO_shiftcount      0x00800000
#define INFO_M               0x01000000
#define INFO_RALUF           0x02000000
#define INFO_pc1             0x04000000
#define INFO_was_rvc_instr   0x08000000
#define INFO_luh             0x10000000

#define DEFAULT_UCODETEXTLEN 55

typedef struct {
        uint32_t CONF;
        int ucodetextlen;
        uint8_t minx;   
        uint8_t dinx;
        int ucodepcinfo;
        int a;
        int progress_ucode;
        uint32_t pc;        
        uint32_t I;         
        uint32_t ucode;     
        int usedinx;        
        int rai;            
        uint32_t ADR_O;       
        int stb_ack; 
        int inexplicable; 
        int interruptinfo;
        int sel_O;
        uint32_t B;
        int enaQ;
        int nclearQ;
        int wai;
        int iwe;
        uint32_t theio;
        uint32_t Dsram;
        uint32_t rDee;
        uint32_t DAT_O;
        uint32_t Di;
        int aluop;
        int dbg_stb_ack;
        int corerunning;
        int shiftcount;
        uint32_t M;
        int raluF; // 1 bit
        int pc1; // 1 bit
        int was_rvc_instr; // 1 bit
        int luh; // 1 bit
} INFOCHUNK;


void parse_arguments(int *verbosep, int *cyclelimitp, int *silentp, FILE **lfop, FILE **imagetosimp,
                     char **imagetosimnamep, int argc, char **argv);
void userguide( void );
int pocketdissass( int silent, uint32_t pc, uint32_t I );
int printfdecodeinstr( uint32_t I );

int  p_cy( int lnr, int cy );
int p_minx_ucode( int lnr, uint8_t minx, uint32_t ucode );
int p_I( int lnr, uint32_t I );
int p_I_fields( int lnr, uint32_t I );
int p_pc( int lnr, uint32_t pc );
int p_rai( int lnr, int rai );
int p_ADR_O( int lnr, uint32_t ADR_O );
int p_read_handshake( int lnr, int read_handshake );
int p_inexplicable( int lnr, int inexplicable );
int p_interruptinfo( int lnr, int interruptinfo );
void common_simprintf( INFOCHUNK *p, uint32_t cy );

/////////////////////////////////////////////////////////////////////////////
#ifdef _main
#define PUBLIC
#else
#define PUBLIC extern
#endif

PUBLIC int g_verbose;
PUBLIC int g_nrinstr;
PUBLIC int g_ignorehint;

PUBLIC int g_accesserror;
#endif

