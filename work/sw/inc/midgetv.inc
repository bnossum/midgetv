        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        
        // =============================================================================
        // First a custom-0 instruction "ij"
        //
        // 31     20 19 15 14 12 11 7 6     0
        // ofs[11:0]   rs1   000   nr 0001011
        //
        // This is an indirect jump. Ideally the syntax should have been
        // "ij r0,ofs(rs1)" but I do not know how to make such a macro. Hence we have
        // "ij rdnr,ofs,rs1nr" instead. The main motivation for the instruction is to
        // be able to return to a 32-bit address stored in memory, and this is what
        // it does now:
        //     pc = mem[ofs+rs1];
        // This make CSR emulation code and MRET emulation code much more agile.
        ///The instruction also has side effects:
        //   - it clears internal state "inCSR". This state bit is set when a
        //     CSR instruction is decoded, it prevents interrupts.
        //   - If may lead to a trap, this is done if lsb is set. This solves
        //     the case of unimplemented CSR accesses that should trap.
        // 
        // As written, the instruction should really could do
        //     tmp = pc;
        //     pc = mem[ofs+rs1];
        //     rd = tmp;
        //
        // this is presently not implemented
        //
        //See "ucode.h" for details.
        // 
        .macro ij rdnr=0,ofs=0,rs1nr=0
        .word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
        .endm
        
        // =============================================================================
#ifndef SP_INITVAL
#if onlyEBR
#define SP_INITVAL 0x400
#else        
#define SP_INITVAL 0
#endif
#endif        
        // =============================================================================        
        //
        // midgetv relies on magical constants in the start of EBR.
        // Overwriting these constants will crash midget. Writing to address 0 is
        // the same as writing to register x0, and so will break the programs, as
        // the assemblers rightfully relies on x0 == 0. Writing directly to __pc will 
        // fail for a subtle reason, in the microcode one will then try to write and 
        // read a location in EBR in the same clock cycle. This is undefined.
        // In all, there are 7 words that should never be changed, amd one location
        // that should never be written.
        // 
        // There are a number of locations that can be written, but usually are not,
        // for example one can directly change a register xn by writing a word to
        // mem[4*n], software implemented multiple psh/pop anyone?
        //
        // =============================================================================
        .section .magicconstants, "a"
        .option norelax //      Never
        .org 0x0 //             write
STARTOFEBR: //                  these   // Wordaaddress   Wai   
        .word 0   //                x   // 0x00 00000000  0x00 Register x0      
        .word 0   //                    // 0x04 00000100  0x01 Register x1
        .word SP_INITVAL  //            // 0x04 00000100  0x01 Register x2 == sp
                  //                    // :::
                  //                    // 0x7c 01111100  0x1e Register x31
        .org 0x80 //                    //
__jj:           .word 0  //             // 0x80 10000000  0x20 ucode register
__rinst:        .word 0  //             // 0x84 10000100  0x21 32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x88 10001000  0x22 Program counter
__mcycle:       .word 0          //     // 0x8c 10001100  0x23 32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x90 10010000  0x24 Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x94 10010100  0x25 For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x98 10011000  0x26 Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x9c 10011100  0x27 Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0xa0 10100000  0x28 For sign extension in "lh"
__mtvec:        .word _start     //     // 0xa4 10100100  0x29 Should point to exception handler.
cte00000000:    .word 0x00000000 // x   // 0xa8 10101000  0x2a ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0xac 10101100  0x2b ucode constant.
__yy:           .word 0                 // 0xb0 10110000  0x2c ucode register.
__mepc:         .word 0                 // 0xb4 10110100  0x2d For exception handling
__mcause:       .word 0                 // 0xb8 10111000  0x2e For exception handling
__mtval:        .word 0                 // 0xbc 10111100  0x2f For exception handling
__mscratch:     .word 0                 // 0xc0 Used by CSR code
//__misa:       .word 0x40800100        // 0xc4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32.
__misa:         .word 0x40800105        // 0xc4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32. RVC implemented
_ex_dup_x0:     .word 0 		// 0xc8 | Used by CSR emulation. These
_ex_rCSRadr:    .word 1 		// 0xcc | locations must be consequtive
_ex_rCSRty:     .word 2 		// 0xd0 | 
_ex_rrs1:       .word 3 		// 0xd4 | 
_ex_rrd:        .word 4 		// 0xd8 | 
_ex_rtmp:       .word 5 		// 0xdc | 
_mtime:         .word 0 		// 0xe0 Read/write from user code. Updated by internal interrupt
_mtimeh:        .word 0 		// 0xe4 Read/write from user code. Updated by internal interrupt
__freefornow_e8:.word 0                 // 0xe8 By convention used to store bitrate
__minstreth:    .word 0 		// 0xec Read/write from user code. Updated by internal interrupt
__mcycleh:      .word 0 		// 0xf0 Read/write from user code. Updated by internal interrupt
__freefornow_f4:.word 0                 // 0xf4 By convention used by compliance test code
__mtimecmp:     .word 0xffffffff	// 0xf8 Read/write from user code. 
__mtimecmph:    .word 0xffffffff	// 0xfc Read/write from user code. 
        .org 0x100  			//
CSRretadr:      .word 0			//0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb4,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen


#define changeme_mtime 0xe0
#define changeme_mtimeh 0xe4        
        
