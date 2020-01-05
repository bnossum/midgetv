// documentme

#define RVTEST_IO_INIT
#define RVTEST_IO_ASSERT_GPR_EQ(_SP, _R, _I)

#define RVTEST_IO_WRITE_STR(_SP, _STR)                                  \
    LOCAL_IO_PUSH(_SP)                                                  \
    .section .data.string;                                              \
20001:                                                                  \
    .string _STR;                                                       \
    .section .text;                                                     \
    la a0, 20001b;                                                      \
    jal bn_puts;                                                        \
    LOCAL_IO_POP(_SP)

