/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00018000, LENGTH = 0x18000
  RAM (rwx) :  ORIGIN = 0x20002000, LENGTH = 0x04000
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
