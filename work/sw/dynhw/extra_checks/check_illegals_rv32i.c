/*
 * Here we iterate over all instructions. The program do a decode,
 * and those bitpatterns that are illegal are executed. Each time
 * such a bitpattern is executed, an "illegal instruction" trap should
 * occur. 
 */

#include <stdint.h>

#define LED (volatile uint32_t volatile *)0x60000004
//#define LED (uint8_t *)0x60000004

void testbed16( void );
void testbed32( void );

int getchar( void );
int putchar(int c);
int puts( const char *s);
int puthex32(uint32_t v);

uint32_t opcode = 0;

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        uint32_t nrgood = 0;
        uint32_t nrillegal = 0;
        extern uint32_t nrillegaltraps;
        
        *LED = 0;
        getchar();
        puts( "Running. Wait for 64 characters (8h?)\n" );
        /* Coarse classification */
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
                nrillegal++;
                *LED = 1;

                /* Any illegal code should result in a trap
                 * Store the opcode to a location and try to execute it.
                 */
                *(uint16_t *)testbed16 = opcode;
                testbed16();
                goto CL;

        NotRVC:
                *LED = 2;
        CL:
                opcode++;
        } while ( opcode < 0x10000 );

        /* The number of illegal instruction traps should be
           exactly equal the number of counted illegal instructions
        */
        if ( nrillegal != nrillegaltraps )
                goto Fatal;

        /* Now do the same for 32-bit instructions ending in 0b11
         */
//#define P(x) puts(x); putchar( ' ' );
#define P(x)
        
        opcode = 3;
//        opcode = 0x10500077-4;
//        opcode = 0x40003027;

        do {
                //puthex32( opcode ); putchar(' ');
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
                        //P("[");
                        //puthex32(opcode);
                        //P("]");
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
                        switch ( (opcode>>12) & 0b111) {
                        case 0b000 :
                        case 0b101 :
                                if ( (opcode>>25) == 0b0100000 )
                                        goto Legal; /* SUB SRA */
                                // Fallthrough
                        }
                        if (opcode>>25 )
                                goto Illegal;
                        goto Legal; /* ADD SLL SLT SLTU XOR SRL OR AND */                        
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
                                     opcode == 0b00010000010100000000000001110011 )  /* WFI    */
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
                nrillegal++;
                *LED = 1;
                /* Any illegal code should result in a trap
                 * Store the opcode to a location and try to execute it.
                 */
                *(uint32_t *)testbed32 = opcode;
                testbed32();
                goto L;
                
        IgnoreIllegal:

        Legal:
                P("Ok");
                nrgood++;
                *LED = 2;
        L:
                opcode += 4;
                /* The number of illegal instruction traps should always be
                   exactly equal the number of counted illegal instructions
                */
                if ( nrillegal != nrillegaltraps )
                        goto Fatal;
                if ( (opcode & 0x3ffffff) == 0x3ffffff )
                        putchar(((opcode>>26)&63) + 0x40);
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
        puts( "Fail detected. Opcode=" );
        puthex32( opcode );
        while (1)
                *LED = -1;
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
