#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-nfc-ndef ")
	print_lib_usage(nrf-nfc-ndef)

	add_definitions(-DNFC_NDEF_MSG_ENABLED=1)
	add_definitions(-DNFC_NDEF_RECORD_ENABLED=1)
	add_definitions(-DNFC_NDEF_LAUNCHAPP_MSG_ENABLED=1)
	add_definitions(-DNFC_NDEF_LAUNCHAPP_REC_ENABLED=1)
	add_definitions(-DNFC_NDEF_MSG_PARSER_ENABLED=1)
	add_definitions(-DNFC_NDEF_RECORD_PARSER_ENABLED=1)
	add_definitions(-DNFC_NDEF_TEXT_RECORD_ENABLED=1)
	add_definitions(-DNFC_NDEF_URI_MSG_ENABLED=1)
	add_definitions(-DNFC_NDEF_URI_REC_ENABLED=1)

	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/ndef/generic/message/nfc_ndef_msg.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/generic/record/nfc_ndef_record.c

		${NRF5_SDK_ROOT}/components/nfc/ndef/launchapp/nfc_launchapp_msg.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/launchapp/nfc_launchapp_rec.c

		${NRF5_SDK_ROOT}/components/nfc/ndef/parser/message/nfc_ndef_msg_parser.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/parser/message/nfc_ndef_msg_parser_local.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/parser/record/nfc_ndef_record_parser.c

		${NRF5_SDK_ROOT}/components/nfc/ndef/text/nfc_text_rec.c

		${NRF5_SDK_ROOT}/components/nfc/ndef/uri/nfc_uri_msg.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/uri/nfc_uri_rec.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-nfc-t2t ")
	print_lib_usage(nrf-nfc-t2t)
	add_definitions(-DNFC_T2T_HAL_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/t2t_lib/hal_t2t/hal_nfc_t2t.c
	)
	set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES}
		${NRF5_SDK_ROOT}/components/nfc/t2t_lib/nfc_t2t_lib_gcc.a
	)
endif()

if (NRF5_LIBS MATCHES " nrf-nfc-t4t ")
	print_lib_usage(nrf-nfc-t4t)
	add_definitions(-DNFC_T4T_HAL_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/t4t_lib/hal_t4t/hal_nfc_t4t.c
	)
	set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES}
		${NRF5_SDK_ROOT}/components/nfc/t4t_lib/nfc_t4t_lib_gcc.a
	)
endif()

if (NRF5_LIBS MATCHES " nrf-nfc-t2t-parser ")
	print_lib_usage(nrf-nfc-t2t-parser)
	add_definitions(-DNFC_T2T_PARSER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/t2t_parser/nfc_t2t_parser.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-nfc-t4t-parser ")
	print_lib_usage(nrf-nfc-t4t-parser)
	add_definitions(-DNFC_T4T_APDU_ENABLED=1)
	add_definitions(-DNFC_T4T_CC_FILE_PARSER_ENABLED=1)
	add_definitions(-DNFC_T4T_HL_DETECTION_PROCEDURES_ENABLED=1)
	add_definitions(-DNFC_T4T_TLV_BLOCK_PARSER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/t4t_parser/apdu/nfc_t4t_apdu.c
		${NRF5_SDK_ROOT}/components/nfc/t4t_parser/cc_file/nfc_t4t_cc_file.c
		${NRF5_SDK_ROOT}/components/nfc/t4t_parser/hl_detection_procedure/nfc_t4t_hl_detection_procedures.c
		${NRF5_SDK_ROOT}/components/nfc/t4t_parser/tlv/nfc_t4t_tlv_block.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-nfc-ble-pair ")
	print_lib_usage(nrf-nfc-ble-pair)

	add_definitions(-DNFC_AC_REC_ENABLED=1)
	add_definitions(-DNFC_BLE_OOB_ADVDATA_ENABLED=1)
	add_definitions(-DNFC_BLE_PAIR_LIB_ENABLED=1)
	add_definitions(-DNFC_BLE_PAIR_MSG_ENABLED=1)
	add_definitions(-DNFC_CH_COMMON_ENABLED=1)
	add_definitions(-DNFC_EP_OOB_REC_ENABLED=1)
	add_definitions(-DNFC_HS_REC_ENABLED=1)
	add_definitions(-DNFC_LE_OOB_REC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/nfc/ndef/conn_hand_parser/ac_rec_parser/nfc_ac_rec_parser.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/conn_hand_parser/ble_oob_advdata_parser/nfc_ble_oob_advdata_parser.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/conn_hand_parser/le_oob_rec_parser/nfc_le_oob_rec_parser.c

		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/ac_rec/nfc_ac_rec.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/ble_oob_advdata/nfc_ble_oob_advdata.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/ble_pair_lib/nfc_ble_pair_lib.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/ble_pair_msg/nfc_ble_pair_msg.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/common/nfc_ble_pair_common.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/ep_oob_rec/nfc_ep_oob_rec.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/hs_rec/nfc_hs_rec.c
		${NRF5_SDK_ROOT}/components/nfc/ndef/connection_handover/le_oob_rec/nfc_le_oob_rec.c
	)
endif()

