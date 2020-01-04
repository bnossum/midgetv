#ifndef _COMPLIANCE_TEST_H
#define _COMPLIANCE_TEST_H

#define RV_COMPLIANCE_HALT\
        j midgetv_dump_compliance
        
#define RV_COMPLIANCE_RV32M       
#define RV_COMPLIANCE_CODE_BEGIN                \
        _midgetstart:

#define RV_COMPLIANCE_CODE_END    

#define RV_COMPLIANCE_DATA_BEGIN                \
        .align 4;                               \
        midgetv_compliance_data_begin:          \

#define RV_COMPLIANCE_DATA_END                  \
        .align 4;                               \
        midgetv_compliance_data_end:

#endif
