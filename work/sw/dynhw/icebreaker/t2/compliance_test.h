// For midgetv
// Description: Common header file for RV32I tests

// In a test environment this ultimately leads to a CSR write instruction
#define RV_COMPLIANCE_RV32M

// A location in EBR is used for absolute storage        
#define LOCAL_IO_SP_STORAGE 0xf4
        
// Before compliance test code we store all normal registers        
#define RV_COMPLIANCE_CODE_BEGIN        \
        sw      x31,(LOCAL_IO_SP_STORAGE)(x0) ;\
        la      x31,BN_REGSTORE;        \
        sw      x1, (  1*4)(x31) ;      \
        sw      x2, (  2*4)(x31) ;      \
        sw      x3, (  3*4)(x31) ;      \
        sw      x4, (  4*4)(x31) ;      \
        sw      x5, (  5*4)(x31) ;      \
        sw      x6, (  6*4)(x31) ;      \
        sw      x7, (  7*4)(x31) ;      \
        sw      x8, (  8*4)(x31) ;      \
        sw      x9, (  9*4)(x31) ;      \
        sw      x10,( 10*4)(x31) ;      \
        sw      x11,( 11*4)(x31) ;      \
        sw      x12,( 12*4)(x31) ;      \
        sw      x13,( 13*4)(x31) ;      \
        sw      x14,( 14*4)(x31) ;      \
        sw      x15,( 15*4)(x31) ;      \
        sw      x16,( 16*4)(x31) ;      \
        sw      x17,( 17*4)(x31) ;      \
        sw      x18,( 18*4)(x31) ;      \
        sw      x19,( 19*4)(x31) ;      \
        sw      x20,( 20*4)(x31) ;      \
        sw      x20,( 20*4)(x31) ;      \
        sw      x21,( 21*4)(x31) ;      \
        sw      x22,( 22*4)(x31) ;      \
        sw      x23,( 23*4)(x31) ;      \
        sw      x24,( 24*4)(x31) ;      \
        sw      x25,( 25*4)(x31) ;      \
        sw      x26,( 26*4)(x31) ;      \
        sw      x27,( 27*4)(x31) ;      \
        sw      x28,( 28*4)(x31) ;      \
        sw      x29,( 29*4)(x31) ;      \
        sw      x30,( 30*4)(x31) ;      \
        lw      x30,(LOCAL_IO_SP_STORAGE)(x0) ;\
        sw      x30,( 31*4)(x31) ;      \
        
// After compliance test code we restore all normal registers        
#define RV_COMPLIANCE_CODE_END          \
        la      x31,BN_REGSTORE;        \
        lw      x1, (  1*4)(x31) ;      \
        lw      x2, (  2*4)(x31) ;      \
        lw      x3, (  3*4)(x31) ;      \
        lw      x4, (  4*4)(x31) ;      \
        lw      x5, (  5*4)(x31) ;      \
        lw      x6, (  6*4)(x31) ;      \
        lw      x7, (  7*4)(x31) ;      \
        lw      x8, (  8*4)(x31) ;      \
        lw      x9, (  9*4)(x31) ;      \
        lw      x10,( 10*4)(x31) ;      \
        lw      x11,( 11*4)(x31) ;      \
        lw      x12,( 12*4)(x31) ;      \
        lw      x13,( 13*4)(x31) ;      \
        lw      x14,( 14*4)(x31) ;      \
        lw      x15,( 15*4)(x31) ;      \
        lw      x16,( 16*4)(x31) ;      \
        lw      x17,( 17*4)(x31) ;      \
        lw      x18,( 18*4)(x31) ;      \
        lw      x19,( 19*4)(x31) ;      \
        lw      x20,( 20*4)(x31) ;      \
        lw      x20,( 20*4)(x31) ;      \
        lw      x21,( 21*4)(x31) ;      \
        lw      x22,( 22*4)(x31) ;      \
        lw      x23,( 23*4)(x31) ;      \
        lw      x24,( 24*4)(x31) ;      \
        lw      x25,( 25*4)(x31) ;      \
        lw      x26,( 26*4)(x31) ;      \
        lw      x27,( 27*4)(x31) ;      \
        lw      x28,( 28*4)(x31) ;      \
        lw      x29,( 29*4)(x31) ;      \
        lw      x30,( 30*4)(x31) ;      \
        lw      x31,( 31*4)(x31) ;      \

#define RV_COMPLIANCE_DATA_BEGIN
#define RV_COMPLIANCE_DATA_END
#define RV_COMPLIANCE_HALT

        
        
