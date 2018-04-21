#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-drv-clock ")
	print_lib_usage(nrf-drv-clock)
	add_definitions(-DCLOCK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/clock/nrf_drv_clock.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-common ")
	print_lib_usage(nrf-drv-common)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/common/nrf_drv_common.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-rtc ")
	print_lib_usage(nrf-drv-rtc)
	add_definitions(-DRTC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/rtc/nrf_drv_rtc.c
	)
endif()
