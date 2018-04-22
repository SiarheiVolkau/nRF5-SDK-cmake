#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(freertos-name "FreeRTOS")
set(nrf-fprintf-name "Nordic fprintf like function")
set(segger-rtt-name "Segger RTT library")

list(APPEND NRF5_LIB_LIST
	freertos
	nrf-fprintf
	segger-rtt
)

check_dependency(freertos nrf-drv-clock)
check_dependency(freertos nrf-drv-rtc)
check_dependency(segger-rtt nrf-utils)
