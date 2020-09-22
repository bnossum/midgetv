        // Get out compliance data
        // RV_COMPLIANCE_HALT branches here:
	.global midgetv_dump_compliance
midgetv_dump_compliance:
        li      x2,0x800
        la      s1,midgetv_compliance_data_begin
        la      s2,midgetv_compliance_data_end

//        li      a1,0x60000004   // "USART"
//2:      lw      a0,(s1)
//        jal     dump_word
//        li      a0,'\n'
//        simputc 10
//        sw      a0,(a1)
//        addi    s1,s1,4
//        blt     s1,s2,2b
//        simend
//        
//        /////////////////////////////////////////////////////////////////////////////
//        .global dump_word
//dump_word:
//        li      t2,'9'
//        li      t0,28           // Startpos
//2:      srl     t1,a0,t0        // get nibble value to output
//        andi    t1,t1,15
//        addi    t1,t1,'0'
//        ble     t1,t2,1f
//        addi    t1,t1,('a'-'0'-10)
//1:      sw      t1,(a1)         // Write to "USART"
//        simputc 6
//        addi    t0,t0,-4
//        bgez    t0,2b
//        ret



	.word	0x600005b7  //        	lui	x11,0x60000
	.word	0x00458593  //        	addi	x11,x11,4 
	.word	0x0004a503  //        	lw	x10,0(x9)
	.word	0x01c000ef  //        	jal	x1,14c <_start+0x3c>
	.word	0x00a00513  //        	addi	x10,x0,10
	.word	0x01853033  //        	sltu	x0,x10,x24
	.word	0x00a5a023  //        	sw	x10,0(x11)
	.word	0x00448493  //        	addi	x9,x9,4
	.word	0xff24c4e3  //        	blt	x9,x18,12c 
	.word	0x00003033  //        	sltu	x0,x0,x0

	.word	0x03900393  //        	addi	x7,x0,57
	.word	0x01c00293  //        	addi	x5,x0,28
	.word	0x00555333  //        	srl	x6,x10,x5
	.word	0x00f37313  //        	andi	x6,x6,15
	.word	0x03030313  //        	addi	x6,x6,48
	.word	0x0063d463  //        	bge	x7,x6,168 
	.word	0x02730313  //        	addi	x6,x6,39
	.word	0x0065a023  //        	sw	x6,0(x11)
	.word	0x01833033  //        	sltu	x0,x6,x24
	.word	0xffc28293  //        	addi	x5,x5,-4
	.word	0xfe02d0e3  //        	bge	x5,x0,154 
	.word	0x00008067  //        	jalr	x0,0(x1)
        
