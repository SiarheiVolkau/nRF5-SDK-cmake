/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

/* defaults are suitable for all nrf52 */
NRF5_FLASH_START = DEFINED( NRF5_FLASH_START ) ? NRF5_FLASH_START : 0x00000000;
NRF5_FLASH_SIZE = DEFINED( NRF5_FLASH_SIZE ) ? NRF5_FLASH_SIZE : (0x30000 - NRF5_FLASH_START);
NRF5_RAM_START = DEFINED( NRF5_RAM_START ) ? NRF5_RAM_START : 0x20000000;
NRF5_RAM_SIZE = DEFINED( NRF5_RAM_SIZE ) ? NRF5_RAM_SIZE : (0x6000 - (NRF5_RAM_START - 0x20000000));

MEMORY
{
  FLASH (rx) : ORIGIN = NRF5_FLASH_START, LENGTH = NRF5_FLASH_SIZE
  RAM (rwx) :  ORIGIN = NRF5_RAM_START, LENGTH = NRF5_RAM_SIZE
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
