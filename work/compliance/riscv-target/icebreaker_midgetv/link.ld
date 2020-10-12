/* Linking for midgetv will produce a binary file in a format that can be eaten by
 * the loader monitor mb.S. 
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr : ORIGIN = 0, LENGTH = 12
  rom : ORIGIN = 12, LENGTH = 128K
  sram (RWX): ORIGIN = 0xfffe0000, LENGTH = 128K
  csrcode (RWX): ORIGIN = 0xb4, LENGTH = 4k
}

SECTIONS
{
  .id_and_header1 : {
    LONG(0x01071f3f)
    LONG(0x000000b4)
    LONG(_ebrloadend)
  } >hdr
  .thecsrcode : {
    *(.magicconstants)
    *(.magicconstants.string)
    _ebrloadend = .;
  } >csrcode AT >rom
  .header2 : {
    LONG(0xfffe0000)
    LONG(_payloadend)
  } >csrcode AT >rom
  .thesram : {
    *(.mb_restore)
    *(.srodata*)
    *(.rodata*)   
    *(.text.startup)
    *(.text)
    *(.text*)
    *(.data)
    *(.data.string)
    *(.data*)
    *(.tohost)
    *(.bss*)
    *(COMMON)
    _payloadend = . ;
    LONG(0x00000000)
    LONG(_start)
  } >sram AT >rom
}

 
