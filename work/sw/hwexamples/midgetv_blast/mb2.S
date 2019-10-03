        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        // For midgetv in iceblink40-hx1k only. 
        //
        //                          
        // Loadable regions:
        // -----------------        
        // 0x00000023 - 0x00000004      x1-x7
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000b4      Most parts of memory.
        //
        //
        // =============================================================================
        
#define IOREGION 0x60000000
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

        .globl _start
        .org 0  //                         adr  reg Name/Usage                    At go()
        .word   0                       // 0x00 x0  Never touch                   0x00000000
        .word   0                       // 0x04 x1                                0 or as loaded
        .word   0                       // 0x08 x2                                0 or as loaded
        .word   0                       // 0x0c x3                                0 or as loaded
        .word   0                       // 0x10 x4                                0 or as loaded
        .word   0                       // 0x14 x5                                0 or as loaded
        .word   1                       // 0x18 x6  regA                          1 or as loaded
        .word   4                       // 0x1c x7  regB                          0 or as loaded
        .word   0                       // 0x20 x8  retreg                        0x00000040
        .word   IOREGION                // 0x24 x9  regIO                         0x60000000
_start: sw      regA,LEDOFS(regIO)      // 0x28 x10 regP LED = 1;                 (uint8_t ep)
ThrowAB:jal     retreg,getchar          // 0x2c x11 regC for (int i=0; i<4; i++){ 0x00000000
        addi    regB,regB,-1            // 0x30 x12 regL        getchar();        0x00000000
        bne     regB,x0,ThrowAB         // 0x34 x13 regY }                        ep = Entry point
LoadBH: li      regC,-8                 // 0x38 x14     while (1) {
LdBlkL: jal     retreg,getchar          // 0x3c x15  	        for ( i = 0; i < 8; i++ )     
        sb      regP,0x38(regC)         // 0x40 x16  	                *p++ = near_getchar();
        addi    regC,regC,1             // 0x44 x17  	
        bne     regC,x0,LdBlkL          // 0x48 x18  	
        bne     regL,x0,DLoop           // 0x4c x19  	        if ( loadadr == 0 )
        jalr    x0,0(regY)              // 0x50 x20  	                go();
DLoop:  jal     retreg,getchar          // 0x54 x21  	        do {        
        sb      regP,0(regL)            // 0x58 x22  	                a = getchar();
        addi    regL,regL,1             // 0x5c x23  	                *loadadr++ = a; LED = a;
        bltu    regL,regY,DLoop         // 0x60 x24  	        } while ( loadadr < end )  
        j       LoadBH                  // 0x64 x25     }                                              
getchar:lw      regP,EPPOFSr1(regIO)    // 0x68 x26     
        andi    regP,regP,2             // 0x6c x27     while ( (EPP->S & 2) == 0 )
        beq     regP,x0,getchar         // 0x70 x28             ;
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

        // ======================================================= //
        //                                                         //
        //  Anything from here can be overwritten during loading.  //
        //                                                         //
        // ======================================================= //
        .org    0xb4
        
__mepc:         .word 0                 // 0x0b4 For exception handling
__mcause:       .word 0                 // 0x0b8 For exception handling
__mtval:        .word 0                 // 0x0bc For exception handling
__mscratch:     .word 0                 // 0x0c0 Used by CSR code
__misa:         .word 0x40800100        // 0x0c4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32

        //
        //  In case the user did not remember/bother to make an exception
        //  handler, and the loaded program leaves these locations untouched:
        //
ExceptH:
1:
        addi    x3,x3,1                 // 0x0c8
        li      x1,IOREGION             // 0x0cc
        sw      x3,LEDOFS(x1)           // 0x0d0 
2:      addi    x1,x1,0x7FF             // 0x0d4 
        bgt     x1,x0,2b                // 0x0d8
        j       1b                      // 0x0dc                                     

        //
        // Defensive coding.
        // In case the use did not remember/bother to write CSR emulation code,
        // and the loader program leaves these locations untouched, I arrange
        // for a default exception handle to kick in.
        //
        .macro ij rdnr=0,ofs=0,rs1nr=0
        .word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
        .endm

_mtime:         .word 0 		// 0x0e0 Read/write from user code. Updated by internal interrupt
_mtimeh:        .word 0 		// 0x0e4 Read/write from user code. Updated by internal interrupt
__bitrate:      .word 0                 // 0x0e8 For use by loaded program.
__minstreth:    .word 0 		// 0x0ec Read/write from user code. Updated by internal interrupt
__mcycleh:      .word 0 		// 0x0f0 Read/write from user code. Updated by internal interrupt
__freefornow_f4:.word 0                 // 0x0f4
__mtimecmp:     .word 0xffffffff        // 0x0f8 Read/write from user code. 
__mtimecmph:    .word 0xffffffff	// 0x0fc Read/write from user code. 
        .org 0x100  			//
CSRretadr:      .word 0			// 0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        // 0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:       j       ExceptH         // 0x108 Microcode branches to here when a CSR instruction is seen
                
