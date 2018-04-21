#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

file(GLOB children RELATIVE ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_LIST_DIR}/*)

# nrf_soc_nosd included if softdevice not used
list(REMOVE_ITEM children nrf_soc_nosd)

foreach(child ${children})
	if(IS_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${child})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${child})
	endif()
endforeach()

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/sdio/config
	${CMAKE_CURRENT_LIST_DIR}/twi_master/deprecated/
	${CMAKE_CURRENT_LIST_DIR}/twi_master/deprecated/config
)
