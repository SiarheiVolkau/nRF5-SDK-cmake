#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/api/HAL
	${CMAKE_CURRENT_LIST_DIR}/api/HAL/nrf52_soc
	${CMAKE_CURRENT_LIST_DIR}/api/MAC
	${CMAKE_CURRENT_LIST_DIR}/api/PHY
	${CMAKE_CURRENT_LIST_DIR}/api/RAL
	${CMAKE_CURRENT_LIST_DIR}/api/RAL/nrf52_soc
	${CMAKE_CURRENT_LIST_DIR}/api/SecAL
	${CMAKE_CURRENT_LIST_DIR}/api/SysAL
)
