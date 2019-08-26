        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================

        // =============================================================================
        // For programs that are loaded dynamically.
        
        // =============================================================================
        // First a custom-0 instruction "ij"
        // This is an indirect jump. Ideally the syntax should have been
        // "ij rd,ofs(rs1)" but I do not know how to make such a macro. Hence we have
        // "ij rdnr,ofs,rs1nr" instead. The motivation for the instruction is to
        // be able to return to a 32-bit address stored in memory, "pc = mem[ofs+rs1]",
        // this make CSR emulation code and MRET emulation code much more agile. 
        // See "ucode.h" for details.
        // 
        .macro ij rdnr=0,ofs=0,rs1nr=0
        .word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
        .endm
        
STARTOFEBR: //          address   Wai                                                                           these   // Worda
#define __jj             0x80 //  10000000  0x20 ucode register                                           .word 0  //             
#define __rinst          0x84 //  10000100  0x21 32-lsb of instret counter                                .word 0  //             
#define __pc             0x88 //  10001000  0x22 Program counter                                          .word _start-4   // x   
#define __mcycle         0x8c //  10001100  0x23 32-lsb of cycle counter                                  .word 0          //     
#define __rNMI_IIV       0x90 //  10010000  0x24 Must point to handlers for NMI/Internal interrupts       .word 0          //     
//efine cteffffff7f      0x94 //  10010100  0x25 For sign extension in "lb"                               .word 0xffffff7f // x   
//efine cte000000ff      0x98 //  10011000  0x26 Mask in "lb", "lbu", also for entrypoint CSR             .word 0x000000ff // x   
//efine cte0000ffff      0x9c //  10011100  0x27 Mask in "lh" and "lhu"                                   .word 0x0000ffff // x   
//efine cteffff7fff      0xa0 //  10100000  0x28 For sign extension in "lh"                               .word 0xffff7fff // x   
#define __mtvec          0xa4 //  10100100  0x29 Should point to excption handler.                        .word _start     //     
//efine cte00000000      0xa8 //  10101000  0x2a ucode constant.                                          .word 0x00000000 // x   
//efine cteffffffff      0xac //  10101100  0x2b ucode constant.                                          .word 0xffffffff // x   
#define __yy             0xb0 //  10110000  0x2c ucode register.                                          .word 0                 
#define __mepc           0xb4 //  10110100  0x2d For exception handling                                   .word 0                 
#define __mcause         0xb8 //  10111000  0x2e For exception handling                                   .word 0                 
#define __mtval          0xbc //  10111100  0x2f For exception handling                                   .word 0                 
#define __mscratch       0xc0 //  Used by CSR code                                                        .word 0                 
#define __misa           0xc4 //  Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32.      .word 0x40800100        
#define _ex_dup_x0       0xc8 //  | Used by CSR emulation. These                                          .word 0 		
#define _ex_rCSRadr      0xcc //  | locations must be consequtive                                         .word 1 		
#define _ex_rCSRty       0xd0 //  |                                                                       .word 2 		
#define _ex_rrs1         0xd4 //  |                                                                       .word 3 		
#define _ex_rrd          0xd8 //  |                                                                       .word 4 		
#define _ex_rtmp         0xdc //  |                                                                       .word 5 		
#define _mtime           0xe0 //  Read/write from user code. Updated by internal interrupt                .word 0 		
#define _mtimeh          0xe4 //  Read/write from user code. Updated by internal interrupt                .word 0 		
#define __freefornow_e8  0xe8 //                                                                          .word 0                 
#define __minstreth      0xec //  Read/write from user code. Updated by internal interrupt                .word 0 		
#define __mcycleh        0xf0 //  Read/write from user code. Updated by internal interrupt                .word 0 		
#define __freefornow_f4  0xf4 //                                                                          .word 0                 
#define __mtimecmp       0xf8 //  Read/write from user code.                                              .word 0 		
#define __mtimecmph      0xfc //  Read/write from user code.                                              .word 0 		
//efine CSRretadr       0x100 //  Microcode writes PC to CSRretadr when a CSR instruction is seen.        .word 0			
//efine Entry_xRET      0x104 //  Microcode branches to here when MRET/SRET/URET is seen                  ij      0,0xb6,0        
//efine EntryCSR        0x108 //  Microcode branches to here when a CSR instruction is seen                                       


#define changeme_mtime 0xe0
#define changeme_mtimeh 0xe4        


        .section .EBRram, "a"
        .option norelax
        .org 0x0
        
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
        // interrupt), and leave the SRAM for user code.
        // 
        // The following sizes of RAM exists for midgetv in ice40. Tested versions
        // are those with 8k and 65k RAM.
        // 
        //     \   No     64k    128k   
        //      \  Sram   SRAM   SRAM   
        // NrEBR +-------------------- 
        // 2     | 1k     65k    129k
        // 4     | 2k     66k    130k
        // 8     | 4k     68k    132k
        // 16    | 8k     72k    136k
        // 
        // 
        // A few utility macros used during simulation:
        // --------------------------------------------
        // I use the hint "sltu x0,rs1,rs2" as follows:
        // sltu x0, x((simarg)>>5) & 31, x((simarg) & 31).
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
#define __write_minstreth   0x200040fc // Clears minstrethincip
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
#define __read_minstreth    0x000000fc

        // =============================================================================
        // During simulation a whishbone register is at a defined address.
//efine SLOWREGADR     0x60000004
//efine NOSUCHREG_ADR  0x60000008
#define NOSUCHREG_ADR  0x60000000
#define LEDREG         0x60000004
#define UARTREG        0x60000008
