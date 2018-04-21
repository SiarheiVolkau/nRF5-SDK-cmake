#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(dirs_list "")
list(APPEND dirs_list
	ant_bpwr
	ant_bsc
	ant_hrm
	ant_sdm
)

foreach(dir ${dirs_list})
include_directories(
	${CMAKE_CURRENT_LIST_DIR}/${dir}
	${CMAKE_CURRENT_LIST_DIR}/${dir}/pages
	${CMAKE_CURRENT_LIST_DIR}/${dir}/simulator
	${CMAKE_CURRENT_LIST_DIR}/${dir}/utils
)
endforeach(dir)
include_directories(
	${CMAKE_CURRENT_LIST_DIR}/ant_common/ant_request_controller
	${CMAKE_CURRENT_LIST_DIR}/ant_common/pages
)
