#define RVTEST_IO_ASSERT_GPR_EQ(a,b,c)          
#define RVTEST_IO_WRITE_STR(reg,_STR)



//#define TEST_MULDIV(opcode,rd_rs2,rs1,vfacit,rs2v,rs1v,simerrno) \
//        li rd_rs2,rs2v; \
//        li rs1,rs1v; \
//        opcode rd_rs2,rs1,rd_rs2; \
//        li rs1,vfacit; \
//        beq rd_rs2,rs1,1f;\
//        simerr simerrno;\
//        1:
//

#define TEST_MULDIV(opcode,rd_rs1,rs2,vfacit,rs1v,rs2v,simerrno) \
        li rd_rs1,rs1v; \
        li rs2,rs2v; \
        opcode rd_rs1,rd_rs1,rs2; \
        li rs2,vfacit; \
        beq rd_rs1,rs2,1f;\
        simerr simerrno;\
        1:

