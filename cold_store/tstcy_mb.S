/*
  mb.S may be represented roughly as this:
  
  getchar( void ) {
          ///
          startbitsampleofusart(); // A
          /// 
          lastsampleofusart(); // B
          ///
  }
  
  main() {
  LoadBlockhead:
          ///
          getchar(); // C
          ///
  DataLoadLoop:
          ///
          getchar(); // D
          ///
  }

  Assuming a somewhat slow 12 MHz clock we have the following:
        
  mb.S has the following critical section:
  Case Path
  1    A -> B        Must be less than 151. From startbit to sample D.0
  2    B -> B        Must be less than 101. From sample D.n to sample D.(n+1) of header
  3    C.B -> C.A    Must be less than 101. From sample D.7 of byte to startbit of next byte
  4    C.B -> D.A    Must be less than 101. From sample D.7 of last byte of block header to startbit of first byte of data
  5    D.B -> D.A    Must be less than 101. From sample D.n to sample D.(n+1) of data
  6    D.B -> C.A    Must be less than 101. From sample D.7 of last byte of data block to startbit of first byte of next block header

  The following represents code for case  4, by visual inspection I believe this is the worst.


        lw      regU,UARTOFS(regB)      //   6   regU = UART->D;                          <- Event B
        beq     regU,x0,1f              //   8   
        ori     regP,regP,0x100      	//   7   
1:      slli    regP,regP,1     	//   8   regP = (regP>>1) | (rcvbit<<7);
        addi    regN,regN,-1    	//   5   Done byte?
        bne     regN,x0,2b           	//   8   No, next bit
        jalr    x0,0(regT)      	//   8   Done
RetPt:                                          
        sb      regP,0x3c(regC)         //  34  	        *p++ = near_getchar();
        addi    regC,regC,1             //   5    	
        bne     regC,x0,LoadBlockHead   //   8    	
        bne     regL,x0,DataLoadLoop    //   8   	if ( end == 0 )
DataLoadLoop:                           //       	do {
        jal     regT,getchar            //   7    	        a = getchar();
                                                
1:      lw      regU,UARTOFS(regB)      //   6    while ( UART->D == 0 ) // previous transaction 
        beq     regU,x0,1b              //   8         ;                                         
//1:    lw      regU,UARTOFS(regB)      //        while ( UART->D == 1 ) // not startbit  <- Event A        
                   //               Total: 126

        Because 126 is so much larger than 101 I stop here.
        I will not be able to reach 115200 bps with a 12 MHz clock.

        I should rach 115200 with a 126/101*12 = 15 MHz clock
*/
