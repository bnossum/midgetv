        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================

/* The start of EBR is taken up by registers.
 * Then comes magic constants and system registers
 * Originally 
 *   volatile uint32_t x[32];
 * was present in the start of SYSEBR_TypeDef, but then the mapping
 *   #define SYSEBR ((SYSEBR_TypeDef *)0) led to disasters, probably some aliasing
 * with NULL. The simplest consistent way to avoid the problem was to take out
 * the registers, and do what amounts to 
 *   #define SYSEBR ((SYSEBR_TypeDef *)0x80)
 */
typedef struct {
        //const uint32_t        x0;    see comment above
        //volatile uint32_t     x[31]; see comment above.
        volatile uint32_t       jj;
        volatile uint32_t       rinst;
        const volatile uint32_t pc;
        volatile uint32_t       mcycle;
        uint32_t                rNMI_IIV;
        const uint32_t          cteffffff7f;    
        const uint32_t          cte000000ff;    
        const uint32_t          cte0000ffff;    
        const uint32_t          cteffff7fff;    
        uint32_t                mtvec;        
        const uint32_t          cte00000000;    
        const uint32_t          cteffffffff;    
        volatile uint32_t       yy;           
        volatile uint32_t       mepc;
        volatile uint32_t       mcause;       
        volatile uint32_t       mtval;        
        volatile uint32_t       mscratch;     
        volatile uint32_t       misa;         
        volatile uint32_t       ex_dup_x0;     
        volatile uint32_t       ex_rCSRadr;    
        volatile uint32_t       ex_rCSRty;     
        volatile uint32_t       ex_rrs1;       
        volatile uint32_t       ex_rrd;        
        volatile uint32_t       ex_rtmp;       
        const volatile uint32_t mtime;         // Write adr is different
        volatile uint32_t       mtimeh;        
        uint32_t                freefornow_e8;
        const volatile uint32_t minstreth;     // Write adr is different
        volatile uint32_t       mcycleh;       
        uint32_t                freefornow_f4;
        const volatile uint32_t mtimecmp;      // Write adr is different
        const volatile uint32_t mtimecmph;     // Write adr is different
        volatile uint32_t       CSRretadr;     // 
        void (*Entry_xRET)(void);    
        void (*Entry_CSR )(void);    
} SYSEBR_TypeDef;

/* A note to self:
   Even though the leds are output registers, they must be declared volatile.
   It turned out that the following otherwise fails:
   int main( void ) {
           while ( 1 )
                   LED->D = 5;
   } 

   Was optimized to:
   main:
           j main
 */
typedef union {
        volatile uint32_t D;
        struct {
                uint8_t D;
                uint8_t b1;
                uint8_t b2;
                uint8_t CTRL;
        } s;
} LED_TypeDef;

/* The bitbang UART is generally to be made available for boards where FDTI
 * is the interface to PC. iceblink40-hx1k uses AT90USB216, with a propriatary
 * program (Digilent JTAG), and here I have hacked a sort-of EPP interface.
 * This interface is only used when there is no bitbang UART, and hence I
 * reuse the IO address.
 */
typedef struct {
        volatile uint32_t D;
} UART_TypeDef;

typedef struct {
        volatile uint32_t D; // Data
        volatile uint32_t S; // Status
} EPP_TypeDef;

/* The FM transmitter
 */
typedef struct {
        volatile uint32_t D;
} FMXMIT_TypeDef;
#define FM_OE     (1<<14)
#define FM_FCLKEN (1<<13)

//                                 Coarse regions                         ADR_O[31:27]
#define EBRBASE      0x00000000 // 0x3fffffff-0x00000000 EBR              00xxx
#define RESERVEDBASE 0x40000000 // 0x5fffffff-0x40000000 reserved         010xx
#define IOBASE       0x60000000 // 0x67ffffff-0x60000000 IO               01100
#define SYSREGBASE   0x68000000 // 0x7fffffff-0x68000000 System registers 011yy with yy != 2'b00
#define SRAMBASE     0x80000000 // 0xffffffff-0x80000000 SRAM             1xxxx

#define VITALSYS_BASE  (EBRBASE+0x00000080u)
#define LED_BASE       (IOBASE +0x00000004u)
#define UART_BASE      (IOBASE +0x00000008u) 
#define EPP_BASE       (IOBASE +0x00000008u) 
#define FMXMIT_BASE    (IOBASE +0x00000010u)

#define SYSEBR ((SYSEBR_TypeDef *) VITALSYS_BASE   )
#define UART   ((UART_TypeDef *)   UART_BASE       )
#define EPP    ((EPP_TypeDef *)    EPP_BASE        )
#define LED    ((LED_TypeDef *)    LED_BASE        )
#define FMXMIT ((FMXMIT_TypeDef *) FMXMIT_BASE     )
