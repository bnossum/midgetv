// documentme
// For midgetv

#define STRINGIFY(x) #x
#define TOSTRING(x)  STRINGIFY(x)
        
        
#define RVTEST_IO_INIT
#define RVTEST_IO_CHECK()

#define LOCAL_IO_PUSH(_SP)              \
    sw          sp,(LOCAL_IO_SP_STORAGE)(x0);\
    la          sp, _IO_STACK_ENTRYPT;  \
    sw          ra, ( 0*4 )(sp);        \
    sw          a0, ( 1*4 )(sp);        \
        

#define LOCAL_IO_POP(_SP)               \
    la          sp, _IO_STACK_ENTRYPT;  \
    lw          ra, ( 0*4 )(sp);        \
    lw          a0, ( 1*4 )(sp);        \
    lw          sp,(LOCAL_IO_SP_STORAGE)(x0);\
        
#define LOCAL_IO_WRITE_STR(_STR)        \
    .section .data.string;              \
20003:                                  \
    .string _STR;                       \
    .section .text;                     \
    la          a0,20003b;              \
    jal         FN_asm_puts;            \

#define LOCAL_IO_WRITE_GPR(_R)          \
    mv          a0, _R;                 \
    jal         FN_WriteA0;             \
        
#define RVTEST_IO_WRITE_STR(_SP, _STR)  \
    LOCAL_IO_PUSH(_SP)                  \
    LOCAL_IO_WRITE_STR(_STR)            \
    LOCAL_IO_POP(SP)                    \


        
        
/* Assertion violation: file file.c, line 1234: (expr)
   _SP = (volatile register)
   _R = GPR
   _I = Immediate
   The only register I know for sure can be corrupted is _SP, and
   I don't know what register that is. I take it for granted that
   _SP != _R.
*/        
#define RVTEST_IO_ASSERT_GPR_EQ(_SP, _R, _I)                            \
    li          _SP, _I;                                                \
    beq         _R, _SP, 2f;                                            \
    LOCAL_IO_PUSH(_SP);                                                 \
    LOCAL_IO_WRITE_STR("Assertion violation: file ");                   \
    LOCAL_IO_WRITE_STR(__FILE__);                                       \
    LOCAL_IO_WRITE_STR(", line ");                                      \
    LOCAL_IO_WRITE_STR(TOSTRING(__LINE__));                             \
    LOCAL_IO_WRITE_STR(": ");                                           \
    LOCAL_IO_WRITE_STR(# _R);                                           \
    LOCAL_IO_WRITE_STR("(");                                            \
    LOCAL_IO_WRITE_GPR(s0);                                             \
    LOCAL_IO_WRITE_STR(") != ");                                        \
    LOCAL_IO_WRITE_STR(# _I);                                           \
    LOCAL_IO_WRITE_STR("\n");                                           \
    LOCAL_IO_POP(_SP);                                                  \
2:                                                                      \

        
