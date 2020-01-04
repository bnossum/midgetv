        // Get out compliance data
        // RV_COMPLIANCE_HALT branches here:
midgetv_dump_compliance:
        la      s1,midgetv_compliance_data_begin
        la      s2,midgetv_compliance_data_end
        li      a1,0x60000004   // "USART"

2:      lw      a0,(s1)
        jal     dump_word
        li      a0,'\n'
        simputc 10
        sw      a0,(a1)
        addi    s1,s1,4
        blt     s1,s2,2b
        simend
        
        /////////////////////////////////////////////////////////////////////////////
dump_word:
        li      t2,'9'
        li      t0,28           // Startpos
2:      srl     t1,a0,t0        // get nibble value to output
        andi    t1,t1,15
        addi    t1,t1,'0'
        ble     t1,t2,1f
        addi    t1,t1,('a'-'0'-10)
1:      sw      t1,(a1)         // Write to "USART"
        simputc 6
        addi    t0,t0,-4
        bgez    t0,2b
        ret
