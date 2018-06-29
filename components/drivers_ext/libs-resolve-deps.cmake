#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(drv-ili9341-name "Ilitek ILI9341 SPI TFT LCD driver")
set(drv-st7735-name "Sitronix ST7735 SPI TFT LCD driver")

list(APPEND NRF5_MODULES_LIST
	drv-ili9341
	drv-st7735
)
check_dependency(drv-ili9341 nrf-drv-spi-master)
check_dependency(drv-st7735 nrf-drv-spi-master)
