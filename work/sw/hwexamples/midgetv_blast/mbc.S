        // This sketch indicate that with compressed instructions
        // the blast routine fits inside register space.
        
        #if 0
        
#define IOREGION 0x60000000
#define LEDOFS  4
#define UARTOFS 8

#define retreg   x1
        
#define regB     x8
#define regIO    x9
#define regW     x10
#define rBitrate x11        
#define regMCY   x12
#define regP     x13
#define regC     x14        
#define regL     x15
#define regY     x16        
#define rBytelim x17

        .globl  _start
        .org 0
        .word   0               // x0
        .word   (1 <<20) | 3               // x1  retreg
        .word   (2 <<20) | 3               // x2  free
        .half 0xbabe
        .org 14
LBHead: c.li    regC,-8
1:      c.jal   getchar
        sb      regP,20(regC)
        c.addi  regC,1
        c.bnez  regC,1b
        c.bnez  regL,DataL
        jalr    x0,0(regY)

        
        .org 4*8
        .word   (8  << 20) | 3             // x8 
        .word   (9  << 20) | 3             // x9 
        .word   (10 << 20) | 3             // x10
        .word   (11 << 20) | 3             // x11
        .word   (12 << 20) | 3             // x12
        .word   (13 << 20) | 3             // x13
        .word   (14 << 20) | 3             // x14
        .word   (15 << 20) | 3             // x15
        .word   (16 << 20) | 3             // x16
        .word   (17 << 20) | 3             // x17
        .word   (18 << 20) | 3             // x18 free

        .org 4*19
DataL: 
        c.jal   getchar
        sb      regP,0(regL)
        c.addi  regL,1
        sb      regP,LEDOFS(regIO)
        bltu    regL,regY,DataL
        c.j     LBHead
        
getchar:
        c.lw    regB,UARTOFS(regIO)
        c.beqz  regB,getchar
1:      c.lw    regB,UARTOFS(regIO)
        c.bnez  regB,1b
        c.sw    regB,0(regMCY)
        srli    regW,rBitrate,1
2:      c.add   regW,rBitrate
1:      c.lw    regB,0(regMCY)
        bltu    regB,regW,1b
        c.lw    regB,UARTOFS(regIO)
        c.srli  regP,1
        c.or    regP,regB
        bltu    regW,rBytelim,2b
        c.jr    retreg
        .org    0x80                    //      
__jj:           .word 0          //     // 0x080     ucode register
__rinst:        .word 0          //     // 0x084     32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088     Program counter
__mcycle:       .word 0          //     // 0x08c     32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x090     Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x094     For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098     Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c     Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0     For sign extension in "lh"
__mtvec:        .word 0          //     // 0x0a4     Should point to excption handler.
cte00000000:    .word 0x00000000 // x   // 0x0a8     ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac     ucode constant.
__yy:           .word 0                 // 0x0b0     ucode register.
        .org    0xb4                                 
_start: 
        // Autobaud routine here
        


#endif
