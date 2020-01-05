// Documentme
// Description: Common header file for RV32I tests

#define RSIZE 4

#define RV_COMPLIANCE_RV32M
#define RV_COMPLIANCE_CODE_BEGIN
#define RV_COMPLIANCE_CODE_END
#define RV_COMPLIANCE_DATA_BEGIN
#define RV_COMPLIANCE_DATA_END
#define RV_COMPLIANCE_HALT

#define LOCAL_IO_PUSH(_SP)                                              \
    la      _SP,  begin_regstate;                                       \
    sw      x1,   (1*RSIZE)(_SP);                                       \
    sw      x5,   (5*RSIZE)(_SP);                                       \
    sw      x6,   (6*RSIZE)(_SP);                                       \
    sw      x8,   (8*RSIZE)(_SP);                                       \
    sw      x10,  (10*RSIZE)(_SP);

// _SP = (volatile register)
#define LOCAL_IO_POP(_SP)                                               \
    la      _SP,   begin_regstate;                                      \
    lw      x1,   (1*RSIZE)(_SP);                                       \
    lw      x5,   (5*RSIZE)(_SP);                                       \
    lw      x6,   (6*RSIZE)(_SP);                                       \
    lw      x8,   (8*RSIZE)(_SP);                                       \
    lw      x10,  (10*RSIZE)(_SP);

