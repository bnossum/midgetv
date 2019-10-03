#include "midgetv.inc"
        .globl _start
        .section .text
_start: 
        j       _midgetstart
#include "midgetv_dump_compliance.S"
#include "../../../riscv-compliance/riscv-test-suite/rv32i/src/I-ADDI-01.S"
