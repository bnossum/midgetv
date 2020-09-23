/* Linker script only to be used in low-level testing of midget.
 * This script is for files where we have EBRs and 2 SRAMs.
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  ebr (rwx)      : ORIGIN = 0x00000000, LENGTH = 8K
  poordesign (r) : ORIGIN = 0x00000400, LENGTH = 64K
  ram (rwx)      : ORIGIN = 0xFFFF0000, LENGTH = 64K
}

SECTIONS
{
  . = 0;
  .theEBRram : {
    *(.EBRram*)
  } >ebr
  . = 0xffff0000;
  .theSRAM : {
    *(.text*)
    *(.rodata*)
    *(.data*)
    *(.bss*)
    *(COMMON)
  } >ram AT >poordesign
}

