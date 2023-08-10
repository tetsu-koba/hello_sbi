MEMORY { mem : ORIGIN = 0x41000000, LENGTH = 0x00040000 }
OUTPUT_ARCH("riscv")
ENTRY(_start)
SECTIONS
{
 . = ALIGN(4);
 .text : {
  *(.text_start)
  *(.text*)
 } > mem
 . = ALIGN(4);
 .rodata : {
  *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*)))
 } > mem
 . = ALIGN(4);
 .data : {
  *(.data*)
 } > mem
 . = ALIGN(4);
 .bss : {
  __bss_start = .;
  *(.bss*)
  . = ALIGN(8);
  __bss_end = .;
 } > mem
 _end = .;
}
