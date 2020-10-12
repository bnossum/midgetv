/* Linking for midgetv will produce a binary file in a format that can be eaten by
 * the loader monitor mb.S. 
 * min_icebreaker have no SRAM
 * Note - I removed section  *(.magicconstants.string)
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr : ORIGIN = 0, LENGTH = 12
  rom : ORIGIN = 12, LENGTH = 128K
  csrcode (RWX): ORIGIN = 0x100, LENGTH = 4k - 0x100
}

SECTIONS
{
  .id_and_header1 : {
    LONG(0x01071f3f)
    LONG(0x00000100)
    LONG(_ebrloadend)
  } >hdr
  .thecsrcode 0x100 : {
    *(.magicconstants)
    *(.srodata*)
    *(.rodata*)
    *(.text.startup)
    *(.text)
    *(.text*)
    *(.data)
    *(.data.string)
    *(.data*)
    *(.tohost)
    *(.fromhost)
    *(.bss*)
    *(COMMON)
    _ebrloadend = .;
    LONG(0x00000000)
    LONG(_start)
  } >csrcode AT >rom
}

 
