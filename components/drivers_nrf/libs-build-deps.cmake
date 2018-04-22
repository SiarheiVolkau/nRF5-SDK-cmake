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

if (NRF5_LIBS MATCHES " nrf-drv-gpiote ")
	print_lib_usage(nrf-drv-gpiote)
	add_definitions(-DGPIOTE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/gpiote/nrf_drv_gpiote.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-power ")
	print_lib_usage(nrf-drv-power)
	add_definitions(-DPOWER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/power/nrf_drv_power.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-rtc ")
	print_lib_usage(nrf-drv-rtc)
	add_definitions(-DRTC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/rtc/nrf_drv_rtc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-saadc ")
	print_lib_usage(nrf-drv-saadc)
	add_definitions(-DSAADC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/saadc/nrf_drv_saadc.c
		${NRF5_SDK_ROOT}/components/drivers_nrf/hal/nrf_saadc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-systick ")
	print_lib_usage(nrf-drv-systick)
	add_definitions(-DSYSTICK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/systick/nrf_drv_systick.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-spi-master ")
	print_lib_usage(nrf-drv-spi-master)
	add_definitions(-DSPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/spi_master/nrf_drv_spi.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-uart ")
	print_lib_usage(nrf-drv-uart)
	add_definitions(-DUART_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/uart/nrf_drv_uart.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-usbd ")
	print_lib_usage(nrf-drv-usbd)
	add_definitions(-DUSBD_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/usbd/nrf_drv_usbd.c
	)
endif()
