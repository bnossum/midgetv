// RISC-V Compliance IO Test Header File

/*
 * Copyright (c) 2020 Baard Nossum
 * For licence, see licence.txt
 *
 *
 */

#ifndef _COMPLIANCE_IO_H
#define _COMPLIANCE_IO_H

#define STRINGIFY(x) #x
#define TOSTRING(x)  STRINGIFY(x)

#define SILENT  1

        
//-----------------------------------------------------------------------
// RV IO Macros 
//-----------------------------------------------------------------------
#if SILENT != 0
//-----------------------------------------------------------------------

#define RVTEST_IO_INIT
#define RVTEST_IO_WRITE_STR(_SP, _STR)
#define RVTEST_IO_CHECK()
#define RVTEST_IO_ASSERT_GPR_EQ(_SP, _R, _I)
#define RVTEST_IO_ASSERT_SFPR_EQ(_F, _R, _I)
#define RVTEST_IO_ASSERT_DFPR_EQ(_D, _R, _I)
#define RVTEST_IO_WRITE_STR(_SP, _STR)
#else        

//-----------------------------------------------------------------------
#define RVTEST_IO_INIT
//#define RVTEST_IO_WRITE_STR(_SP, _STR)
#define RVTEST_IO_CHECK()                                               \
        RVTEST_IO_WRITE_STR( x31, "Implement RVTEST_IO_CHECK()\n" );    \

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


#define RVTEST_IO_ASSERT_SFPR_EQ(_F, _R, _I)                            \
        RVTEST_IO_WRITE_STR( x31,"Implement RVTEST_IO_ASSERT_SFPR_EQ()\n" );\
        
#define RVTEST_IO_ASSERT_DFPR_EQ(_D, _R, _I)                            \
        RVTEST_IO_WRITE_STR( x31,"Implement RVTEST_IO_ASSERT_DFRP_EQ()\n" );\

#define RVTEST_IO_WRITE_STR(_SP, _STR)  \
    LOCAL_IO_PUSH(_SP);                 \
    LOCAL_IO_WRITE_STR(_STR);           \
    LOCAL_IO_POP(_SP);                  \

        
#define LOCAL_IO_PUSH(_SP)                      \
    .option push;                               \
    .option norvc;                              \
    sw          sp,LOCAL_IO_SP_STORAGE,_SP;     \
    la          sp, _IO_STACK_ENTRYPT;          \
    sw          ra, ( 0*4 )(sp);                \
    sw          a0, ( 1*4 )(sp);                \

        
#define LOCAL_IO_POP(_SP)               \
    .option pop;                        \
    la          sp, _IO_STACK_ENTRYPT;  \
    lw          ra, ( 0*4 )(sp);        \
    lw          a0, ( 1*4 )(sp);        \
    lw          sp,LOCAL_IO_SP_STORAGE; \
        
#define LOCAL_IO_WRITE_STR(_STR)        \
    .section .data.string;              \
1:;                                     \
    .string _STR;                       \
    .section .text;                     \
    la          a0,1b;                  \
    call        FN_asm_puts;            \


#define LOCAL_IO_WRITE_GPR(_R)          \
    mv          a0, _R;                 \
    call        FN_asm_WriteA0;         \

#endif // silent
        
#endif // _COMPLIANCE_IO_H
