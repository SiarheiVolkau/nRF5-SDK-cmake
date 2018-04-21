#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

file(GLOB children RELATIVE ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_LIST_DIR}/*)
foreach(child ${children})
	if(IS_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${child})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${child})
	endif()
endforeach()

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/tls/mbedtls/tls/config
	${CMAKE_CURRENT_LIST_DIR}/tls/mbedtls/dtls/config
)
