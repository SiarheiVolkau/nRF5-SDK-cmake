#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (nrf-drv-clock IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-clock)
	add_definitions(-DCLOCK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/clock/nrf_drv_clock.c
	)
endif()

if (nrf-drv-common IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-common)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/common/nrf_drv_common.c
	)
endif()

if (nrf-drv-gpiote IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-gpiote)
	add_definitions(-DGPIOTE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/gpiote/nrf_drv_gpiote.c
	)
endif()

if (nrf-drv-i2s IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-i2s)
	add_definitions(-DI2S_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/i2s/nrf_drv_i2s.c
	)
endif()

if (nrf-drv-lpcomp IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-lpcomp)
	add_definitions(-DLPCOMP_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/lpcomp/nrf_drv_lpcomp.c
	)
endif()

if (nrf-drv-nvmc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-nvmc)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/hal/nrf_nvmc.c
	)
endif()

if (nrf-drv-ppi IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-ppi)
	add_definitions(-DPPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/ppi/nrf_drv_ppi.c
	)
endif()

if (nrf-drv-pwm IN_LIST NRF5_MODULES)
	print_lib_usage(nrfff14764c624f43bfd2d5585e627c4c6cdf0c551f-drv-pwm)
	add_definitions(-DPWM_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/pwm/nrf_drv_pwm.c
	)
endif()

if (nrf-drv-qdec IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-qdec)
	add_definitions(-DQDEC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/qdec/nrf_drv_qdec.c
	)
endif()

if (nrf-drv-qspi IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-qspi)
	add_definitions(-DQSPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/qspi/nrf_drv_qspi.c
	)
endif()

if (nrf-drv-power IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-power)
	add_definitions(-DPOWER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/power/nrf_drv_power.c
	)
endif()

if (nrf-drv-rng IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-rng)
	add_definitions(-DRNG_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/rng/nrf_drv_rng.c
	)
endif()

if (nrf-drv-rtc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-rtc)
	add_definitions(-DRTC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/rtc/nrf_drv_rtc.c
	)
endif()

if (nrf-drv-saadc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-saadc)
	add_definitions(-DSAADC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/saadc/nrf_drv_saadc.c
		${NRF5_SDK_ROOT}/components/drivers_nrf/hal/nrf_saadc.c
	)
endif()

if (nrf-drv-spi-master IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-spi-master)
	add_definitions(-DSPI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/spi_master/nrf_drv_spi.c
	)
endif()

if (nrf-drv-spi-slave IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-spi-slave)
	add_definitions(-DSPIS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/spi_slave/nrf_drv_spis.c
	)
endif()

if (nrf-drv-systick IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-systick)
	add_definitions(-DSYSTICK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/systick/nrf_drv_systick.c
	)
endif()

if (nrf-drv-timer IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-timer)
	add_definitions(-DTIMER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/timer/nrf_drv_timer.c
	)
endif()

if (nrf-drv-twi-master IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-twi-master)
	add_definitions(-DTWI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/twi_master/nrf_drv_twi.c
	)
endif()

if (nrf-drv-twi-slave IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-twi-slave)
	add_definitions(-DTWIS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/twis_slave/nrf_drv_twis.c
	)
endif()

if (nrf-drv-uart IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-uart)
	add_definitions(-DUART_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/uart/nrf_drv_uart.c
	)
endif()

if (nrf-drv-usbd IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-usbd)
	add_definitions(-DUSBD_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/drivers_nrf/usbd/nrf_drv_usbd.c
	)
endif()