//        .section .EBRram, "a"
        // =============================================================================
        // Midgetv can be used without any SRAM.
        // For these very constrained implementations it should be considered to
        // remove system support for CSR instructions, and simplify or eliminate
        // interrupts.
        //
        // Memory map:
        // ===========
        // Coarse regions:                         ADR_O[31:27]
        // 0x3fffffff-0x00000000 EBR               00xxx
        // 0x5fffffff-0x40000000 reserved          010xx
        // 0x67ffffff-0x60000000 IO                01100
        // 0x7fffffff-0x68000000 System registers  011yy   with yy != 2'b00
        // 0xffffffff-0x80000000 SRAM              1xxxx
        //
        // Memory map of the start of EBR
        // ==============================
        //
        // 0x07f-0x000 Registers/code/data. Writing anything other than 0 (with
        //             SW/SH/SB) to location 0x0 is a grave error. 
        // 0x0b3-0x080 Dedicated registers and magical constants. It is a grave
        //             fault to change magical constants. Usable locations are 
        //             probably restricted to: 
        //             __rinst      Can be written directly. Incremented each 
        //                          instruction by code executing from SRAM.
        //             __mcycle     Can be written directly. Updated each instruction.
        //             __rNMI_IIV   Vector to the internal interrupt service
        //                          routine that is called when an interrupt
        //                          occurs. Please ensure the low 2 bits are
        //                          clear.
        //             __mtvec      Vector to interrupt/trap handling. Please ensure
        //                          the low 2 bits are clear. (DIRECT mode traps).
        // 0x0bf-0x0b4 Written by microcode when exceptions/interrupts occurs.
        //             __mepc       Used by exceptions/interrupts
        //             __mcause     Used by exceptions/interrupts
        //             __mtval      Used by exceptions/interrupts
        // 0x0df-0x0c0 This range is used by the minimal CSR implementation and also
        //             the internal interrupt routine.
        // 0x0ff-0x0e0 This range is used by the internal interrupt routine.
        // 0x103-0x100 Microcode writes the PC of the CSR instruction here
        // 0x107-0x104 URET/SRET/MRET emulation code entry point. Branched to by
        //             microcode when URET/SRET/MRET is seen
        // 0x10b-0x108 CSR emulation code entry point. Branched to by microcode
        // 
        // Hence, for a midgetv program with no CSR instructions, and with no
        // interrupts, it is conceivable to start the real program at address 0xb4.
        // I suspect most programs will include a minimal CSR, and a minimal 
        // interrupt routine. Preliminary testing indicate the real program will
        // start at around 0x300. And this leads to the obvious choice to let two
        // EBR rams hold system code (csr emulation, mret emulation, and internal
        // interrupt), and leave the SRAM for user code. But other configurations
        // exists.
        // 
        // 
        // A few utility macros used during simulation.
        // --------------------------------------------
        // I use the hint "sltu x0,rs1,rs2" as follows:
        // sltu x0, x((simarg)>>5) & 31, x((simarg) & 31).
        //
        // In compliance check program I-RF_x0-01.S the instruction 'sltu x0,x1,x2' 
        // appear. In program I-SLTU-01.S, the instruction "sltu x0,x16,x31" appear.
        //
        // 3322222222221111111111
        // 10987654321098765432109876543210
        // --------------------------------
        // 00000000001000001011000000110011   sltu x0,x1,x2
        // 00000001000011111011000000110011   sltu x0,x31,x16
        //        yyyyyxxxxx
        //        rs2  rs1
        //
        // is excluded from my interpretation of hints. This corresponds to 0x0020b033,
        // and 0x010fb033 so simarg = 0x041 and 0x21f are illegal.
        //
        // 0x2ff-0x000  simerr     End simulation with an error code
        // 0x31f-0x300  simputc()  Report macro
        // 0x3fe-0x320  free
        // 0x3ff        simdump    Dump EBR and SRAM
        //
        // #define simputc(reg) putchar(mem[reg*4] & 0xff)
        // 
        // =============================================================================
        .macro simerr simarg=0
        .word (((\simarg) & 0x3ff)<<15)+0x3033
        .endm

        .macro simend
        simerr 
        .endm

        .macro simdump
        simerr 0x3ff
        .endm

        .macro simputc simarg=1
        simerr \simarg+0x300
        .endm

        // =============================================================================
        // Interrupt/counter support. Most of the locations defined here require a
        // minimal internal ISR to work well.

        // The following locations are used to trigger side-effects when used as write address.
#define __write_mtime       0x200020e0 // Clears mtimeincip
#define __write_minstreth   0x200040ec // Clears minstrethincip
#define __write_mtimecmp    0x200800f8 // Clears mtip
#define __write_mtimecmph   0x200800fc // Also clears mtip

#define __write_bit_mtip    0x20008080 // Sets mtip. Should only be used in internalISR

//        // The following is mapped to EBR instead of IO
//        // I see no need to change it
#define __write_mstatus     0x20010080  
#define __write_mie         0x20020080 
#define __write_mip         0x20040080
        

        
        // Reading these registers just as normal IO read.
        // The only difference is that the muxing is implemented in m_inputmux
        // instead of being externally visible
                                         // 31        18 17           16          15 12 11   10 8 7    6 4 3    2 0          
#define __read_mip          0x68000000   // 000000000000 mrinstretip  mtimeincip  0000  meip 000  mtip 000 msip 000  MIP     
#define __read_mie          0x70000000   // 000000000000 mrinstrettie mtimeincie  0000  meie 000  mtie 000 msie 000  MIE     
#define __read_mstatus      0x78000000   // 000000000000 0            0           0001  1    000  mpie 000 mie  000  MSTATUS 

        // minstreth lives in software, in EBR ram.
#define __read_minstreth    0x000000ec

        // =============================================================================
        // During simulation some registers are at defined addresses
        // 
#define NOSUCHREG_ADR  0x60000000
#define LEDREG         0x60000004
#define UARTREG        0x60000008
#define DYNWISHREG     0x60000010

#define IOREGION       0x60000000
#define WISHREGOFS           0x04
#define DYNWISHREGOFS        0x10
        
