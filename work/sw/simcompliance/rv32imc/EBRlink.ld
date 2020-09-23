/* Linker script only to be used in low-level testing of midget.
 * This script are for files where everything is located in EBR.
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  ebr (rwx) : ORIGIN = 0x00000000, LENGTH = 8K
}

SECTIONS
{
  . = 0;
  .theEBRram : {
    *(.EBRram*)
    *(.text*)
    *(.rodata*)
    *(.data*)
    *(.bss*)
    *(COMMON)
  } >ebr
}

