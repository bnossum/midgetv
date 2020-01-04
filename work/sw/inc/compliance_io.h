#define BAREBONE 1
#if BAREBONE
#define RVTEST_IO_INIT
#define RVTEST_IO_WRITE_STR(__SP, STR)
#define RVTEST_IO_CHECK()
#define RVTEST_IO_ASSERT_GPR_EQ(_SP, _R, _I)
#define RVTEST_IO_ASSERT_SFPR_EQ(_F, _R, _I)
#define RVTEST_IO_ASSERT_DFPR_EQ(_D, _R, _I)
#else
Can't get this to work..
#define RVTEST_IO_INIT
#define RVTEST_IO_WRITE_STR(_STR) \
        .section .rodata;         \
1984:                             \
        .string _STR;             \
        .section .text;           \
        la      a0,1984b;         \
        jal     FN_WriteStr;

//
// FN_WriteStr
//
FN_WriteStr:
        mv      t0,a0;
1:      lbu     a0,(t1);
        addi    t1,t1,1;
        beq     a0,zero,1f;
        simerr  31;
        simputc 10;
        j       1b;
1:
        ret;

#define RVTEST_IO_CHECK()
#define RVTEST_IO_ASSERT_GPR_EQ(_R, _I)
#define RVTEST_IO_ASSERT_SFPR_EQ(_F, _R, _I)
#define RVTEST_IO_ASSERT_DFPR_EQ(_D, _R, _I)
#endif
