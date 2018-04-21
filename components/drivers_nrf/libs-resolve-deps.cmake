#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-drv-clock-name "Nordic Clock driver")
set(nrf-drv-common-name "Nordic Common drivers")
set(nrf-drv-rtc-name "Nordic RTC driver")
set(nrf-drv-systick-name "Nordic System Timer(SysTick) driver")

list(APPEND NRF5_LIB_LIST
	nrf-drv-clock
	nrf-drv-common
	nrf-drv-rtc
	nrf-drv-systick
)

check_dependency(nrf-drv-clock nrf-drv-common)
check_dependency(nrf-drv-clock nrf-utils)
check_dependency(nrf-drv-rtc nrf-drv-common)
