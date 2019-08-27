
#if 0        
//dbg1  mv      x10,rBitrate
//dbg1  j       BINBLINK
        

        /* During debug, see that we have a basic communication.
         *  o The bitrate.
         *    I dechipher the bitrate to be 0x9dcd for 300bps.
         *    This is right according to autobaud.
         *  o Ensured I could receive a character.
         *
         */
#define IOregion 0x60000000

Show_Y: mv      regL,regY
Show_L: mv      regP,regL
GotWhat:mv      x10,regP
        
        // In: x10 is value to output to LEDs
        // Output a 32-bit value by LEDs.
        // Output red for a 1, green for a 0.
        // from msb to lsb
        // Hang.
BINBLINK:
        li      x3,IOregion
        //li      x5,32
        li      x5,16           // Output a 16-bit value by LEDs.
        slli    x10,x10,16      // 16 lsbs to be shown

2:      sw      x0,LEDOFS(x3)
        jal     x1,DLY

//        slt     x6,x0,x10
//        addi    x6,x6,1
        li      x6,0x80000000
        and     x6,x6,x10
        beq     x6,x0,isZero
        li      x6,1            // Red
        j       1f
isZero: li      x6,2            // Green
1:      
        
        sw      x6,LEDOFS(x3)
        jal     x1,DLY
        slli    x10,x10,1
        addi    x5,x5,-1
        bne     x5,x0,2b
1:      sw      x0,LEDOFS(x3)
        j       1b
        

DLY:    li      x6,0x80000
1:      addi    x6,x6,-1
        bne     x6,x0,1b
        jalr    x0,0(x1)

DBGCNTLEDS:    
        li      x3,IOregion
        sw      x5,LEDOFS(x3)
        addi    x5,x5,1
        jal     x1,DLY
        j       DBGCNTLEDS
        
#endif
