#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (nrf-atomic-fifo IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-atomic-fifo)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/atomic_fifo/nrf_atfifo.c
	)
endif()

if (nrf-balloc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-balloc)
	add_definitions(-DNRF_BALLOC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
	)
endif()

if (nrf-bsp IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-bsp)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_nfc.c
	)
endif()

if (nrf-bsp-simple IN_LIST NRF5_MODULES AND NOT(nrf-bsp IN_LIST NRF5_MODULES))
	print_lib_usage(nrf-bsp-simple)
	add_definitions(-DBSP_SIMPLE)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
	)
endif()

if (nrf-bsp-btn IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-bsp-btn)
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(WARNING "nrf-bsp-btn library requires enabled Softdevice -- skipped")
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ant.c
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ble.c
		)
	endif()
endif()

if (nrf-button IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-button)
	add_definitions(-DBUTTON_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/button/app_button.c
	)
endif()

if (nrf-block-dev-empty IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-block-dev-empty)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/block_dev/empty/nrf_block_dev_empty.c
	)
endif()

if (nrf-block-dev-qspi IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "QSPI library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-block-dev-qspi)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/block_dev/qspi/nrf_block_dev_qspi.c
			${NRF5_SDK_ROOT}/components/libraries/block_dev/qspi/nrf_serial_flash_params.c
		)
	endif()
endif()

if (nrf-block-dev-ram IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-block-dev-ram)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/block_dev/ram/nrf_block_dev_ram.c
	)
endif()

if (nrf-block-dev-sdc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-block-dev-sdc)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/block_dev/sdc/nrf_block_dev_sdc.c
	)
endif()

if (nrf-cli IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-cli)
	add_definitions(-DNRF_CLI_ENABLED=1)
	add_definitions(-DNRF_CLI_ECHO_STATUS=1)
	add_definitions(-DNRF_CLI_HISTORY_ENABLED=1)
	add_definitions(-DNRF_CLI_VT100_COLORS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/nrf_cli.c
	)
endif()

if (nrf-cli-ble-uart IN_LIST NRF5_MODULES)
	# TODO check softdevice provides BLE functionality
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(WARNING "nrf-cli-ble-uart backend requires enabled Softdevice -- skipped")
	else()
		print_lib_usage(nrf-cli-ble-uart)
		add_definitions(-DNRF_CLI_BLE_UART_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/cli/ble_uart/nrf_cli_ble_uart.c
		)
	endif()
endif()

if (nrf-cli-cdc-acm IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-cli-cdc-acm)
		add_definitions(-DNRF_CLI_CDC_ACM_ENABLED=1)
		add_definitions(-DNRF_CLI_CDC_ACM_COMM_EPIN=NRF_DRV_USBD_EPIN2)
		add_definitions(-DNRF_CLI_CDC_ACM_DATA_EPIN=NRF_DRV_USBD_EPIN1)
		add_definitions(-DNRF_CLI_CDC_ACM_DATA_EPOUT=NRF_DRV_USBD_EPOUT1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/cli/cdc_acm/nrf_cli_cdc_acm.c
		)
	endif()
endif()

if (nrf-cli-rtt IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-cli-rtt)
	add_definitions(-DNRF_CLI_RTT_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/rtt/nrf_cli_rtt.c
	)
endif()

if (nrf-cli-uart IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-cli-uart)
	add_definitions(-DNRF_CLI_UART_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/uart/nrf_cli_uart.c
	)
endif()

if (nrf-crc16 IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-crc16)
	add_definitions(-DCRC16_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/crc16/crc16.c
	)
endif()

if (nrf-crc32 IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-crc32)
	add_definitions(-DCRC32_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/crc32/crc32.c
	)
endif()

if (nrf-csense IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-csense)
	add_definitions(-DNRF_CSENSE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/csense/nrf_csense.c
	)
endif()

if (nrf-drv-csense IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-drv-csense)
	add_definitions(-DNRF_DRV_CSENSE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/csense_drv/nrf_drv_csense.c
	)
endif()

if (nrf-ecc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ecc)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/ecc/ecc.c
	)
endif()

if (nrf-fds IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-fds)
	add_definitions(-DFDS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/fds/fds.c
	)
endif()

if (nrf-fifo IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-fifo)
	add_definitions(-DAPP_FIFO_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/fifo/app_fifo.c
	)
endif()

if (nrf-fstorage IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-fstorage)
	add_definitions(-DNRF_FSTORAGE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/fstorage/nrf_fstorage.c
	)
endif()

if (nrf-fstorage-sd IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-fstorage-sd)
	add_definitions(-DFDS_BACKEND=NRF_FSTORAGE_SD)
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(FATAL_ERROR "nrf-fstorage-sd can't be used without Softdevice")
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/fstorage/nrf_fstorage_sd.c
		)
	endif()
endif()

if (nrf-fstorage-nvmc IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-fstorage-nvmc)
	add_definitions(-DFDS_BACKEND=NRF_FSTORAGE_NVMC)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/fstorage/nrf_fstorage_nvmc.c
	)
endif()

if (nrf-gfx IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-gfx)
	add_definitions(-DNRF_GFX_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/gfx/nrf_gfx.c
	)
endif()

if (nrf-hardfault IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-hardfault)
	add_definitions(-DHARDFAULT_HANDLER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/hardfault/hardfault_implementation.c
	)
	if (NRF5_TARGET MATCHES "nRF52")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/hardfault/nrf52/handler/hardfault_handler_gcc.c
		)
	elseif(NRF5_TARGET MATCHES "nRF51")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/hardfault/nrf51/handler/hardfault_handler_gcc.c
		)
	endif()
endif()

