/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 */
#include <stdlib.h>
#include "Vm_tb_illegalop.h"
#include "verilated.h"

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__ )+fprintf(stderr,__VA_ARGS__))

/////////////////////////////////////////////////////////////////////////////
int facit( uint32_t opcode, int LAZY_DECODE, int MULDIV ) {

        switch ( opcode & 3) {
        case 0b00 :
        case 0b01 :
        case 0b10 :
                goto RVC;
        case 0b11 :
                goto NotRVC;
        }
RVC:
        return 1;
NotRVC:

//#define P(x) puts(x); putchar( ' ' );
#define P(x)
        
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
                // Remaining encodings in Custom-0 are weeded out because of illegal entrypoints in ucode.h
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
                        if ( LAZY_DECODE == 0 ) {
                                if ( opcode>>25 ) {
                                        goto Illegal;
                                }
                        }
                        P("SLLI");
                        goto Legal;
                case 0b010 : P("SLTI");  goto Legal;
                case 0b011 : P("SLTIU"); goto Legal;
                case 0b100 : P("XORI");  goto Legal;
                case 0b101 :
                        if ( LAZY_DECODE == 0 ) {
                                if ( (opcode>>25) && ((opcode>>25) != 0b0100000) )
                                        goto Illegal;
                                P("SRLI or SRAI");
                        }
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
                        if ( LAZY_DECODE == 0 ) {
                                if ( (opcode>>25) == 0b0100000 )
                                        goto Legal; /* SUB SRA */
                        }
                        // Fallthrough
                }
                if ( LAZY_DECODE == 0 ) {                       
                        if ( MULDIV ) {
                                if ( opcode >> 26 )
                                        goto Illegal;
                        } else {
                                if ( opcode >> 25 )
                                        goto Illegal;
                        }
                }
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
                        if ( LAZY_DECODE ) {
                                if ( (opcode>>20) == 0b000000000000 || /* ECALL  */
                                     (opcode>>20) == 0b000000000001 || /* EBREAK */
                                     (opcode>>20) == 0b000100000101 || /* WFI    */
                                     (opcode>>20) == 0b001100000010)   /* MRET   */                                
                                        goto Legal;
                        } else {
                                if ( opcode == 0b00000000000000000000000001110011 || /* ECALL  */
                                     opcode == 0b00000000000100000000000001110011 || /* EBREAK */
                                     opcode == 0b00010000010100000000000001110011 || /* WFI    */
                                     opcode == 0b00110000001000000000000001110011)   /* MRET   */                                
                                        goto Legal;
                        }
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
        return 1;
Legal:
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
int construct_index( uint32_t INSTR, int MULDIV ) {
//                if ( MULDIV ) begin
//                        assign dinx[0] = (INSTR[6:4] == 3'b011 & INSTR[2] == 1'b0) ? INSTR[25] : INSTR[2];
//                end else begin
//                        assign dinx[0] = INSTR[2];
//                end
//                wire is_lui = INSTR[5:4] == 2'b11 & INSTR[2] == 1'b1;
//                assign dinx[1] = is_lui ? 1 : ((~INSTR[6]&INSTR[5])&INSTR[30]) | ((~(~INSTR[6]&INSTR[5]))&INSTR[3]);
//                assign dinx[2] = INSTR[4];
//                assign dinx[3] = INSTR[5];
//                assign dinx[4] = INSTR[6];
//                assign dinx[5] = INSTR[12]; 
//                assign dinx[6]   = INSTR[13] & (INSTR[4:2] != 3'b101);
//                assign dinx[7]   = INSTR[14] & (INSTR[4:2] != 3'b101) & (INSTR[5:2] != 4'b1011);
        
        int inx = 0;
        int is_lui = (((INSTR>>4)&3) == 3) & ((INSTR>>2)&1);
        if ( MULDIV == 0 ) {
                inx |= ((INSTR>>2) & 1);
        } else {
                if ( ((INSTR>>4)&7)==3 && ((INSTR>>2)&1) == 0) {
                        inx |= ((INSTR>>25) & 1);
                } else {
                        inx |= ((INSTR>>2) & 1);
                }
        }
        int t = is_lui ? 1 : ( ( ((((INSTR>>6)&1)^1) & ((INSTR>>5)&1)) & ((INSTR>>30)&1) ) |
                               ( (((((INSTR>>6)&1)^1) & ((INSTR>>5)&1))^1) & ((INSTR>>3)&1) ) );
        inx |= (t<<1);
        inx |= ( ((INSTR>> 4)&1) << 2);
        inx |= ( ((INSTR>> 5)&1) << 3);
        inx |= ( ((INSTR>> 6)&1) << 4);
        inx |= ( ((INSTR>>12)&1) << 5);
        if ( ((INSTR>>13)&1) && (((INSTR>>2)&7) != 5) )
                inx |= (1<<6);
        if ( ((INSTR>>14)&1) && (((INSTR>>2)&7) != 5) && (((INSTR>>2)&15) != 0b1011)  )
                inx |= (1<<7);                
        return inx;
}

