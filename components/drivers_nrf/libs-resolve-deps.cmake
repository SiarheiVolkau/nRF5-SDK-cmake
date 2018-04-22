#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-drv-clock-name "Nordic Clock driver")
set(nrf-drv-common-name "Nordic Common drivers")
set(nrf-drv-gpiote-name "Nordic GPIO driver")
set(nrf-drv-power-name "Nordic Power driver")
set(nrf-drv-rtc-name "Nordic RTC driver")
set(nrf-drv-systick-name "Nordic System Timer(SysTick) driver")
set(nrf-drv-uart-name "Nordic UART driver")
set(nrf-drv-usbd-name "Nordic USB Device driver")

list(APPEND NRF5_LIB_LIST
	nrf-drv-clock
	nrf-drv-common
	nrf-drv-gpiote
	nrf-drv-power
	nrf-drv-rtc
	nrf-drv-systick
	nrf-drv-uart
	nrf-drv-usbd
)

check_dependency(nrf-drv-clock nrf-drv-common)
check_dependency(nrf-drv-clock nrf-utils)
check_dependency(nrf-drv-gpiote nrf-drv-common)
check_dependency(nrf-drv-rtc nrf-drv-common)
check_dependency(nrf-drv-uart nrf-drv-common)
check_dependency(nrf-drv-usbd nrf-drv-common)
check_dependency(nrf-drv-usbd nrf-drv-systick)
