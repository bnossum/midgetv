
/* Acknowledgement
 * ---------------
 * This program would not be possible without the research done by David Carne (see
 * https://github.com/davidcarne/iceBurn), and the reinterpretation by Felix Klein and 
 * Peter Faymonville, (see https://github.com/reactive-systems/icedude).
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <libusb.h>
#include <unistd.h>
#include <string.h>

#define VID 0x1443 // Digilent
#define PID 0x0007 // Digilent Development board JTAG

#define cmd_COMM 0x04

#define subcom_OPEN   0x00
#define subcom_CLOSE  0x01
#define subcom_WRITE  0x04  
#define subcom_READ   0x05
#define subcom_TCNT   0x85
#define subcom_MODE   0x05
#define subcom_SPEED  0x03
#define subcom_ASSCS  0x06
#define subcom_START  0x07
#define subcom_END    0x87
#define subcom_DIR    0x04
#define subcom_VALUE  0x06

/* EP1 out
   EP2 in
   EP3 out
   EP4 in
*/
#define ep_cmdw  0x01
#define ep_cmdr  0x81        //?
#define ep_dataw 0x03
#define ep_datar 0x84        //
/*
0x81 : reads 9 actual
0x82 : reads 0
0x83 : reads 9 actual
0x84 : hangs
 */

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__ ) + fprintf(stderr,__VA_ARGS__))
#define dbgm(...) NULL

/////////////////////////////////////////////////////////////////////////////
libusb_device_handle *bnusb_gethandle( uint16_t vid, uint16_t pid ) {
        libusb_device_handle *dh;
        
        if ( libusb_init( NULL ) != 0 ) 
                return dbgm( "Can't initiate libusb\n" );
        
        libusb_set_debug( NULL, LIBUSB_LOG_LEVEL_WARNING);
        /* Above is in modern code superceeded by:
         * libusb_set_option( NULL, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_WARNING );
         */
        
        if ( (dh = libusb_open_device_with_vid_pid( NULL, vid, pid )) == NULL )
                return dbgm( "Can't open iceblink40-hx1k, is it connected?\n ");
        
        if ( libusb_kernel_driver_active(dh, 0) == 1 &&
             libusb_detach_kernel_driver(dh, 0) != 0 )
                return dbgm( "Can't detach kernel driver\n" );
        if ( libusb_claim_interface(dh,0) != 0 )
                return dbgm( "Can't claim interface\n" );
        
        return dh;
}

