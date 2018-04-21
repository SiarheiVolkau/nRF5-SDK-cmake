#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include(${CMAKE_CURRENT_LIST_DIR}/ant_profiles/add-include-dirs.cmake)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/ant_channel_config
	${CMAKE_CURRENT_LIST_DIR}/ant_encryption
	${CMAKE_CURRENT_LIST_DIR}/ant_fs
	${CMAKE_CURRENT_LIST_DIR}/ant_key_manager
	${CMAKE_CURRENT_LIST_DIR}/ant_key_manager/config
	${CMAKE_CURRENT_LIST_DIR}/ant_search_config
	${CMAKE_CURRENT_LIST_DIR}/ant_stack_config
	${CMAKE_CURRENT_LIST_DIR}/ant_stack_config/config
	${CMAKE_CURRENT_LIST_DIR}/ant_state_indicator
)