/////////////////////////////////////////////////////////////////////////////
const int ucodereachability[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) reachability,
#include "../code/ucode.h"
        };

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_tb_illegalop *tb = new Vm_tb_illegalop;
        
        uint32_t INSTR = 0;
        int seen_wrong_items[256] = {0, };
        
        fprintf( stderr, "Finished after\n" );
        for ( int i = 0; i < 64; i++ )
                fprintf( stderr, "%c", i+0x21 );
        fprintf( stderr, " seen\n" );
        tb->corerunning = 1;
        do {
                if ( (INSTR & 0x3ffffff) == 0x3ffffff )
                        fprintf( stderr, "%c", (INSTR>>26)+0x21 );
                tb->INSTR = INSTR;
                tb->eval();
                
                for ( int LAZY_DECODE = 0; LAZY_DECODE < 2; LAZY_DECODE++ ) {
                        for ( int MULDIV = 0; MULDIV < 2; MULDIV++ ) {
                                
                                int simresult = LAZY_DECODE ?
                                        (MULDIV ? tb->illegal_1_1 : tb->illegal_1_0) :
                                        (MULDIV ? tb->illegal_0_1 : tb->illegal_0_0);
                                int f = facit( INSTR, LAZY_DECODE, MULDIV );
                                
                                int inx = construct_index(INSTR,MULDIV);
                                uint32_t entrypoint_reachability = ucodereachability[inx];
                                
                                if ( entrypoint_reachability == 2 ) {
                                        simresult = 1; // I also use the microcode table to weed out illegal codes
                                } else if ( f == 0 ) {
                                        // Facit claims a legal opcode. Then the microcode should be reached
                                        // This is not really what we test here, but I add it for consistency
                                        if ( entrypoint_reachability != 1 ) {
                                                if ( seen_wrong_items[inx] == 0 ) {
                                                        fprintf( stderr, "Curious. Gets to wrong item 0x%x in microcode when instruction is 0x%x\n", inx, INSTR );
                                                }
                                                seen_wrong_items[inx]++;
                                        }
                                }
                                /* Cases for ECALL and EBREAK. For these instructions, the immediate field is checked
                                   by the microcode.
                                */
                                if ( (INSTR & ((7<<12) | 127) ) == 0x00000073 ) {
                                        // ECALL or EBREAK
                                        int imm = INSTR >> 20;
                                        switch ( imm ) {
                                        case 0x000 : // ECALL
                                                break;
                                        case 0x001 : // EBREAK
                                                break;
                                        case 0x105 : // WFI
                                                break;
                                        case 0x302 : // MRET
                                                break;
                                        default :
                                                simresult = 1; // Cheat, illegal is not found by module under test, but in microcode
                                        }
                                }
                                
                                if ( f != simresult ) {
                                        printf( "LAZY_DECODE=%d MULDIV=%d f=%d simresult=%d\n", LAZY_DECODE, MULDIV, f, simresult );
                                        ferr( "Error for %s instruction 0x%x\n", f ? "illegal" : "legal", INSTR );
                                }
                        }
                }
                INSTR++;
        } while ( INSTR != 0 );
        
        exit(EXIT_SUCCESS);
}
//Curious. Gets to wrong item 2e in microcode when instruction is 0x40001033
//Curious. Gets to wrong item 4e in microcode when instruction is 0x40002033
//Curious. Gets to wrong item 6e in microcode when instruction is 0x40003033
//Curious. Gets to wrong item 8e in microcode when instruction is 0x40004033
//Curious. Gets to wrong item ce in microcode when instruction is 0x40006033
//Curious. Gets to wrong item ee in microcode when instruction is 0x40007033

//Curious. Gets to wrong item 4f in microcode when instruction is 0x42002033
//Curious. Gets to wrong item 6f in microcode when instruction is 0x42003033
//Curious. Gets to wrong item 8f in microcode when instruction is 0x42004033
//Curious. Gets to wrong item af in microcode when instruction is 0x42005033
//Curious. Gets to wrong item cf in microcode when instruction is 0x42006033
//Curious. Gets to wrong item ef in microcode when instruction is 0x42007033
