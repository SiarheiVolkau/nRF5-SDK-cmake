/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x23000, LENGTH = 0x1d000
  RAM (rwx) :  ORIGIN = 0x20001368, LENGTH = 0x6c98
  
}

INCLUDE "nrf52_sd_sections.ld"
INCLUDE "nrf52_common.ld"
