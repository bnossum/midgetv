Some files are just to allow simulation of the riscv compliance test suite for rv32i:
- `compliance_io.h`
- `compliance_test.h`
- `midgetv_dump_compliance.S`
- `test_macros.h`

A minimal implementation of CSR instructions is in file `midgetv_minimal_csr.S`.

A most inportant include file is `midgetv.inc`. The file
`midgetv2.inc`, nearly the same, will be eliminated later.
