#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(fatfs-name "FatFS libary")
set(font-orkney-name "Orkney font (8pt & 24pt) library")
set(freertos-name "FreeRTOS")
set(micro-ecc-name "Micro ECC library")
set(nrf-fprintf-name "Nordic fprintf like function")
set(segger-rtt-name "Segger RTT library")

list(APPEND NRF5_MODULES_LIST
	fatfs
	font-orkney
	freertos
	micro-ecc
	nrf-fprintf
	segger-rtt
)

check_dependency(freertos nrf-drv-clock)
check_dependency(freertos nrf-drv-rtc)
check_dependency(segger-rtt nrf-utils)
