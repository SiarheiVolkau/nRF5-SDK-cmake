#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-bsp ")
	print_lib_usage(nrf-bsp)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_nfc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-bsp-simple " AND NOT(NRF5_LIBS MATCHES " nrf-bsp "))
	print_lib_usage(nrf-bsp-simple)
	add_definitions(-DBSP_SIMPLE)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-bsp-btn ")
	print_lib_usage(nrf-bsp-btn)
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(WARNING "nrf-bsp-btn library requires enabled Softdevice -- skipped")
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ant.c
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ble.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-button ")
	print_lib_usage(nrf-button)
	add_definitions(-DBUTTON_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/button/app_button.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-scheduler ")
	print_lib_usage(nrf-scheduler)
	add_definitions(-DAPP_SCHEDULER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/scheduler/app_scheduler.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-section-vars ")
	print_lib_usage(nrf-section-vars)
	add_definitions(-DNRF_SECTION_ITER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_section_vars/nrf_section_iter.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-timer ")
	print_lib_usage(nrf-timer)
	add_definitions(-DAPP_TIMER_ENABLED=1)
	if (NRF5_LIBS MATCHES " freertos ")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_freertos.c
		)
	elseif (NRF5_LIBS MATCHES " rtx ")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_rtx.c
		)
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-utils ")
	print_lib_usage(nrf-utils)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/util/app_error.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_error_weak.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_util_platform.c
		${NRF5_SDK_ROOT}/components/libraries/util/nrf_assert.c
		${NRF5_SDK_ROOT}/components/libraries/util/sdk_mapped_flags.c
	)
endif()
