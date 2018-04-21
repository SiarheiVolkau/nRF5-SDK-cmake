#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

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
