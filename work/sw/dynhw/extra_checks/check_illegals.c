/*
 * Here we iterate over all instructions. The program do a decode,
 * and those bitpatterns that are illegal are executed. Each time
 * such a bitpattern is executed, an "illegal instruction" trap should
 * occur. 
 *
 * This program is for rv32im
 */
#define MULDIV 1

#include <stdint.h>

#define LED (volatile uint32_t volatile *)0x60000004
//#define P(x) puts(x); putchar( ' ' );
#define P(x)

void testbed16( void );
void testbed32( void );

int getchar( void );
int putchar(int c);
int puts( const char *s);
int puthex32(uint32_t v);
int check_what_options( void );

uint32_t opcode = 0;

/////////////////////////////////////////////////////////////////////////////
int isprint( int c ) {
        return ( (c >= 0x20) && (c < 0x7F) );
}

/////////////////////////////////////////////////////////////////////////////
void dump( uint32_t *p, uint32_t len ) {
        p = (uint32_t *)((uint32_t) p & ~3u);
        uint32_t *e = p + len/4;
        uint8_t *q;
        
        do {
                puts( "\r\n" );
                puthex32( (uint32_t)p );
                puts( " | " );

                q = (uint8_t *)p;
                do {
                        puthex32( *p );
                        putchar( ' ' );
                        p++;
                } while ( ((uint32_t)p & 0x1c) != 0 );

                while ( q != (uint8_t *)p ) {
                        int c = *q++;
                        if ( isprint(c) ) {
                                putchar( c );
                        } else {
                                putchar( '.' );
                        }
                }
                        

        } while ( p != e );
        puts( "\r\n" );
}

/////////////////////////////////////////////////////////////////////////////
/* What to expect:
 *         Program option for checking
 * Core    i    C    m    c      Note
 * rv32i   ok   fail ok   fail   [1]
 * rv32im  fail fail ok   fail   [2]
 * rv32ic
 * rv32imc
 *
 * Notes:
 * 1: Program option m succeeds on rv32i because multiplications are simply not flagged as illegal in prog
 * 2: Program option i fails on rv32im because a tested multiplication was not an illegal instruction.
 *
 */
