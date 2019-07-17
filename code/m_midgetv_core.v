// Signal rename
// Reintroduce 2 ROM control.
//
// Lockout access to EBR if executing in SRAM.
// ------------------------------------------
// Change location of mtimecmp,mtimecmph,mtime,mtimeh to >= 0x80000000 when SRAM is implemented.
// When an instruction executes from SRAM, disallow any write or read unless ADR_O >= 0x40000000.
// This protects magical constants and registers from overwrite. The only way to enter code in
// EBR activated from the user code will be via software interrupts, EBREAK or ECALL. 
// if ( Wpc )
//   execinSRAM <= B[31];
// trigger_ucodebranch = (nxtSTB & execinSRAM & ~B[31] & ~B[30])
// Note: Wpc must be changed so no write to PC happens if this would trigger_ucodebranch,
// otherwise we can not give a precise exception (pc lost).
// Note: When a invalid location exception occurs, we set minx 0x07f (in m_ucodepc.v).

/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
 
   
   midgetv as a component
   ======================
   
                      +----------------+
               CLK_I ->                |- WE_O
               RST_I -|                |- STB_O
               start -|                |- CYC_O
                      |                |- SEL_O[3:0] 
                meip -|                |- ADR_O[31:0]
               ACK_I -|                |- DAT_O[31:0]
   DAT_I[IWIDTH-1:0] -|                |
                      +----------------+
 
       
   Simplified datapath                                                                            
   ======================
                                                               +------------- shcy[4] 
 Data input                                                    |                  
 DAT_I[31:0] --------------|\   ___  rDee                     /y\                 
      _______________      | |-|   |-+                        :::  __   ___       
     |SRAM ..x32     | +---|/  |   | |                   +----(((-|  | >   |  rshiftcnt[4:0]
     |===============| |       >___| |                   |   -((+-|  |-|   |-+    
     | DATAOUT[31:0] |-+             |                   |  +-+(--|  | |CE | |    
 +---|DATAIN[31:0]   |               |                   |  |  +--|__| |R__| |    
 | +-|ADR[14:0]      |               |                   |  |  |             |    
 | | | 64 or 128 KiB |               |                   |  |  0             |    
 | | >_______________|               |                   |  +----------------+    
 | |                                 |                   |                       
 | |  +------------------------------+        _______    |       
 | |  |                ___                   |Immed- |   |                        
 | |  |            +--|D Q|------------------|iate   |---(-+          +------ is_bcond 
 | |  |            |  |   |  6- 0 OPCODE     |expand |   | |          |           
 | |  |            |  |   | 11- 7 TRG        |_______|   | |      __  |  __ 
 | |  |            |  |   | 14-12 FUNC3   +--------------(-)-----|  |-+-|  |- raluF 
 | |  |            |  |   | 19-15 SRC1    |              | |  +--|__|   >__|      
 | |  |            |  |CE | 24-20 SRC2    | fC           | |  | fZ                
 | |  |            |  >___| 31-25 FUNC7  /y\             | | /y\                  
 | |  |rDee        |   ___________       :::  _______    | | :::  __     ___      
 | |  +------|\ Di | -| Di        | A   -(((-|~(A^QQ)| B | +-(((-|  | F >   |     I/O address
 | +-ADR_O/2-| |---+--| ~(Di^Q)   |------((+-|A^QQ^ci|-+-+---((+-|  |---|D Q|-+-- ADR_O[31:0] 
 +-(---------|/   +---| (~Di)&(~Q)|    +-+(--|       | |    -+(--|  |   |CE | |   
 | | DAT_O        |  -|_0_________|    |  +--|_______| |    --+--|__|   |R__| |   
 | |              |                    |  |ci          |      |       .       |   
 | +--------------+--------------|\ QQ |  |            |      0               |   
 | |    __      __               | |---+  |            |      Format expand   |   
 | | +-|+1|----| Q|-+- ccnt[5:0]-|/       0/1/raluF    |      and zero-find   |   
 | | | |__|    >__| |                                  |                      |   
 | | +--------------+                                  |                      |
 | |                                                   |                      |
 | +---------------------------------------------------(----------------------+
 |                                                     |                    
 +-----------------------------------------------------(-------------------+
                                                       |    ____________   |                
      jj        --|0000\                               |   |EBR ..x32   |  |                
      rinst     --|0001 |                              |   |============|  |      data output                 
      pc        --|0010 |                      B[31:0] |   | RDATA[31:0]|--+----- DAT_O[31:0]                 
      ttime     --|0011 | Rai                          +---|WDATA[31:0] |                      
      rInternISR--|0100 |----------------------------------|RADR[h-2:0] |                      
      rFFFFFF7F --|0101 |   ADR_O[h:2]-|00xx\  Wai         |            |                      
      r000000FF --|0110 |   TRG[4:0] --|01xx |-------------|WADR[h-2:0] |                      
      r0000FFFF --|0111 |   jj       --|1000 |             |            |
      rFFFF7FFF --|1000 |   rinst    --|1001 |             | 1, 2, 4    |                         
      mtvec     --|1001 |   pc       --|1010 |             > or 8 KiB   |                              
      r00000000 --|1010 |   ttime    --|1011 |             >____________|                              
      rFFFFFFFF --|1011 |   yy       --|1100 |                                         
      yy        --|1100 |   mecp     --|1101 |                                         
      B[h:2]   ---|1101 |   mcause   --|1110 |                                         
      SRC2[4:0] --|1110 |   mtval    --|1111/                                          
      SRC1[4:0] --|1111/                                                              
                                                                               
 * ----------------------------------------------------------------------------
 * m_midgetv_core signal description
 * =================================
 * 
 * Whishbone signals are implemented as per Whishbone specification b4.
 * 
 * A note on RST_I. 
 * RST_I is a mandatory input. It acts like a NMI.
 * 
 * Even though the granularity of the whishbone interface is 
 * 8-bit, all read operations happen as 32-bit operations. SEL_O == 4'b1111.
 * Selection of (signed/unsigned) byte and (signed/unsigned) hword is done
 * internally in midgetv. For write operations, the granularity is 8-bit, 
 * and the SEL_O[3:0] signals have meaning. I am unsure whether
 * the lack of a true byte/hword read affects the conformity to the
 * Whishbone specification.
 * 
 * Work. I need to check that I obey Whishbone B4 rule 3.55:
 * MASTER interfaces MUST be designed to operate normally when 
 * the SLAVE interface holds [ACK_I] in the asserted state.
 * 
 * input:start
 * ------------------  
 * From power-on reset, it may be adventageous to delay startup of
 * midgetv until clocks are stable, etc. The start input signal is
 * included for this purpose. If midgetv does not include any cycle 
 * counter, this signal determines if the core is running directly, 
 * once start is high it should stay high.
 * If a cycle counter is implemented, start must be high for 64
 * consequtive cycles before midgetv is started. In this later case
 * it is allowable to let start go low at a later time, it will not
 * affect midgetv.
 * midgetv does not have any hardware reset input
 * 
 * input:meip
 * ----------
 * This is the machine external interrupt pending signal. It should be
 * valid in the CLK_I clock domain.
 * 
 * output:dbga[31:0]
 * -----------------
 * A catchall hardware debugging aid. When not debugging dbga == 32'h0.
 * My intention is that by leaving this vector as is, different 
 * information may be emitted from the core without breaking programs 
 * that use the core allready.
 * 
 * output:midgetv_core_killwarnings
 * --------------------------------
 * This is a dummy output to remove warnings from different tools.
 * Do not connect.
 * 
 * Parameter description
 * =====================
 * 
 * SRAMADRWIDTH
 * ------------
 * Determines the amount of SRAM in midgetv. Legal values:
 * 0     0 KiB SRAM 
 * 16   64 KiB SRAM
 * 17  128 KiB SRAM
 * 
 * EBRADRWIDTH
 * -----------
 * Determines the size of EBR in midgetv. Legal values:
 *  8    1 kiB EBR 
 *  9    2 kiB EBR
 * 10    4 kiB EBR
 * 11    8 kiB EBR
 * 
 * IWIDTH
 * ------
 * Determines the width of external input to midgetv. To be
 * compliant with whishbone, IWIDTH should be 8, 16 or 32.
 * When interrupts are included, IWIDTH should probably
 * always be 32.
 * Legal values: From 1 to 32.
 * 
 * NO_CYCLECNT
 * -----------
 * Normally midgetv support a 32-bit cycle counter (the
 * low 32 bits of mcycle). To save a very few resources,
 * it can be suppressed, If suppressed, one still have a
 * 32 bit counter, that works as a retired instruction
 * counter. 
 * Legal values: 0 or 1.
 * 
 * MTIMETAP
 * -------
 * This is for mtime and control registers.
 * When MTIMETAP > 13, the cycle counter give an interrupt
 * after (1<<MTIMETAP) cycles. This interrupt is used to
 * maintain mtime. 
 * When MTIMETAP > 13, we also enable interrupt support
 * and registers mstatus,mie,mip as per the 
 * riscv specification.
 * Legal values: 0, 14-31
 * 
 * HIGHLEVEL
 * ---------
 * Most of the code for midgetv exists in "highlevel"
 * RTL code, but also in a version where iCE40 native
 * building blocks (SB_LUT4, SB_DFF, etc) are instantiated.
 * 
 * LAZY_DECODE
 * -----------
 * 0: All instructions are fully decoded, riscv compliance.
 * 1: Some minor code spaces are not checked. For example,
 *    "XOR" can be decoded by 
 *    ( funct3 = 3'b100, opcode = 7'b0110011). However, 
 *    one should really also check that funct7 = 7'b0000000.
 *    With LAZY_DECODE == 1, this check is not performed.
 * 
 * program0, program1, ... programF
 * --------------------------------
 * These holds the program to initiate in the EBRs.
 * See m_ebr.v for details.
 * 
 * Whishbone B.4 data sheet for m_midgetv_core
 * --------------------------------------------------------------------
 * Inteface type:                   MASTER
 * General description:             Microcontroller
 * Supported cycles:                MASTER, READ/WRITE
 * Data port, size:                 32-bit
 * Data port, granularity:          8-bit
 * Data port, maximum operand size: 32-bit
 * Data transfer ordering:          Big endian and/or little endian
 * Data transfer sequencing:        Undefined
 * Supported signal list            Signal name   WHISHBONE Equiv. 
 *   and cross-reference to         CLK_I         CLK_I        
 *   equivalent WHISHBONE signals:  DAT_I[31:0]   DAT_I()
 *                                  ADR_O[31:0]   ADR_O()
 *                                  STB_O         STB_O
 *                                  WE_O          WE_O 
 *                                  CYC_O         CYC_O        
 *                                  SEL_O[3:0]    SEL_O()
 *                                  DAT_O[31:0]   DAT_O()
 *                                  ACK_I         ACK_I        
 *                                  RST_I         RST_I
 */

module m_midgetv_core
  # ( parameter 
      SRAMADRWIDTH = 0,  EBRADRWIDTH =  8, IWIDTH =  8, NO_CYCLECNT = 1, MTIMETAP =  0, HIGHLEVEL = 0, LAZY_DECODE = 1, // Minimal
//    SRAMADRWIDTH = 16, EBRADRWIDTH =  8, IWIDTH = 32, NO_CYCLECNT = 0, MTIMETAP = 14, HIGHLEVEL = 0, LAZY_DECODE = 0, // Conventional
//    SRAMADRWIDTH = 17, EBRADRWIDTH = 11, IWIDTH = 32, NO_CYCLECNT = 0, MTIMETAP = 14, HIGHLEVEL = 0, LAZY_DECODE = 0, // Maximal
      ALUWIDTH = 32, // __always__ 32
      DBGA = 0,
      parameter [4095:0] program0 = 4096'h0,
      parameter [4095:0] program1 = 4096'h0,
      parameter [4095:0] program2 = 4096'h0,
      parameter [4095:0] program3 = 4096'h0,
      parameter [4095:0] program4 = 4096'h0,
      parameter [4095:0] program5 = 4096'h0,
      parameter [4095:0] program6 = 4096'h0,
      parameter [4095:0] program7 = 4096'h0,
      parameter [4095:0] program8 = 4096'h0,
      parameter [4095:0] program9 = 4096'h0,
      parameter [4095:0] programA = 4096'h0,
      parameter [4095:0] programB = 4096'h0,
      parameter [4095:0] programC = 4096'h0,
      parameter [4095:0] programD = 4096'h0,
      parameter [4095:0] programE = 4096'h0,
      parameter [4095:0] programF = 4096'h0
      )
   (
    // Whishbone signals:
    input              CLK_I, //       System clock, used on rising flank only
    input              RST_I, //       Whishbone reset equals NMI.
    input              ACK_I, //       Acknowledge from I/O device
    input [IWIDTH-1:0] DAT_I, //       Input devices data for midgetv
    output             CYC_O, //       We do not generate wait states. Observation 3.55 in wbspec_b4: CYC_O = STB_O
    output             STB_O, //       Qualifies ADR_O, DAT_O, SEL_O and WE_O.
    output             WE_O, //        Midgetv writes output to address ADR_O
    output [31:0]      ADR_O, //       Address for I/O devices
    output [31:0]      DAT_O, //       Data from midgetv to output devices
    output [3:0]       SEL_O, //       Byte mask for read/write. 

    // The following whishbone signals are not supported:
    //input            ERR_I,RTY_I,STALL_I
    //input [x:0]      TGD_I,
    //output           LOCK_O,
    //output [x:0]     TGA_O,TGC_O,TGD_O, 

    // Non-whishbone signals:
    input              meip, //        External interrupt(s) pending
    input              start, //       Control startup of midgetv
    output             corerunning, // midgetv should now be active. For synchronization of startup
    output [31:0]      dbga, //     For hardware debugging
    output             midgetv_core_killwarnings // To tie-off unused signals. Do not connect.
    );
   wire                clk; //   My signal name for the clock. It is only used on rising edge
   assign clk   = CLK_I;
   assign CYC_O = STB_O; //      See Whishbone B.4 permission 3.40
   
   
   /* verilator lint_off UNUSED */
   wire                 alu_killwarnings;       // From inst_alu of m_alu.v
   wire                 m_alu_carryin_killwarnings;// From inst_alu_carryin of m_alu_carryin.v
   wire                 m_condcode_killwarnings;// From inst_condcode of m_condcode.v
   wire                 m_cyclecnt_kill;        // From inst_cyclecnt of m_cyclecnt.v
   wire                 m_immexp_zfind_q_killwarnings;// From inst_immexp_zfind_q of m_immexp_zfind_q.v
   wire                 m_inputmux_killwarnings;// From inst_inputmux of m_inputmux.v
   wire                 m_progressctrl_killwarnings;// From inst_progressctrl of m_progressctrl.v
   wire                 m_rai_killwarning;      // From inst_rai of m_rai.v
   wire                 m_ram_killwarnings;     // From inst_ram of m_ram.v
   wire                 m_status_and_interrupts_killwarnings;// From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 m_wai_killwarning;      // From inst_wai of m_wai.v
   wire                 ucode_killwarnings;     // From inst_ucode of m_ucode.v
   wire                 ucodepc_killwarnings;   // From inst_ucodepc of m_ucodepc.v
   /* verilator lint_on UNUSED */
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [ALUWIDTH-1:0]  B;                      // From inst_alu of m_alu.v
   wire [31:0]          Di;                     // From inst_inputmux of m_inputmux.v
   wire [31:0]          Dsram;                  // From inst_ram of m_ram.v
   wire [2:0]           FUNC3;                  // From inst_opreg of m_opreg.v
   wire                 FUNC7_5;                // From inst_opreg of m_opreg.v
   wire [31:0]          INSTR;                  // From inst_opreg of m_opreg.v
   wire [31:0]          QQ;                     // From inst_cyclecnt of m_cyclecnt.v
   wire [EBRADRWIDTH-1:0] Rai;                  // From inst_rai of m_rai.v
   wire [4:0]           SRC1;                   // From inst_opreg of m_opreg.v
   wire [4:0]           SRC2;                   // From inst_opreg of m_opreg.v
   wire [4:0]           TRG;                    // From inst_opreg of m_opreg.v
   wire [EBRADRWIDTH-1:0] Wai;                  // From inst_wai of m_wai.v
   wire                 alu_carryin;            // From inst_alu_carryin of m_alu_carryin.v
   wire                 alu_carryout;           // From inst_alu of m_alu.v
   wire                 alu_minstretofl;        // From inst_alu of m_alu.v
   wire                 alu_tapout;             // From inst_alu of m_alu.v
   wire [3:0]           bmask;                  // From inst_progressctrl of m_progressctrl.v
   wire                 ctrlreg_we;             // From inst_progressctrl of m_progressctrl.v
   wire                 enaQ;                   // From inst_progressctrl of m_progressctrl.v
   wire                 is_brcond;              // From inst_condcode of m_condcode.v
   wire                 iwe;                    // From inst_progressctrl of m_progressctrl.v
   wire                 lastshift;              // From inst_shiftcounter of m_shiftcounter.v
   wire                 meie;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mie;                    // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire [7:0]           minx;                   // From inst_ucodepc of m_ucodepc.v
   wire                 mpie;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mrinstretie;            // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mrinstretip;            // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 msie;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 msip;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mtie;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mtimeincie;             // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mtimeincip;             // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 mtip;                   // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire                 next_STB_O;             // From inst_progressctrl of m_progressctrl.v
   wire                 next_readvalue_unknown; // From inst_ebr of m_ebr.v
   wire                 next_sram_stb;          // From inst_progressctrl of m_progressctrl.v
   wire                 nobuserror;             // From inst_cyclecnt of m_cyclecnt.v
   wire                 progress_ucode;         // From inst_progressctrl of m_progressctrl.v
   wire                 qualint;                // From inst_status_and_interrupts of m_status_and_interrupts.v
   wire [31:0]          rDee;                   // From inst_inputmux of m_inputmux.v
   wire                 r_issh0_not;            // From inst_shiftcounter of m_shiftcounter.v
   wire                 raluF;                  // From inst_condcode of m_condcode.v
   wire [7:0]           rinx;                   // From inst_ucode of m_ucode.v
   wire                 rzcy32;                 // From inst_immexp_zfind_q of m_immexp_zfind_q.v
   wire                 sa00;                   // From inst_ucode of m_ucode.v
   wire                 sa02;                   // From inst_ucode of m_ucode.v
   wire                 sa03;                   // From inst_ucode of m_ucode.v
   wire                 sa04;                   // From inst_ucode of m_ucode.v
   wire                 sa05;                   // From inst_ucode of m_ucode.v
   wire                 sa06;                   // From inst_ucode of m_ucode.v
   wire                 sa11;                   // From inst_ucode of m_ucode.v
   wire                 sa12;                   // From inst_ucode of m_ucode.v
   wire                 sa12_and_corerunning;   // From inst_alu_carryin of m_alu_carryin.v
   wire                 sa14;                   // From inst_ucode of m_ucode.v
   wire                 sa15;                   // From inst_ucode of m_ucode.v
   wire                 sa16;                   // From inst_ucode of m_ucode.v
   wire                 sa17;                   // From inst_ucode of m_ucode.v
   wire                 sa18;                   // From inst_ucode of m_ucode.v
   wire                 sa19;                   // From inst_ucode of m_ucode.v
   wire                 sa20;                   // From inst_ucode of m_ucode.v
   wire                 sa21;                   // From inst_ucode of m_ucode.v
   wire                 sa22;                   // From inst_ucode of m_ucode.v
   wire                 sa23;                   // From inst_ucode of m_ucode.v
   wire                 sa24;                   // From inst_ucode of m_ucode.v
   wire                 sa25;                   // From inst_ucode of m_ucode.v
   wire                 sa26;                   // From inst_ucode of m_ucode.v
   wire                 sa27;                   // From inst_ucode of m_ucode.v
   wire                 sa28;                   // From inst_ucode of m_ucode.v
   wire                 sa29;                   // From inst_ucode of m_ucode.v
   wire                 sa30;                   // From inst_ucode of m_ucode.v
   wire                 sa32;                   // From inst_ucode of m_ucode.v
   wire                 sa33;                   // From inst_ucode of m_ucode.v
   wire                 sa34;                   // From inst_ucode of m_ucode.v
   wire                 sa37;                   // From inst_ucode of m_ucode.v
   wire                 sa38;                   // From inst_ucode of m_ucode.v
   wire                 sa39;                   // From inst_ucode of m_ucode.v
   wire                 sa40;                   // From inst_ucode of m_ucode.v
   wire                 sa41;                   // From inst_ucode of m_ucode.v
   wire                 sa42;                   // From inst_ucode of m_ucode.v
   wire                 sa43;                   // From inst_ucode of m_ucode.v
   wire                 sra_msb;                // From inst_alu_carryin of m_alu_carryin.v
   wire                 sram_ack;               // From inst_ram of m_ram.v
   wire                 sram_stb;               // From inst_progressctrl of m_progressctrl.v
   wire                 sysregack;              // From inst_inputmux of m_inputmux.v
   wire [31:0]          theio;                  // From inst_inputmux of m_inputmux.v
   // End of automatics

`ifdef verilator   
   function [7:0] get_minx;
      // verilator public
      get_minx = minx;
   endfunction
   function [31:0] get_DAT_O;
      // verilator public
      get_DAT_O = DAT_O;
   endfunction
   /*
    * SB_RAM40_4K will return rubbish when the read address equals the write address,
    * and a write is performed. I treat this as an error. But if the data
    * is not to be used, we have no problem. There is at least one frequent occation
    * that must be weeded out: 
    * During opcode read from SRAM we do:
    * StdIncPC:  writePC readALU
    * Now, if the value of the PC  ends in 0x...88, the read and write address to
    * EBR are equal. However, the EBR read value is not used for anything. 
    * I weed out this case in the function below.
    * 
    * (And yes, it is a grave error to actually try to execute from address 0x80.
    *  example: 
    *  ADR        Contents
    *  00000080   nop
    *  
    *  The "addi r0,r0,0" is executed, the PC is incremented to 0x84, the
    *  read value is unknown, and an unknown instruction is executed.
    * 
    *  Similarly, jumping to 0x88 will give disaster.
    * )
    * 
    */
   wire                 sram_operand_fetch = sa32 & ~sa15;
   function [0:0] get_accesserror;
      // verilator public      
      get_accesserror = next_readvalue_unknown & ~sram_operand_fetch & ~next_STB_O & ~next_sram_stb;
   endfunction
   function [31:0] get_ADR_O;
      // verilator public
      get_ADR_O = ADR_O;
   endfunction
   function [31:0] get_B;
      // verilator public
      get_B = B;
   endfunction
   function [31:0] get_I;
      // verilator public
      get_I = INSTR;
   endfunction
   function [31:0] get_Di;
      // verilator public
      get_Di = Di;
   endfunction
   function [EBRADRWIDTH-1:0] get_Wai;
      // verilator public
      get_Wai = Wai;
   endfunction
   function [EBRADRWIDTH-1:0] get_Rai;
      // verilator public
      get_Rai = Rai;      
   endfunction
   function [3:0] get_progress_ucode_etc;
      // verilator public
      get_progress_ucode_etc = {progress_ucode,~r_issh0_not, sa33, lastshift };
   endfunction
   function [0:0] get_iwe;
      // verilator public
      get_iwe = iwe;
   endfunction
   function [0:0] get_enaQ;
      // verilator public
      get_enaQ = enaQ;
   endfunction
   function [0:0] get_clearQ;
      // verilator public
      get_clearQ = sa14;
   endfunction
   function [0:0] get_use_dinx;
     // verilator public
     get_use_dinx = sa28;
   endfunction
   function [4:0] get_stb_ack;
      // verilator public
      get_stb_ack = {STB_O,sysregack,ACK_I,sram_stb,sram_ack};
   endfunction
   function [3:0] get_SEL_O;
      // verilator public
      get_SEL_O = SEL_O;
   endfunction
   function [31:0] get_rDee;
      // verilator public
      get_rDee = rDee;
   endfunction
   function [31:0] get_theio;
      // verilator public
      get_theio = theio;
   endfunction
   function [31:0] get_Dsram;
      // verilator public
      get_Dsram = Dsram;
   endfunction
   function [2:0] get_ALUOP;
      // verilator public
      get_ALUOP = {sa06,sa05,sa04};
   endfunction
`endif

   /* Flexibility comes at a price. Some variables are not
    * in use in certain configurations. I can not find any
    * better way to disable warnings than the following:
    */
   assign midgetv_core_killwarnings = sa38 & sa39 | meip;
   
   /* -----------------------------------------------------------------------------
    * Datapath
    */
   m_inputmux #(.HIGHLEVEL(HIGHLEVEL), 
                .IWIDTH(IWIDTH), 
                .SRAMADRWIDTH(SRAMADRWIDTH), 
                .MTIMETAP(MTIMETAP))
   inst_inputmux
     (/*AUTOINST*/
      // Outputs
      .sysregack                        (sysregack),
      .rDee                             (rDee[31:0]),
      .theio                            (theio[31:0]),
      .Di                               (Di[31:0]),
      .m_inputmux_killwarnings          (m_inputmux_killwarnings),
      // Inputs
      .clk                              (clk),
      .DAT_O                            (DAT_O[31:0]),
      .DAT_I                            (DAT_I[IWIDTH-1:0]),
      .Dsram                            (Dsram[31:0]),
      .ADR_O                            (ADR_O[31:0]),
      .sra_msb                          (sra_msb),
      .sa00                             (sa00),
      .STB_O                            (STB_O),
      .ACK_I                            (ACK_I),
      .sram_ack                         (sram_ack),
      .mie                              (mie),
      .mpie                             (mpie),
      .meie                             (meie),
      .mrinstretie                      (mrinstretie),
      .msie                             (msie),
      .mtie                             (mtie),
      .mtimeincie                       (mtimeincie),
      .mrinstretip                      (mrinstretip),
      .msip                             (msip),
      .mtip                             (mtip),
      .mtimeincip                       (mtimeincip),
      .meip                             (meip));

   m_cyclecnt #(.HIGHLEVEL(1), 
                .NO_CYCLECNT(NO_CYCLECNT))
   inst_cyclecnt
     (/*AUTOINST*/
      // Outputs
      .QQ                               (QQ[31:0]),
      .corerunning                      (corerunning),
      .nobuserror                       (nobuserror),
      .m_cyclecnt_kill                  (m_cyclecnt_kill),
      // Inputs
      .clk                              (clk),
      .sa17                             (sa17),
      .sa16                             (sa16),
      .ADR_O                            (ADR_O[31:0]),
      .start                            (start));

   m_alu_carryin #(.HIGHLEVEL(HIGHLEVEL))
   inst_alu_carryin
     (/*AUTOINST*/
      // Outputs
      .alu_carryin                      (alu_carryin),
      .sra_msb                          (sra_msb),
      .sa12_and_corerunning             (sa12_and_corerunning),
      .m_alu_carryin_killwarnings       (m_alu_carryin_killwarnings),
      // Inputs
      .raluF                            (raluF),
      .sa03                             (sa03),
      .sa02                             (sa02),
      .FUNC7_5                          (FUNC7_5),
      .sa12                             (sa12),
      .corerunning                      (corerunning),
      .ADR_O                            (ADR_O[31:0]));

   m_alu #(.ALUWIDTH(ALUWIDTH),
           .HIGHLEVEL(HIGHLEVEL), 
           .MTIMETAP(MTIMETAP), 
           .SRAMADRWIDTH(SRAMADRWIDTH) )
   inst_alu
     (/*AUTOINST*/
      // Outputs
      .B                                (B[ALUWIDTH-1:0]),
      .alu_carryout                     (alu_carryout),
      .alu_tapout                       (alu_tapout),
      .alu_minstretofl                  (alu_minstretofl),
      .alu_killwarnings                 (alu_killwarnings),
      // Inputs
      .Di                               (Di[ALUWIDTH-1:0]),
      .ADR_O                            (ADR_O[ALUWIDTH-1:0]),
      .QQ                               (QQ[ALUWIDTH-1:0]),
      .alu_carryin                      (alu_carryin),
      .sa06                             (sa06),
      .sa05                             (sa05),
      .sa04                             (sa04),
      .sa27                             (sa27),
      .sa26                             (sa26),
      .sa25                             (sa25),
      .sa24                             (sa24));

   m_immexp_zfind_q #(.HIGHLEVEL(HIGHLEVEL) ) 
     inst_immexp_zfind_q
       (/*AUTOINST*/
        // Outputs
        .rzcy32                         (rzcy32),
        .ADR_O                          (ADR_O[31:0]),
        .m_immexp_zfind_q_killwarnings  (m_immexp_zfind_q_killwarnings),
        // Inputs
        .B                              (B[31:0]),
        .clk                            (clk),
        .sa11                           (sa11),
        .sa14                           (sa14),
        .enaQ                           (enaQ),
        .INSTR                          (INSTR[31:0]));
   
   m_ebr #(.EBRADRWIDTH(EBRADRWIDTH),
           .program0(program0),
           .program1(program1),
           .program2(program2),
           .program3(program3),
           .program4(program4),
           .program5(program5),
           .program6(program6),
           .program7(program7),
           .program8(program8),
           .program9(program9),
           .programA(programA),
           .programB(programB),
           .programC(programC),
           .programD(programD),
           .programE(programE),
           .programF(programF)
           )
   inst_ebr
     (/*AUTOINST*/
      // Outputs
      .next_readvalue_unknown           (next_readvalue_unknown),
      .DAT_O                            (DAT_O[31:0]),
      // Inputs
      .B                                (B[31:0]),
      .Rai                              (Rai[EBRADRWIDTH-1:0]),
      .Wai                              (Wai[EBRADRWIDTH-1:0]),
      .clk                              (clk),
      .bmask                            (bmask[3:0]),
      .iwe                              (iwe));

   /* Whishbone B.4 data sheet for the ram interface of m_midgetv_core
    * --------------------------------------------------------------------
    * Inteface type:                   MASTER
    * General description:             Microcontroller
    * Supported cycles:                MASTER, READ/WRITE
    * Data port, size:                 32-bit
    * Data port, granularity:          8-bit
    * Data port, maximum operand size: 32-bit
    * Data transfer ordering:          Big endian and/or little endian
    * Data transfer sequencing:        Undefined
    * Supported signal list            Signal name   WHISHBONE Equiv. 
    *   and cross-reference to         CLK_I         CLK_I        
    *   equivalent WHISHBONE signals:  Dsram[31:0]   DAT_I()
    *                                  ADR_O[31:0]   ADR_O()
    *                                  sram_stb      STB_O
    *                                  WE_O          WE_O 
    *                                  sram_stb      CYC_O    See Wb B.4 permission 3.40
    *                                  SEL_O[3:0]    SEL_O()
    *                                  DAT_O[31:0]   DAT_O()
    *                                  sram_ack      ACK_I        
    *                                  RST_I         RST_I
    * Comments                         Many signals are shared with the
    *                                  the microcontroller whishbone interface
    */
   m_ram  #(.SRAMADRWIDTH(SRAMADRWIDTH)) 
   inst_ram
     (// Outputs
      .DAT_O                              (Dsram[31:0]),
      .ACK_O                              (sram_ack),
      // Inputs
      .DAT_I                              (DAT_O[31:0]),
      .ADR_I                              (ADR_O[31:0]),
      .STB_I                              (sram_stb),
      .WE_I                               (WE_O),
      .SEL_I                              (SEL_O[3:0]),
      /*AUTOINST*/
      // Outputs
      .m_ram_killwarnings               (m_ram_killwarnings),
      // Inputs
      .CLK_I                            (CLK_I));
   
   /* -----------------------------------------------------------------------------
    * Control path / Data path interface
    */
   
   // Internal read and write addresses
   m_rai #(.HIGHLEVEL(HIGHLEVEL), 
           .EBRADRWIDTH(EBRADRWIDTH))
   inst_rai
     (/*AUTOINST*/
      // Outputs
      .Rai                              (Rai[EBRADRWIDTH-1:0]),
      .m_rai_killwarning                (m_rai_killwarning),
      // Inputs
      .B                                (B[EBRADRWIDTH+1:0]),
      .SRC1                             (SRC1[4:0]),
      .SRC2                             (SRC2[4:0]),
      .sa20                             (sa20),
      .sa21                             (sa21),
      .sa22                             (sa22),
      .sa23                             (sa23),
      .ACK_I                            (ACK_I),
      .sram_ack                         (sram_ack),
      .sysregack                        (sysregack),
      .sa34                             (sa34),
      .sa40                             (sa40),
      .STB_O                            (STB_O),
      .sram_stb                         (sram_stb));

   m_wai #(.HIGHLEVEL(HIGHLEVEL), 
           .EBRADRWIDTH(EBRADRWIDTH))
   inst_wai
     (/*AUTOINST*/
      // Outputs
      .Wai                              (Wai[EBRADRWIDTH-1:0]),
      .m_wai_killwarning                (m_wai_killwarning),
      // Inputs
      .ADR_O                            (ADR_O[EBRADRWIDTH+1:0]),
      .TRG                              (TRG[4:0]),
      .sa24                             (sa24),
      .sa25                             (sa25),
      .sa26                             (sa26),
      .sa27                             (sa27));

   m_opreg #(.HIGHLEVEL(HIGHLEVEL))
     inst_opreg
       (/*AUTOINST*/
        // Outputs
        .TRG                            (TRG[4:0]),
        .SRC1                           (SRC1[4:0]),
        .SRC2                           (SRC2[4:0]),
        .FUNC3                          (FUNC3[2:0]),
        .FUNC7_5                        (FUNC7_5),
        .INSTR                          (INSTR[31:0]),
        // Inputs
        .clk                            (clk),
        .sa12_and_corerunning           (sa12_and_corerunning),
        .Di                             (Di[31:0]));

   m_condcode #(.HIGHLEVEL(HIGHLEVEL)) 
     inst_condcode
       (/*AUTOINST*/
        // Outputs
        .raluF                          (raluF),
        .is_brcond                      (is_brcond),
        .m_condcode_killwarnings        (m_condcode_killwarnings),
        // Inputs
        .clk                            (clk),
        .alu_carryout                   (alu_carryout),
        .FUNC3                          (FUNC3[2:0]),
        .Di                             (Di[31:0]),
        .QQ                             (QQ[31:0]),
        .rzcy32                         (rzcy32));

   m_shiftcounter #(.HIGHLEVEL(HIGHLEVEL))
     inst_shiftcounter
       (/*AUTOINST*/
        // Outputs
        .lastshift                      (lastshift),
        .r_issh0_not                    (r_issh0_not),
        // Inputs
        .clk                            (clk),
        .sa18                           (sa18),
        .sa19                           (sa19),
        .B                              (B[4:0]));
   
   
   /* -----------------------------------------------------------------------------
    * Control path
    */
   
   m_progressctrl #(.HIGHLEVEL(1), 
                    .SRAMADRWIDTH(SRAMADRWIDTH)) 
   inst_progressctrl
     (/*AUTOINST*/
      // Outputs
      .SEL_O                            (SEL_O[3:0]),
      .bmask                            (bmask[3:0]),
      .iwe                              (iwe),
      .ctrlreg_we                       (ctrlreg_we),
      .WE_O                             (WE_O),
      .STB_O                            (STB_O),
      .sram_stb                         (sram_stb),
      .enaQ                             (enaQ),
      .progress_ucode                   (progress_ucode),
      .next_STB_O                       (next_STB_O),
      .next_sram_stb                    (next_sram_stb),
      .m_progressctrl_killwarnings      (m_progressctrl_killwarnings),
      // Inputs
      .clk                              (clk),
      .corerunning                      (corerunning),
      .RST_I                            (RST_I),
      .ACK_I                            (ACK_I),
      .sysregack                        (sysregack),
      .sram_ack                         (sram_ack),
      .sa15                             (sa15),
      .sa27                             (sa27),
      .sa26                             (sa26),
      .sa25                             (sa25),
      .sa24                             (sa24),
      .sa32                             (sa32),
      .sa41                             (sa41),
      .sa33                             (sa33),
      .sa42                             (sa42),
      .sa43                             (sa43),
      .sa14                             (sa14),
      .sa30                             (sa30),
      .lastshift                        (lastshift),
      .r_issh0_not                      (r_issh0_not),
      .B                                (B[31:0]),
      .nobuserror                       (nobuserror));
   
   m_ucode
     inst_ucode
       (/*AUTOINST*/
        // Outputs
        .sa00                           (sa00),
        .sa02                           (sa02),
        .sa03                           (sa03),
        .sa04                           (sa04),
        .sa05                           (sa05),
        .sa06                           (sa06),
        .sa11                           (sa11),
        .sa12                           (sa12),
        .sa14                           (sa14),
        .sa15                           (sa15),
        .sa16                           (sa16),
        .sa17                           (sa17),
        .sa18                           (sa18),
        .sa19                           (sa19),
        .sa20                           (sa20),
        .sa21                           (sa21),
        .sa22                           (sa22),
        .sa23                           (sa23),
        .sa24                           (sa24),
        .sa25                           (sa25),
        .sa26                           (sa26),
        .sa27                           (sa27),
        .sa28                           (sa28),
        .sa29                           (sa29),
        .sa30                           (sa30),
        .sa32                           (sa32),
        .sa33                           (sa33),
        .sa34                           (sa34),
        .sa37                           (sa37),
        .sa38                           (sa38),
        .sa39                           (sa39),
        .sa40                           (sa40),
        .sa41                           (sa41),
        .sa42                           (sa42),
        .sa43                           (sa43),
        .rinx                           (rinx[7:0]),
        .ucode_killwarnings             (ucode_killwarnings),
        // Inputs
        .clk                            (clk),
        .minx                           (minx[7:0]),
        .progress_ucode                 (progress_ucode));

   m_ucodepc #(.LAZY_DECODE(LAZY_DECODE))
     inst_ucodepc
       (/*AUTOINST*/
        // Outputs
        .minx                           (minx[7:0]),
        .ucodepc_killwarnings           (ucodepc_killwarnings),
        // Inputs
        .corerunning                    (corerunning),
        .rinx                           (rinx[7:0]),
        .sa28                           (sa28),
        .sa29                           (sa29),
        .sa30                           (sa30),
        .sa37                           (sa37),
        .sa32                           (sa32),
        .sa15                           (sa15),
        .qualint                        (qualint),
        .is_brcond                      (is_brcond),
        .INSTR                          (INSTR[31:0]),
        .B                              (B[31:0]),
        .RST_I                          (RST_I),
        .nobuserror                     (nobuserror));
   
   /* Interrupts in midgetv is implemented in an "all or nothing" fashion.
    * If MTIMETAP < 14, we have a minimal system, and no interrupts. Else
    * I implement registers mip, mie, and mstatus.
    */
   generate
      if ( MTIMETAP > 13 ) begin
         m_status_and_interrupts inst_status_and_interrupts
           (/*AUTOINST*/
            // Outputs
            .mrinstretip                (mrinstretip),
            .mtimeincip                 (mtimeincip),
            .mtip                       (mtip),
            .msip                       (msip),
            .mrinstretie                (mrinstretie),
            .mtimeincie                 (mtimeincie),
            .meie                       (meie),
            .mtie                       (mtie),
            .msie                       (msie),
            .mpie                       (mpie),
            .mie                        (mie),
            .qualint                    (qualint),
            .m_status_and_interrupts_killwarnings(m_status_and_interrupts_killwarnings),
            // Inputs
            .clk                        (clk),
            .alu_tapout                 (alu_tapout),
            .alu_minstretofl            (alu_minstretofl),
            .B                          (B[31:0]),
            .DAT_O                      (DAT_O[31:0]),
            .ADR_O                      (ADR_O[31:0]),
            .sa38                       (sa38),
            .sa39                       (sa39),
            .meip                       (meip),
            .ctrlreg_we                 (ctrlreg_we));
      end else begin
         assign qualint = 1'b0; // Smallest midgetv has no interrupts

         // Keep verilator happy
         assign meie        = 1'b0;                   
         assign mie         = 1'b0;                    
         assign mpie        = 1'b0;                   
         assign mrinstretie = 1'b0;            
         assign mrinstretip = 1'b0;            
         assign msie        = 1'b0;                   
         assign msip        = 1'b0;                   
         assign mtie        = 1'b0;                   
         assign mtimeincie  = 1'b0;             
         assign mtimeincip  = 1'b0;             
         assign mtip        = 1'b0;                   

         assign m_status_and_interrupts_killwarnings = 1'b0; // Keep SymplifyPro happy
      end
   endgenerate

   generate
      if ( DBGA == 0 ) begin
         assign dbga = 32'b0;
      end else begin
//         reg [31:0] rdbga;
//         always @(posedge clk) begin
////            rdbga[3] <= STB_O;
////            rdbga[2] <= iwe;
////            rdbga[1] <= sram_stb;
////            rdbga[0] <= progress_ucode;
//            //
//            // This established that we do progress_ucode, and iwe from times to times
//            // Never any STB_O, nor sram_stb
//            // So where do we write?
////            if ( iwe ) 
////              rdbga[3:0] <= {sa27,sa26,sa25,sa24};
////            else
////              rdbga[3:0] <= 4'h0;
//            //            
//            // Sequence 4,a,0,b,9,0,d,f -> We are entering a trap
//            // Reconfirm that we write to PC
////            if ( iwe & {sa27,sa26,sa25,sa24} == 4'b1010 ) begin
////               rdbga[3:0] <= 4'hf;
////            end else begin
////               rdbga[3:0] <= 4'h0;
////            end
//            //
//            // We do. Confirm that the upper 20 bits and the lower
//            // two bits of PC are always written to 0
////            if ( iwe & {sa27,sa26,sa25,sa24} == 4'b1010 ) begin
////               if ( B[31:12] != 20'h0 || B[1:0] != 2'b00 ) begin
////                  rdbga[3:0] <= 4'h1;
////               end
////            end
//            //
//            // OK, so now get the PC out. I use PC[0] as a sentinel.
//            // This relies on the fact that we use more than 3 cycles
//            // between each PC write.
////            if ( iwe & {sa27,sa26,sa25,sa24} == 4'b1010 ) begin
////               rdbga <= B | 32'b1;
////            end else begin
////               rdbga[27:0] <= rdbga[31:4];
////            end
//            //
//            // Seems we write 0x4 to PC, then 0 to PC ??
//            // Examine minx[3:0]
////            rdbga[3:0] <= minx[3:0];
//            //
//            // seems stuck at 0x8. 
//            // Examine minx[7:0]
//            rdbga[3:0] <= minx[7:4];
//         end
//         assign dbga = rdbga;
         assign dbga = 32'b0;
      end
   endgenerate
endmodule



// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-extensions:(".v" )
// End:
