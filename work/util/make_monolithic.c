#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *sourcefile[] = {
        "../code/m_midgetv_core.v"          ,
        "../code/m_inputmux.v"              ,
        "../code/m_mimux.v"                 ,
        "../code/m_alu_carryin.v"           ,
        "../code/m_alu.v"                   ,
        "../code/m_immexp_zfind_q.v"        ,
        "../code/m_ram.v"                   ,
        "../code/m_ram_a16.v"               ,
        "../code/m_ram_a17.v"               ,
        "../code/m_ebr.v"                   ,
        "../code/m_ebr_w16.v"               ,
        "../code/m_ebr_w8.v"                ,
        "../code/m_ebr_w4.v"                ,
        "../code/m_ebr_w2.v"                ,
        "../code/m_rai.v"                   ,
        "../code/m_wai.v"                   ,
        "../code/m_opreg.v"                 ,
        "../code/m_cyclecnt.v"              ,
        "../code/m_condcode.v"              ,
        "../code/m_shiftcounter.v"          ,
        "../code/m_status_and_interrupts.v" ,
        "../code/m_ucode.v"                 ,
        "../code/m_ucodepc.v"               ,
        "../code/m_progressctrl.v"          ,
        "../code/m_shlr.v"                  ,
        "../code/m_RVC.v"                   ,
        "../code/m_illegalop.v"             ,
        "../code/m_3ebr.v"                  ,
        "../generated/m_2ebr.v"             ,
        "../code/m_ice_shortcuts.v"         ,
        NULL
};

#define ferr(...) exit( fprintf( stderr, "%s:%d: ", __FILE__, __LINE__ ) + fprintf(stderr, __VA_ARGS__))
#define MAXLINE 2048

// =============================================================================
void process_file( int filenr, int islastfile, char *src ) {
        FILE *fi;
        char *p,*q;
        char linebuffer[MAXLINE];
        int stripheader = 0;
        
        if ( (fi=fopen(src,"r")) == NULL )
                ferr( "Something is wrong\n" );
        if ( filenr != 0 ) 
                stripheader = 1;               

        while ( fgets(linebuffer,MAXLINE,fi) ) {

//                // Strip copyright header from all but the first file
//                if ( stripheader ) {
//                        if ( strstr(linebuffer,"--ehdr") == NULL )
//                                continue;
//                        stripheader = 0;
//                        printf( "/*\n" );
//                        continue;
//                }
                if ( (p=strstr(linebuffer, "`include")) != NULL ) {
                        // Very feeble file inclusion
                        if ( p != linebuffer )
                                ferr( "This feeble utility can't handle this: %s", linebuffer );
                        p = strchr( linebuffer, '"' );
                        if ( p == NULL )
                                ferr( "Que?\n" );
                        p++;
                        q = strchr( p+1,'"' );
                        if ( q == NULL )
                                ferr( "Que?\n" );
                        *q = '\0';
                        process_file( filenr, islastfile, p );
#define strnCMP(a,b) strncmp(a,b,strlen(b))                        
                } else if ( !islastfile && strnCMP(linebuffer,"// Local Variables:") == 0 ) {
                        // Dependencies should be removed
                        break;
                } else {                        
                        printf( "%s", linebuffer );
                }
        }
        fclose(fi);
}

// =============================================================================
int main( void ) {
        int i;
        int lastfile;
        
        for ( i = 0;  sourcefile[i]; i++ ) {
                lastfile = sourcefile[i+1] == NULL ? 1 : 0;
                process_file(i,lastfile,sourcefile[i]);
        }
}
