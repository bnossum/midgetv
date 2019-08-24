        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        // For midgetv in iceblink40-hx1k only.
        //
        //                          Loadable
        // Regions:                 |    Contents
        // -----------------        |    ---------------------- 
        // 0x00000023 - 0x00000004  yes  x1-x7
        // 0x0000008f - 0x00000024  no    x8-x31 and internal registers
        // 0x00000093 - 0x00000090  yes  __rNMI_IIV
        // 0x000000a3 - 0x00000094  no   Constants
        // 0x000000a7 - 0x000000a4  yes  __mtvec
        // 0x000000b3 - 0x000000a8  no   Internal registers and constants
        // (top adr)  - 0x000000b4  yes  Remaining memory.
        //
        // =============================================================================
        
#define LEDOFS     4
#define EPPOFSr0   8
#define EPPOFSr1  12

#define regA   x6   // Only used in very first instruction
#define regB   x7   // Only used in a first loop
#define retreg x8   // Link register
#define regIO  x9   // IO-region register        
#define regP   x10  // Result from getchar
#define regC   x11  // Loop control/Store index
#define regL   x12  // Load address
#define regY   x13  // Block limit

        .org 0  //                         adr  reg 
        .word   0                       // 0x00 x0  Never touch
        .word   0                       // 0x04 x1 
        .word   0x2000                  // 0x08 x2  In case SP is not loaded, 
        .word   0                       // 0x0c x3          use sensible startvalue
        .word   0                       // 0x10 x4
        .word   0                       // 0x14 x5
        .word   1                       // 0x18 x6  regA
        .word   4                       // 0x1c x7  regB
        .word   0                       // 0x20 x8  retreg 
        .word   0x60000000              // 0x24 x9  regIO
_start:                                       
        sw      regA,LEDOFS(regIO)      // 0x28 x10 regP LED = 1;
ThrowAutobaud:                          //  
        jal     retreg,getchar          // 0x2c x11 regC for ( int i = 0; i < 4; i++ ) {
        addi    regB,regB,-1            // 0x30 x12 regL        getchar();
        bne     regB,x0,ThrowAutobaud   // 0x34 x13 regY }
LoadBlockHead:                          //              
        li      regC,-8                 // 0x38 x14     while (1) {
LoadBlockLoop:  
        jal     retreg,getchar          // 0x3c x15  	        for ( i = 0; i < 8; i++ )     
        sb      regP,0x38(regC)         // 0x40 x16  	                *p++ = near_getchar();
        addi    regC,regC,1             // 0x44 x17  	
        bne     regC,x0,LoadBlockLoop   // 0x48 x18  	
        bne     regL,x0,DataLoadLoop    // 0x4c x19  	        if ( loadadr == 0 )
        jalr    x0,0(regY)              // 0x50 x20  	                go();
DataLoadLoop:                           //       	        do {
        jal     retreg,getchar          // 0x54 x21  	                a = getchar();
        sb      regP,0(regL)            // 0x58 x22  	                *loadadr++ = a;
        addi    regL,regL,1             // 0x5c x23  	                LED = a;
        bltu    regL,regY,DataLoadLoop  // 0x60 x24  	        } while ( loadadr < end )  
        j       LoadBlockHead           // 0x64 x25     }
                                              
getchar:
        lw      regP,EPPOFSr1(regIO)    // 0x68 x26     while ( (EPP->S & 2) == 0 )
        andi    regP,regP,2             // 0x6c x27             ;
        beq     regP,x0,getchar         // 0x70 x28     
        lw      regP,EPPOFSr0(regIO)    // 0x74 x29     r = EPP->D;
        sw      regP,LEDOFS(regIO)      // 0x78 x30     LED->D = r;
        jalr    x0,0(retreg)            // 0x7c x31     return r;

        .org    0x80                    
__jj:           .word 0  //             // 0x80 10000000  0x20 ucode register
__rinst:        .word 0  //             // 0x84 10000100  0x21 32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x88 10001000  0x22 Program counter
__mcycle:       .word 0          //     // 0x8c 10001100  0x23 32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x90 10010000  0x24 Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x94 10010100  0x25 For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x98 10011000  0x26 Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x9c 10011100  0x27 Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0xa0 10100000  0x28 For sign extension in "lh"
__mtvec:        .word 0          //     // 0xa4 10100100  0x29 Should point to excption handler.
cte00000000:    .word 0x00000000 // x   // 0xa8 10101000  0x2a ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0xac 10101100  0x2b ucode constant.
__yy:           .word 0                 // 0xb0 10110000  0x2c ucode register.
        .org    0xb4

        // -----------------------------------------------------------------------------














                        


