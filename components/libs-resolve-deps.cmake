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
	drivers_nrf
#	experimental_802_15_4
#	iot
	libraries
#	nfc
#	proprietary_rf
#	serialization
)

foreach(dir ${dirs_list})
	include(${CMAKE_CURRENT_LIST_DIR}/${dir}/libs-resolve-deps.cmake)
endforeach(dir)


set(nrf-bsp-name "nRF5 Board Definition")

list(APPEND NRF5_LIB_LIST nrf-bsp)
