/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Toplevel defines are in a C header file.
 * This utility writes a Verilog header file equivalent.
 */
#include <stdio.h>
#include <string.h>
#define MAXLINE 1024
int main( void ) {
        char linebuffer[MAXLINE];
        char *p;
        printf( "// This file is generated with the simple utility \"midgetv_perpare_defines\"\n" );
        while ( fgets( linebuffer, MAXLINE, stdin ) ) {
                if ( (p = strchr( linebuffer, '#')) != 0 )
                        *p = '`';
                fputs( linebuffer, stdout );
        }
        return 0;
}
