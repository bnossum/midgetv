#include "midgetv.inc"
        .globl _start
#include "midgetv_minimal_csr.S"
        .section .text
_start: 
        j       _midgetstart
#include "midgetv_dump_compliance.S"
#include "dupI-MISALIGN_JMP-01.S"
