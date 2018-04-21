#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-drv-clock-name "Nordic Clock driver")
set(nrf-drv-common-name "Nordic Common drivers")

list(APPEND NRF5_LIB_LIST
	nrf-drv-clock
	nrf-drv-common
)

check_dependency(nrf-drv-clock nrf-drv-common)
check_dependency(nrf-drv-clock nrf-utils)
