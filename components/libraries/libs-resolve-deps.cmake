#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-scheduler-name "Nordic Scheduler library")
set(nrf-section-vars-name "Nordic Section Variables library")
set(nrf-utils-name "Nordic Utilities library")

list(APPEND NRF5_LIB_LIST
	nrf-scheduler
	nrf-section-vars
	nrf-utils
)

if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-section-vars "))
#	message(WARNING "Adding dependency `${nrf-section-vars-name}`, required by Softdevice")
	add_dependency(nrf-section-vars)
endif()
if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-utils "))
#	message(WARNING "Adding dependency `${nrf-utils-name}`, required by Softdevice")
	add_dependency(nrf-utils)
endif()
