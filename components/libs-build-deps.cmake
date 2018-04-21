#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(dirs_list "")
list(APPEND dirs_list
#	ant
#	ble
#	drivers_ext
#	drivers_nrf
#	experimental_802_15_4
#	iot
	libraries
#	nfc
#	proprietary_rf
#	serialization
)

foreach(dir ${dirs_list})
	include(${CMAKE_CURRENT_LIST_DIR}/${dir}/libs-build-deps.cmake)
endforeach(dir)

if (NRF5_LIBS MATCHES " nrf-bsp ")
	message(STATUS "Using ${nrf-bsp-name} (nrf-bsp)")
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/boards/boards.c
	)
endif()
