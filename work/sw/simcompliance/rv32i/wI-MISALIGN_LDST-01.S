#include "midgetv.inc"
        .globl _start
#include "midgetv_minimal_csr.S"
        .section .text
_start: 
        j       _midgetstart
#include "midgetv_dump_compliance.S"
#include "I-MISALIGN_LDST-01.S"
