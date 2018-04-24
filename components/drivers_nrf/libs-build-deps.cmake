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

if (NRF5_LIBS MATCHES " nrf-drv-i2s ")
	print_lib_usage(nrf-drv-i2s)
	add_definitions(-DI2S_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/i2s/nrf_drv_i2s.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-lpcomp ")
	print_lib_usage(nrf-drv-lpcomp)
	add_definitions(-DLPCOMP_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/lpcomp/nrf_drv_lpcomp.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-nvmc ")
	print_lib_usage(nrf-drv-nvmc)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/hal/nrf_nvmc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-ppi ")
	print_lib_usage(nrf-drv-ppi)
	add_definitions(-DPPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/ppi/nrf_drv_ppi.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-pwm ")
	print_lib_usage(nrf-drv-pwm)
	add_definitions(-DPWM_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/pwm/nrf_drv_pwm.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-qdec ")
	print_lib_usage(nrf-drv-qdec)
	add_definitions(-DQDEC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/qdec/nrf_drv_qdec.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-qspi ")
	print_lib_usage(nrf-drv-qspi)
	add_definitions(-DQSPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/qspi/nrf_drv_qspi.c
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

if (NRF5_LIBS MATCHES " nrf-drv-spi-master ")
	print_lib_usage(nrf-drv-spi-master)
	add_definitions(-DSPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/spi_master/nrf_drv_spi.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-systick ")
	print_lib_usage(nrf-drv-systick)
	add_definitions(-DSYSTICK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/systick/nrf_drv_systick.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-drv-timer ")
	print_lib_usage(nrf-drv-timer)
	add_definitions(-DTIMER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/timer/nrf_drv_timer.c
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
