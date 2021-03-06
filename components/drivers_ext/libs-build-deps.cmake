#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (drv-ili9341 IN_LIST NRF5_MODULES)
	print_lib_usage(drv-ili9341)
	add_definitions(-DILI9341_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_ext/ili9341/ili9341.c
	)
endif()

if (drv-st7735 IN_LIST NRF5_MODULES)
	print_lib_usage(drv-st7735)
	add_definitions(-DST7735_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_ext/st7735/st7735.c
	)
endif()
