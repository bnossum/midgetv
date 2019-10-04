#include "midgetv.inc"
        .globl _start
        .section .text
#include "midgetv_dump_compliance.S"
_start: 
#include "I-XOR-01.S"