int main( void ) {
        uint32_t nrgood = 0;
        extern uint32_t nrillegaltraps; // Maintained in trap routine
        extern uint32_t Coretype;       // Found by startup code
        int muldiv;
        int rvc;

        opcode = 0; // Tmp. I do not clear bss in crt0 yet 
        *LED = 4;
        getchar();

        puts( "Chk opt\n" );
        rvc = Coretype;
        puthex32(rvc);
        
        muldiv = rvc & 1;
        rvc >>= 1;

        puts( "Check that illegals trap correctly. Running test for core rv32i" );
        if ( muldiv )
                putchar('m');
        if ( rvc )
                putchar('c');
        puts( ". Warning - runtime > 8h\n" );

        uint32_t nrillegal = 0;
        int inRVC = 1;
        nrillegaltraps = 0;
        do {
                switch ( opcode & 3) {
                case 0b00 :
                case 0b01 :
                case 0b10 :
                        goto RVC;
                case 0b11 :
                        goto NotRVC;
                }
                
                
        RVC:
                if ( rvc == 0 ) 
                        goto Illegal16;

                while (1)
                        ;
                
//                //puthex32( opcode ); putchar(' ');
//                
//                switch ( ((opcode&3)<<3) | (opcode>>13) ) {
//                case 0b00000 : 
//                        if ( opcode == 0 ) {
//                                P("C.Illegal " );
//                                goto Illegal16;
//                        }
//                        P("C.ADDI4SPN " );
//                        goto Legal16;
//                case 0b00001 : P("C.FLD " ); goto Illegal16; 
//                case 0b00010 : goto Legal16;   // C.LW
//                case 0b00011 : goto Illegal16; // C.FLW
//                case 0b00100 : goto Legal16;   // reserved
//                case 0b00101 : goto Illegal16; // C.FSD
//                case 0b00110 : goto Legal16;   // C.SW
//                case 0b00111 : goto Illegal16; // C.FSW
//
//                case 0b01000 : goto Legal16;   // C.NOP, C.ADDI
//                case 0b01001 : goto Legal16;   // C.JAL
//                case 0b01010 : goto Legal16;   // C.LI
//                case 0b01011 : goto Legal16;   // C.ADDI16SP, C.LUI
//                case 0b01100 : 
//                        if ( ((opcode>>10) & 7) == 7 && ((opcode>>6)&1) == 0 ) {
//                                //puts( " U " );
//                                goto Illegal16;
//                        }
//                        //puts( " H " );
//                        goto Legal16; // Many instructions
//                case 0b01101 : goto Legal16;   // C.J
//                case 0b01110 : goto Legal16;   // C.BEQZ
//                case 0b01111 : goto Legal16;   // C.BNEZ
//
//                case 0b10000 : goto Legal16;   // C.SLLI
//                case 0b10001 : goto Illegal16; // C.FLDSP
//                case 0b10010 : goto Legal16;   // C.LWSP
//                case 0b10011 : goto Illegal16; // C.FLWSP
//                case 0b10100 : goto Legal16;   // C.JR, C.MV
//                case 0b10101 : goto Illegal16; // C.FSDSP
//                case 0b10110 : goto Legal16;   // C.SWSP
//                case 0b10111 : goto Illegal16; // C.FSWSP
//                }
//                
        Illegal16:
                nrillegal++;
                *LED = 1;
                
                /* Any illegal code should result in a trap
                 * Store the opcode to a location and try to execute it.
                 */
                *(uint16_t *)testbed16 = opcode;
                testbed16();
                
                /* The number of illegal instruction traps should be
                   exactly equal the number of counted illegal instructions
                */
                if ( nrillegal != nrillegaltraps ) {
                        puts( "Error in RVC " );
                        puthex32(nrillegal);
                        putchar( ' ' );
                        puthex32(nrillegaltraps);
                        puts( "\n" );   
                        goto Fatal;
                }
                goto NextRVC;
                
        Legal16:
                nrgood++;

        NotRVC:
                *LED = 2;

        NextRVC:
                //NrGood=0x0d8a8004 NrBad=0x3275c07d sum=0x40004081                  
                
                opcode++;
        } while ( opcode < 0x10000 );
        inRVC = 0;

        
        puts( "Check 32-bit instructions. Wait for 64x64 characters\n" );
        /* Now do the same for 32-bit instructions ending in 0b11
         */
        opcode = 0;
/*        opcode = 0x06000000; leads to 00000001Unexp Trap:06004033
 * What if we start at 0x06004033?
 */      
//        opcode = 0x06004033-4*4; // Same result
        // Try with image from iceCube. Glad to say we have the same result.
        // However, a simple test program runs corectly?
        
        
        opcode |= 3; // Easy to forget that low 2 msb must be set.
        do {
//                puthex32( opcode ); 
                switch ( opcode & 0b1111111 ) {
                case 0b0000011 :
                        switch ( (opcode>>12) & 0b111 ) {
                        case 0b000 : P("LB"); goto Legal;
                        case 0b001 : P("LH"); goto Legal;
                        case 0b010 : P("LW"); goto Legal;
                        case 0b011 : goto Illegal;
                        case 0b100 : P("LBU"); goto Legal;
                        case 0b101 : P("LHU"); goto Legal;
                        }
                        goto Illegal;
                default:
                        goto Legal;
                case 0b0000111 : goto Illegal;
                case 0b0001011 :
                        switch ( (opcode>>12) & 0b111 ) {
                        case 0b000: P("ij"); goto Legal; // Custom-0 instruction for midgetv
                        }
                        goto Illegal;
                case 0b0001111 :
                        switch ( (opcode>>12) & 0b111 ) {
                        case 0b000 : P("FENCE");  goto Legal;
                        case 0b001 : P("FENCE.I");  goto Legal;
                        }
                        goto Illegal;
                case 0b0010011 :
                        switch ( (opcode>>12) & 0b111 ) {
                        case 0b000 : P("ADDI"); goto Legal;
                        case 0b001 :
                                if ( opcode>>25 ) {
                                        goto Illegal;
                                }
                                P("SLLI");
                                goto Legal;
                        case 0b010 : P("SLTI");  goto Legal;
                        case 0b011 : P("SLTIU"); goto Legal;
                        case 0b100 : P("XORI");  goto Legal;
                        case 0b101 :
                                if ( (opcode>>25) && ((opcode>>25) != 0b0100000) )
                                        goto Illegal;
                                P("SRLI or SRAI");
                                goto Legal;
                        case 0b110 : P("ORI"); goto Legal;
                        case 0b111 : P("ANDI"); goto Legal;
                        }
                        goto Illegal;           
                case 0b0010111 : /* AUIPC */ goto Legal;                        
                case 0b0011011 : goto Illegal;
                case 0b0011111 : goto Illegal;
                case 0b0100011 :
                        switch ( (opcode>>12) & 0b111 ) {
                        case 0b000 : /* SB */
                        case 0b001 : /* SH */
                        case 0b010 : /* SW */ goto Legal;
                        }
                        goto Illegal;
                case 0b0100111 : goto Illegal;
                case 0b0101011 : goto Illegal;
                case 0b0101111 : goto Illegal;
                case 0b0110011 :
                        if ( muldiv ) {
                                if ( (opcode>>25) & 1 ) {
                                        if (opcode>>26 )
                                                goto Illegal;
                                        /* MUL MULH MULHSU MULHU DIV DIVU REM REMU */
                                        goto Legal; 
                                } 
                        }
                        switch ( (opcode>>12) & 0b111) {
                        case 0b000 :
                        case 0b101 :
                                if ( (opcode>>25) == 0b0100000 )
                                        goto Legal; /* SUB SRA */
                                // Fallthrough
                        }
                        if (opcode>>25 )
                                goto Illegal;
                        /* ADD SLL SLT SLTU XOR SRL OR AND */
                        goto Legal; 
                
                case 0b0110111 : P("LUI");  goto Legal;
                case 0b0111011 : goto Illegal;
                case 0b0111111 : goto Illegal;
                case 0b1000011 : goto Illegal;
                case 0b1000111 : goto Illegal;
                case 0b1001011 : goto Illegal;
                case 0b1001111 : goto Illegal;
                case 0b1010011 : goto Illegal;
                case 0b1010111 : goto Illegal;
                case 0b1011011 : goto Illegal;
                case 0b1011111 : goto Illegal;
                case 0b1100011 :
                        switch ( (opcode>>12) & 0b111) {
                        case 0b010 :
                        case 0b011 :
                                goto Illegal;                                
                        }
                        goto Legal; /* BEQ BNE BLT BGE BLTU BGEU */
                case 0b1100111 :
                        switch ( (opcode>>12) & 0b111) {
                        case 0b000 :
                                goto Legal; /* JALR */
                        }
                        goto Illegal;
                case 0b1101011 : goto Illegal;
                case 0b1101111 : /* JAL */ goto Legal;
                case 0b1110011 :
                        switch ( (opcode>>12) & 0b111) {
                        case 0b000 :
                                if ( opcode == 0b00000000000000000000000001110011 || /* ECALL  */
                                     opcode == 0b00000000000100000000000001110011 || /* EBREAK */
                                     opcode == 0b00010000010100000000000001110011 || /* WFI    */
                                     opcode == 0b00110000001000000000000001110011 )  /* MRET   */
                                        goto Legal;
                                goto Illegal;
                        case 0b001 : P("CSRRW"); goto Legal;
                        case 0b010 : P("CSRRS"); goto Legal;
                        case 0b011 : P("CSRRC"); goto Legal;
                        case 0b101 : P("CSRRWI"); goto Legal;
                        case 0b110 : P("CSRRSI"); goto Legal;
                        case 0b111 : P("CSRRCO"); goto Legal;
                        default :
                                goto Illegal;
                        }
                case 0b1110111 :
                        //puts( "past(" );
                        //puthex32(opcode);
                        //puts( ")");
                        goto Illegal; // Error detected on 0x10500077, but the error is probably at 0x1050073
                case 0b1111011 : goto Illegal;
                case 0b1111111 : goto Illegal;                        
                }
                
                
        Illegal:
                P("Err");
                //puts( ":Test " );
                nrillegal++;
                *LED = 1;
                /* Any illegal code should result in a trap
                 * Store the opcode to a location and try to execute it.
                 */
                *(uint32_t *)testbed32 = opcode;
                testbed32();
                goto L;
                
//        IgnoreIllegal:
                
        Legal:
                P("Ok");
                //puts( ":Skip " );
                nrgood++;
                *LED = 2;
        L:
                if ( (opcode & 0xfffff) == 3 ) {
                        if ( (opcode & 0x3ffffff) == 3 ) {
                                puts( "\n" );
                                putchar(((opcode>>26)&63) + 0x3F); // ...26
                                puts( " : " );
                        }
                        putchar(((opcode>>20)&63) + 0x3F); // ...20
                }
                /* The number of illegal instruction traps should always be
                   exactly equal the number of counted illegal instructions
                */
                if ( nrillegal != nrillegaltraps )
                        goto Fatal;
                opcode += 4;
        } while ( opcode != 3 );

        // 1 red
        // 2 green right
        // 4 green left  something is wrong in icebreaker.v
        // 8 green down
        puts( "Success? NrGood=0x" );
        puthex32(nrgood);
        puts( " NrBad=0x" );
        puthex32(nrillegal);
        puts( " sum=0x");
        puthex32(nrgood+nrillegal);
        puts( "\n" );
        while (1)
                *LED = 10;

Fatal:
        puts( "Fail detected" );
        if ( inRVC )
                puts( " in RVC" );
        puts(". Opcode now =" );
        puthex32( opcode );
        puts( ". Last opcode16/32 that should have been trapped = " );
        puthex32( *(uint16_t *)testbed16);
        putchar( ' ' );
        puthex32( *(uint32_t *)testbed32);
        
        while (1)
                *LED = -1;
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
