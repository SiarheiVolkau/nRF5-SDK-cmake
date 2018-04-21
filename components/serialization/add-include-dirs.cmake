#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/application/codecs/ant/serializers
	${CMAKE_CURRENT_LIST_DIR}/application/codecs/ble/serializers
	${CMAKE_CURRENT_LIST_DIR}/application/codecs/common
	${CMAKE_CURRENT_LIST_DIR}/application/hal
	${CMAKE_CURRENT_LIST_DIR}/application/transport

	${CMAKE_CURRENT_LIST_DIR}/common
	${CMAKE_CURRENT_LIST_DIR}/common/struct_ser/ant
	${CMAKE_CURRENT_LIST_DIR}/common/struct_ser/ble
	${CMAKE_CURRENT_LIST_DIR}/common/transport
	${CMAKE_CURRENT_LIST_DIR}/common/transport/ser_phy/
	${CMAKE_CURRENT_LIST_DIR}/common/transport/ser_phy/config

	${CMAKE_CURRENT_LIST_DIR}/connectivity
	${CMAKE_CURRENT_LIST_DIR}/connectivity/codecs/ant/middleware
	${CMAKE_CURRENT_LIST_DIR}/connectivity/codecs/ant/serializers
	${CMAKE_CURRENT_LIST_DIR}/connectivity/codecs/ble/middleware
	${CMAKE_CURRENT_LIST_DIR}/connectivity/codecs/ble/serializers
	${CMAKE_CURRENT_LIST_DIR}/connectivity/codecs/common
	${CMAKE_CURRENT_LIST_DIR}/connectivity/hal
)
