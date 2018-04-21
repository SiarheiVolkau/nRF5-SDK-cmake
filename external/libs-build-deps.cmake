#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " freertos ")
	print_lib_usage(freertos)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/external/freertos/source/croutine.c
		${NRF5_SDK_ROOT}/external/freertos/source/event_groups.c
		${NRF5_SDK_ROOT}/external/freertos/source/list.c
		${NRF5_SDK_ROOT}/external/freertos/source/queue.c
		${NRF5_SDK_ROOT}/external/freertos/source/tasks.c
		${NRF5_SDK_ROOT}/external/freertos/source/timers.c
		${NRF5_SDK_ROOT}/external/freertos/source/portable/MemMang/heap_3.c
		${NRF5_SDK_ROOT}/external/freertos/portable/CMSIS/nrf52/port_cmsis.c
		${NRF5_SDK_ROOT}/external/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c
		${NRF5_SDK_ROOT}/external/freertos/portable/GCC/nrf52/port.c
	)
endif()
