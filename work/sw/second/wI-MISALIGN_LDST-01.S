#include "midgetv.inc"
        .globl _start
#include "midgetv_minimal_csr.S"
        .section .text
_start: 
        j       _midgetstart
#include "midgetv_dump_compliance.S"
#include "../../../riscv-compliance/riscv-test-suite/rv32i/src/I-MISALIGN_LDST-01.S"
