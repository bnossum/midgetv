// To debug csr. Quick and dirty.
// We use x31 as stack pointer.

#define csrSTRINGIFY(x) #x
#define csrTOSTRING(x)  csrSTRINGIFY(x)
        

// A location in EBR is used for absolute storage        
#define csrLOCAL_IO_SP_STORAGE 0xf4

#define csrLOCAL_IO_PUSH                                \
        sw          x31,(csrLOCAL_IO_SP_STORAGE)(x0);   \
        la          x31, _csrIO_STACK_ENTRYPT;          \
        sw          ra, ( 0*4 )(x31);                   \
        sw          a0, ( 1*4 )(x31);                   \
        
#define csrLOCAL_IO_ARGRESTORE                          \
        lw          ra, ( 0*4 )(x31);                   \
        lw          a0, ( 1*4 )(x31);                   \
        
#define csrLOCAL_IO_POP                                 \
        lw          ra, ( 0*4 )(x31);                   \
        lw          a0, ( 1*4 )(x31);                   \
        lw          x31,(csrLOCAL_IO_SP_STORAGE)(x0);   \
        
#define csrLOCAL_IO_WRITE_STR(_STR)               \
        .section .magicconstants.string;          \
20003:                                            \
.string _STR;                                     \
        .section .magicconstants;                 \
        la          a0,20003b;                    \
        jal         csrFN_asm_puts;               \
        
#define csrLOCAL_IO_WRITE_GPR(_R)          \
        mv          a0, _R;                \
        jal         csrFN_WriteA0;         \
        
        
