/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00023000, LENGTH = 0x1d000
  RAM (rwx) :  ORIGIN = 0x20003000, LENGTH = 0x05000
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