/////////////////////////////////////////////////////////////////////////////
static void bnusb_open( libusb_device_handle *dh ) {
        int actual;
        uint8_t p1[] = { 0x03, cmd_COMM, subcom_OPEN, 0x00};
        if ( libusb_bulk_transfer(dh, ep_cmdw, p1, *p1+1, &actual, 0) != 0 || actual != *p1+1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     
}

/////////////////////////////////////////////////////////////////////////////
static void bnusb_writereg( libusb_device_handle *dh, uint8_t adr, uint8_t data ) {
        int actual;
#define TOBEREPLACED 0
        uint8_t p2[] = { 0x08, cmd_COMM, subcom_WRITE, 0x00, TOBEREPLACED, 0x01, 0x00, 0x00, 0x00 };
        p2[4] = adr;
        if ( libusb_bulk_transfer(dh, ep_cmdw, p2, *p2+1, &actual, 0) != 0 || actual != *p2+1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     
        if ( libusb_bulk_transfer(dh, ep_dataw, &data, 1, &actual, 0) != 0 || actual != 1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     

        uint8_t p4[] = { 0x03, cmd_COMM, subcom_TCNT, 0x00 };
        if ( libusb_bulk_transfer(dh, ep_cmdw, p4, *p4+1, &actual, 0) != 0 || actual != *p4+1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     
}

/////////////////////////////////////////////////////////////////////////////
int bnusb_readreg( libusb_device_handle *dh, uint8_t adr ) {
        int actual;
        uint8_t data;
        uint8_t p2[] = { 0x08, cmd_COMM, subcom_READ, 0x00, TOBEREPLACED, 0x01, 0x00, 0x00, 0x00 };
        p2[4] = adr;
        
        if ( libusb_bulk_transfer(dh, ep_cmdw, p2, *p2+1, &actual, 0) != 0 || actual != *p2+1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     
        if ( libusb_bulk_transfer(dh, ep_datar, &data, 1, &actual, 0) != 0 || actual != 1 )                                                    
                ferr( "Hmm:%d\n", actual );
        uint8_t p4[] = { 0x03, cmd_COMM, subcom_TCNT, 0x00 };
        if ( libusb_bulk_transfer(dh, ep_cmdw, p4, *p4+1, &actual, 0) != 0 || actual != *p4+1 )                                                    
                ferr( "Hmm:%d\n", actual );                                     
        return data;
}

/////////////////////////////////////////////////////////////////////////////
void bnusb_close( libusb_device_handle *dh ) {
        uint8_t p5[] = { 0x03, cmd_COMM, subcom_CLOSE, 0x00 };        
        int actual;
        
        if ( libusb_bulk_transfer(dh, ep_cmdw, p5, *p5+1, &actual, 0) != 0 || actual != *p5+1 )
                ferr( "Hmm:%d\n", actual );
}

/////////////////////////////////////////////////////////////////////////////
void bnusb_cleanup( libusb_device_handle *dh ) {
        bnusb_close(dh);        
        int r = libusb_release_interface(dh, 0); 
        if(r!=0) 
	        ferr("Cannot Release Interface\n");
        libusb_close(dh);
}


/////////////////////////////////////////////////////////////////////////////
void doesitworkatall( libusb_device_handle *dh ) {
        for ( int i = 0; i < 32; i++ ) {
                bnusb_writereg( dh, 0, i ); // Address is don't care in this application
                int r00 = bnusb_readreg( dh, 0x00 );
                int r01 = bnusb_readreg( dh, 0x01 );
                printf( "r00=%2.2x r01=%2.2x\n", r00, r01 );
                sleep(1);
        }
}

/////////////////////////////////////////////////////////////////////////////
/* Around 16 s no matter the frequency on iceblink40-hx1k.
 * Transfer speed 10*1000*8/16 = 5000 bps.
 */
void speedtest_pc2midget( libusb_device_handle *dh ) {
        for ( int i = 0; i < 10*1000; i++ ) {
                while ( bnusb_readreg( dh, 1 ) & 2 )
                        ;
                bnusb_writereg( dh, 0, i>>8 );
        }
}

/////////////////////////////////////////////////////////////////////////////
void pc2midget( libusb_device_handle *dh, FILE *fi ) {
        int c;

        while ( (c = fgetc(fi)) != EOF ) {
                while ( bnusb_readreg( dh, 1 ) & 2 )
                        ;
                bnusb_writereg( dh, 0, c );
        }
}

/////////////////////////////////////////////////////////////////////////////
void givehelp( char *progname ) {
        char *p = strrchr( progname, '/' );
        if ( p == NULL )
                p = progname;
        else
                p++;
        
        fprintf( stderr,
"Usage: %s [OPTION] [SOURCE]\n"
"or     %s SOURCE\n"                 
"%s is an utility to communicate with an iceblink40-hx1k\n\n"
"  -h  This help\n"
"  -p filename    Write file to midgetv, assuming a midget \"blast\" file format\n"
"  -r regnr       Read register regnr\n"
"  -w regnr:val   Write val to regnr \n"
"  -t             Basic test\n"
"  -s             Speed test\n",
                 p,p,p);
}

/////////////////////////////////////////////////////////////////////////////
int main( int argc, char *argv[] ) {
        libusb_device_handle *dh = bnusb_gethandle( VID, PID );
        FILE *fi = stdin;
        int opt;
        int operation = 'p';
        uint8_t adr,data;
        char *p;
        
        if ( dh == NULL )
                ferr( "Fell at first hurdle. Can't get handle for vid=%4.4x pid=%4.4x (iceblink40-hx1k not found?)\n", VID, PID);

        while ((opt = getopt(argc, argv, "tshr:w:p:")) != -1) {
                operation = opt;
                switch (opt) {
                case 'h' :
                        givehelp( *argv );
                        return 0;
                case 'p' :
                        if ( (fi = fopen(optarg,"r")) == NULL ) 
                                ferr( "Can't open %s for reading\n", optarg );
                        break;
                case 'r' :
                        adr = strtol(optarg,NULL,0);
                        break;
                case 'w' :
                        adr = strtol(optarg,&p,0);
                        if ( *p != ':' )
                                ferr( "Missing ':' delimiter\n" );
                        data = strtol(p+1,NULL,0);
                        break;
                case 's' : break;
                case 't' : break;
                default  : exit(1);
                }
        }

        
        bnusb_open(dh);

        switch ( operation ) {
        case 'r' :
                data = bnusb_readreg( dh, adr );
                printf( "%2.2x\n", data );
                break;
        case 'w' :
                bnusb_writereg( dh, adr, data );
                break;
        case 't' : doesitworkatall(dh); break;
        case 's' : speedtest_pc2midget( dh ); break;
        case 'p' :
                pc2midget( dh, fi );
                fclose( fi );
                break;
        default : ferr( "Internal error\n" );
        }
        
        bnusb_cleanup(dh);
        return 0;
}
