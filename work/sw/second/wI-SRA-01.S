#include "midgetv.inc"
        .globl _start
        .section .text
#include "midgetv_dump_compliance.S"
_start: 
#include "../../../riscv-compliance/riscv-test-suite/rv32i/src/I-SRA-01.S"
