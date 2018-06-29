#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " fatfs ")
	print_lib_usage(fatfs)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/external/fatfs/port/diskio_blkdev.c
		${NRF5_SDK_ROOT}/external/fatfs/src/ff.c
		${NRF5_SDK_ROOT}/external/fatfs/src/option/unicode.c
	)
endif()

if (NRF5_LIBS MATCHES " font-orkney ")
	print_lib_usage(font-orkney)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/external/thedotfactory_fonts/orkney8pts.c
		${NRF5_SDK_ROOT}/external/thedotfactory_fonts/orkney24pts.c
	)
endif()

if (NRF5_LIBS MATCHES " freertos ")
	print_lib_usage(freertos)
	add_definitions(-DFREERTOS)
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

if (NRF5_LIBS MATCHES " nrf-fprintf ")
	print_lib_usage(nrf-fprintf)
	add_definitions(-DNRF_FPRINTF_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/external/fprintf/nrf_fprintf.c
		${NRF5_SDK_ROOT}/external/fprintf/nrf_fprintf_format.c
	)
endif()

if (NRF5_LIBS MATCHES " segger-rtt ")
	print_lib_usage(segger-rtt)
	add_definitions(-DSEGGER_RTT_CONFIG_DEFAULT_MODE=0)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/external/segger_rtt/SEGGER_RTT.c
	)
endif()

if (NRF5_LIBS MATCHES " micro-ecc ")
	print_lib_usage(micro-ecc)

	if (NOT EXISTS ${NRF5_SDK_ROOT}/external/micro-ecc/nrf52hf_armgcc/armgcc/micro_ecc_lib_nrf52.a)
		message(STATUS "micro ecc not built yet. Executing external clone & build script...")
		execute_process(
			COMMAND sh ${NRF5_SDK_ROOT}/external/micro-ecc/build_all.sh
			WORKING_DIRECTORY ${NRF5_SDK_ROOT}/external/micro-ecc/
		)
	endif()
	if (NRF5_TARGET MATCHES "nRF52840" OR NRF5_TARGET MATCHES "nRF52832")
		set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES}
			${NRF5_SDK_ROOT}/external/micro-ecc/nrf52hf_armgcc/armgcc/micro_ecc_lib_nrf52.a
		)
	elseif (NRF5_TARGET MATCHES "nRF52810")
		set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES}
			${NRF5_SDK_ROOT}/external/micro-ecc/nrf52nf_armgcc/armgcc/micro_ecc_lib_nrf52.a
		)
	elseif (NRF5_TARGET MATCHES "nRF51")
		set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES}
			${NRF5_SDK_ROOT}/external/micro-ecc/nrf51_armgcc/armgcc/micro_ecc_lib_nrf51.a
		)
	endif()
endif()