if (nrf-led-softblink IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-led-softblink)
	add_definitions(-DLED_SOFTBLINK_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/led_softblink/led_softblink.c
	)
endif()

if (nrf-log IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-log)
	add_definitions(-DNRF_LOG_ENABLED=1)
	add_definitions(-DNRF_LOG_USES_COLORS=1)

	# workaround for bug in NRF_LOG_PUSH implementation
	# fixed in SDK 15.0.0
	add_definitions(-DNRF_LOG_DEFERRED=0)

	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_frontend.c
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_str_formatter.c
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_default_backends.c
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_backend_serial.c
	)
endif()

if (nrf-log-rtt IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-log-rtt)
	add_definitions(-DNRF_LOG_BACKEND_RTT_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_backend_rtt.c
	)
endif()

if (nrf-log-uart IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-log-uart)
	add_definitions(-DNRF_LOG_BACKEND_UART_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_log/src/nrf_log_backend_uart.c
	)
	if (NOT (nrf-cli-uart IN_LIST NRF5_MODULES))
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/cli/uart/nrf_cli_uart.c
		)
	endif()
endif()

if (nrf-low-power-pwm IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-low-power-pwm)
	add_definitions(-DLOW_POWER_PWM_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/low_power_pwm/low_power_pwm.c
	)
endif()

if (nrf-memobj IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-memobj)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_memobj/nrf_memobj.c
	)
endif()

if (nrf-queue IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-queue)
	add_definitions(-DNRF_QUEUE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/queue/nrf_queue.c
	)
endif()

if (nrf-pwm IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-pwm)
	add_definitions(-DAPP_PWM_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/pwm/app_pwm.c
	)
endif()

if (nrf-pwr-mgmt IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-pwr-mgmt)
	add_definitions(-DNRF_PWR_MGMT_ENABLED=1)
	add_definitions(-DAPP_SHUTDOWN_HANDLER_PRIORITY=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c
	)
	if (nrf-scheduler IN_LIST NRF5_MODULES)
		add_definitions(-DNRF_PWR_MGMT_CONFIG_USE_SCHEDULER=1)
	endif()
	if (NRF5_TARGET MATCHES "nRF52810")
		add_definitions(-DNRF_PWR_MGMT_CONFIG_FPU_SUPPORT_ENABLED=0)
	else()
		add_definitions(-DNRF_PWR_MGMT_CONFIG_FPU_SUPPORT_ENABLED=1)
	endif()
endif()

if (nrf-ringbuf IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ringbuf)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_ringbuf/nrf_ringbuf.c
	)
endif()

if (nrf-scheduler IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-scheduler)
	add_definitions(-DAPP_SCHEDULER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/scheduler/app_scheduler.c
	)
endif()

if (nrf-sdcard IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-sdcard)
	add_definitions(-DAPP_SDCARD_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/sdcard/app_sdcard.c
	)
endif()

if (nrf-section-vars IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-section-vars)
	add_definitions(-DNRF_SECTION_ITER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_section_vars/nrf_section_iter.c
	)
endif()

if (nrf-sensorsim IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-sensorsim)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/sensorsim/sensorsim.c
	)
endif()

if (nrf-serial IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-serial)
	add_definitions(-DNRF_SERIAL_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/serial/nrf_serial.c
	)
endif()

if (nrf-simple-timer IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-simple-timer)
	add_definitions(-DSIMPLE_TIMER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/simple_timer/app_simple_timer.c
	)
endif()

if (nrf-spi-mngr IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-spi-mngr)
	add_definitions(-DNRF_SPI_MNGR_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/spi_mngr/nrf_spi_mngr.c
	)
endif()

if (nrf-strerror IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-strerror)
	add_definitions(-DNRF_STRERROR_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/strerror/nrf_strerror.c
	)
endif()

if (nrf-timer IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-timer)
	add_definitions(-DAPP_TIMER_ENABLED=1)
	if (freertos IN_LIST NRF5_MODULES)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_freertos.c
		)
	elseif (rtx IN_LIST NRF5_MODULES)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_rtx.c
		)
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer.c
		)
	endif()
endif()

if (nrf-uart IN_LIST NRF5_MODULES)
	add_definitions(-DAPP_UART_ENABLED=1)
	if (NOT (nrf-uart-fifo IN_LIST NRF5_MODULES))
		print_lib_usage(nrf-uart)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/uart/app_uart.c
		)
	endif()
endif()

if (nrf-uart-fifo IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-uart-fifo)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/uart/app_uart_fifo.c
	)
endif()

if (nrf-uart-retarget IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-uart-retarget)
	add_definitions(-DRETARGET_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/uart/retarget.c
	)
endif()

if (nrf-usbd IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-usbd)
		add_definitions(-DAPP_USBD_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd.c
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd_core.c
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd_string_desc.c
		)
	endif()
endif()

if (nrf-usbd-class-audio IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-usbd-class-audio)
		add_definitions(-DAPP_USBD_CLASS_AUDIO_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/audio/app_usbd_audio.c
		)
	endif()
endif()

if (nrf-usbd-class-cdc IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-usbd-class-cdc)
		add_definitions(-DAPP_USBD_CLASS_CDC_ACM_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.c
		)
	endif()
endif()

if (nrf-usbd-class-hid IN_LIST NRF5_MODULES)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		print_lib_usage(nrf-usbd-class-hid)
		add_definitions(-DAPP_USBD_CLASS_HID_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/hid/app_usbd_hid.c
		)
	endif()
endif()

if (nrf-utils IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-utils)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/util/app_error.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_error_weak.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_util_platform.c
		${NRF5_SDK_ROOT}/components/libraries/util/nrf_assert.c
		${NRF5_SDK_ROOT}/components/libraries/util/sdk_mapped_flags.c
	)
endif()
