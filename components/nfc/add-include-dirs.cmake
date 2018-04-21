#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/ndef/conn_hand_parser/ac_rec_parser
	${CMAKE_CURRENT_LIST_DIR}/ndef/conn_hand_parser/ble_oob_advdata_parser
	${CMAKE_CURRENT_LIST_DIR}/ndef/conn_hand_parser/le_oob_rec_parser

	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/ac_rec
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/ble_oob_advdata
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/ble_pair_lib
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/ble_pair_msg
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/common
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/ep_oob_rec
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/hs_rec
	${CMAKE_CURRENT_LIST_DIR}/ndef/connection_handover/le_oob_rec

	${CMAKE_CURRENT_LIST_DIR}/ndef/generic/message
	${CMAKE_CURRENT_LIST_DIR}/ndef/generic/record

	${CMAKE_CURRENT_LIST_DIR}/ndef/launchapp

	${CMAKE_CURRENT_LIST_DIR}/ndef/parser/message
	${CMAKE_CURRENT_LIST_DIR}/ndef/parser/record

	${CMAKE_CURRENT_LIST_DIR}/ndef/text
	${CMAKE_CURRENT_LIST_DIR}/ndef/uri

	${CMAKE_CURRENT_LIST_DIR}/t2t_lib
	${CMAKE_CURRENT_LIST_DIR}/t2t_lib/hal_t2t
	${CMAKE_CURRENT_LIST_DIR}/t2t_parser

	${CMAKE_CURRENT_LIST_DIR}/t4t_lib
	${CMAKE_CURRENT_LIST_DIR}/t4t_lib/hal_t4t
	${CMAKE_CURRENT_LIST_DIR}/t4t_parser/apdu
	${CMAKE_CURRENT_LIST_DIR}/t4t_parser/cc_file
	${CMAKE_CURRENT_LIST_DIR}/t4t_parser/hl_detection_procedure
	${CMAKE_CURRENT_LIST_DIR}/t4t_parser/tlv
)
