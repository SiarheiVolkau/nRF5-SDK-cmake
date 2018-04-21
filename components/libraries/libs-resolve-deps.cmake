#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-bsp-name "Nordic BSP library")
set(nrf-bsp-simple-name "Nordic Simplified BSP library")
set(nrf-bsp-btn-name "Nordic BSP for BLE/ANT buttons library")
set(nrf-button-name "Nordic Buttons library")
set(nrf-scheduler-name "Nordic Scheduler library")
set(nrf-section-vars-name "Nordic Section Variables library")
set(nrf-timer-name "Nordic Timer library")
set(nrf-utils-name "Nordic Utilities library")

list(APPEND NRF5_LIB_LIST
	nrf-bsp
	nrf-bsp-simple
	nrf-bsp-btn
	nrf-button
	nrf-scheduler
	nrf-section-vars
	nrf-timer
	nrf-utils
)

if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-section-vars "))
#	message(STATUS "Adding dependency `${nrf-section-vars-name}`, required by Softdevice")
	add_dependency(nrf-section-vars)
endif()
if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-utils "))
#	message(STATUS "Adding dependency `${nrf-utils-name}`, required by Softdevice")
	add_dependency(nrf-utils)
endif()

check_dependency(nrf-bsp nrf-timer)
check_dependency(nrf-bsp nrf-button)
check_dependency(nrf-bsp-btn nrf-bsp)
check_dependency(nrf-button nrf-drv-gpiote)
