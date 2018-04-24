#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-atomic-fifo-name "Nordic Atomic FIFO library")
set(nrf-balloc-name "Nordic Block Allocator library")
set(nrf-block-dev-empty-name "Nordic Empty Block Device library")
set(nrf-block-dev-qspi-name "Nordic QSPI Block Device library")
set(nrf-block-dev-ram-name "Nordic RAM Block Device library")
set(nrf-block-dev-sdc-name "Nordic SDC Block Device library")
set(nrf-bsp-name "Nordic BSP library")
set(nrf-bsp-simple-name "Nordic Simplified BSP library")
set(nrf-bsp-btn-name "Nordic BSP for BLE/ANT buttons library")
set(nrf-button-name "Nordic Buttons library")
set(nrf-cli-name "Nordic Commandline Interface library")
set(nrf-cli-ble-uart-name "Nordic CLI UART over BLE backend")
set(nrf-cli-cdc-acm-name "Nordic CLI CDC ACM (USB) backend")
set(nrf-cli-rtt-name "Nordic CLI over Segger RTT backend")
set(nrf-cli-uart-name "Nordic CLI over UART backend")
set(nrf-csense-name "Nordic Capacitive sensor library")
set(nrf-drv-csense-name "Nordic Capacitive sensor low-level library")
set(nrf-fds-name "Nordic Flash Data Storage library")
set(nrf-fifo-name "Nordic FIFO implementation")
set(nrf-fstorage-name "Nordic Flash Storage library")
set(nrf-fstorage-nvmc-name "Nordic Flash Storage NVMC backend")
set(nrf-fstorage-sd-name "Nordic Flash Storage Softdevice backend")
set(nrf-led-softblink-name "Nordic LED smooth blink library")
set(nrf-log-name "Nordic Logging library")
set(nrf-log-rtt-name "Nordic Logging to RTT backend")
set(nrf-log-uart-name "Nordic Logging to UART backend")
set(nrf-low-power-pwm-name "Nordic Low Power PWM impl. using timer and gpio library")
set(nrf-memobj-name "Nordic Memory object module")
set(nrf-queue-name "Nordic Queue module")
set(nrf-pwr-mgmt-name "Nordic Power Management module")
set(nrf-ringbuf-name "Nordic Ring buffer module")
set(nrf-scheduler-name "Nordic Scheduler library")
set(nrf-sdcard-name "Nordic SD/MMC library")
set(nrf-section-vars-name "Nordic Section Variables library")
set(nrf-strerror-name "Nordic error code to string converter")
set(nrf-timer-name "Nordic Timer library")
set(nrf-uart-name "Nordic UART library")
set(nrf-uart-fifo-name "Nordic UART library (FIFO based)")
set(nrf-uart-retarget-name "Nordic UART Retarget functionality")
set(nrf-usbd-name "Nordic USB Device library")
set(nrf-usbd-class-audio-name "Nordic USB Audio class")
set(nrf-usbd-class-cdc-name "Nordic USB CDC class")
set(nrf-usbd-class-hid-name "Nordic USB HID class")
set(nrf-usbd-class-hid-generic-name "Nordic USB HID Generic class")
set(nrf-usbd-class-hid-kbd-name "Nordic USB HID Keyboard class")
set(nrf-usbd-class-hid-mouse-name "Nordic USB HID Mouse class")
set(nrf-usbd-class-msc-name "Nordic USB MSC class")
set(nrf-utils-name "Nordic Utilities library")

list(APPEND NRF5_LIB_LIST
	nrf-atomic-fifo
	nrf-balloc
	nrf-block-dev-empty
	nrf-block-dev-qspi
	nrf-block-dev-ram
	nrf-block-dev-sdc
	nrf-bsp
	nrf-bsp-simple
	nrf-bsp-btn
	nrf-button
	nrf-cli
	nrf-cli-ble-uart
	nrf-cli-cdc-acm
	nrf-cli-rtt
	nrf-cli-uart
	nrf-csense
	nrf-drv-csense
	nrf-fds
	nrf-fifo
	nrf-fstorage
	nrf-fstorage-nvmc
	nrf-fstorage-sd
	nrf-led-softblink
	nrf-log
	nrf-log-rtt
	nrf-log-uart
	nrf-low-power-pwm
	nrf-memobj
	nrf-queue
	nrf-pwr-mgmt
	nrf-ringbuf
	nrf-scheduler
	nrf-sdcard
	nrf-section-vars
	nrf-strerror
	nrf-timer
	nrf-uart
	nrf-uart-fifo
	nrf-uart-retarget
	nrf-usbd
	nrf-usbd-class-audio
	nrf-usbd-class-cdc
	nrf-usbd-class-hid
	nrf-usbd-class-hid-generic
	nrf-usbd-class-hid-kbd
	nrf-usbd-class-hid-mouse
	nrf-usbd-class-msc
	nrf-utils
)

if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-section-vars "))
#	message(STATUS "Adding dependency `${nrf-section-vars-name}`, required by Softdevice")
	add_dependency(nrf-section-vars)
endif()
if (DEFINED NRF5_SOFTDEVICE AND NOT(NRF5_LIBS MATCHES " nrf-utils "))
#	message(STATUS "Adding dependency `${nrf-utils-name}`, required by Softdevice")
	add_dependency(nrf-utils)
endif()

check_dependency(nrf-balloc nrf-utils)
check_dependency(nrf-block-dev-sdc nrf-sdcard)
check_dependency(nrf-block-dev-qspi nrf-drv-qspi)
check_dependency(nrf-bsp nrf-timer)
check_dependency(nrf-bsp nrf-button)
check_dependency(nrf-bsp-btn nrf-bsp)
check_dependency(nrf-button nrf-drv-gpiote)
check_dependency(nrf-cli nrf-fprintf)
check_dependency(nrf-cli nrf-memobj)
check_dependency(nrf-cli-ble-uart nrf-cli)
check_dependency(nrf-cli-cdc-acm nrf-cli)
check_dependency(nrf-cli-cdc-acm nrf-queue)
check_dependency(nrf-cli-cdc-acm nrf-usbd-class-cdc)
check_dependency(nrf-cli-rtt nrf-cli)
check_dependency(nrf-cli-rtt segger-rtt)
check_dependency(nrf-cli-uart nrf-cli)
check_dependency(nrf-cli-uart nrf-ringbuf)
check_dependency(nrf-cli-uart nrf-drv-uart)
check_dependency(nrf-cli-uart nrf-timer)
check_dependency(nrf-csense nrf-drv-csense)
check_dependency(nrf-drv-csense nrf-drv-saadc)
check_dependency(nrf-drv-csense nrf-drv-clock)
check_dependency(nrf-fds nrf-fstorage)
check_dependency(nrf-fstorage nrf-atomic-fifo)
check_dependency(nrf-fstorage-nvmc nrf-drv-nvmc)
check_dependency(nrf-led-softblink nrf-low-power-pwm)
check_dependency(nrf-log-rtt nrf-log)
check_dependency(nrf-log-rtt segger-rtt)
check_dependency(nrf-log-uart nrf-log)
check_dependency(nrf-log-uart nrf-drv-uart)
check_dependency(nrf-low-power-pwm nrf-timer)
check_dependency(nrf-low-power-pwm nrf-utils)
check_dependency(nrf-memobj nrf-balloc)
check_dependency(nrf-pwr-mgmt nrf-drv-power)
check_dependency(nrf-sdcard nrf-drv-spi-master)
check_dependency(nrf-timer nrf-utils)
check_dependency(nrf-uart nrf-drv-uart)
check_dependency(nrf-uart-fifo nrf-uart)
check_dependency(nrf-uart-fifo nrf-fifo)
check_dependency(nrf-uart-retarget nrf-uart)
check_dependency(nrf-usbd-class-audio nrf-usbd)
check_dependency(nrf-usbd-class-cdc nrf-usbd)
check_dependency(nrf-usbd-class-hid-generic nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid-kbd nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid-mouse nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid nrf-usbd)
check_dependency(nrf-usbd-class-msc nrf-usbd)
check_dependency(nrf-usbd nrf-drv-usbd)

if (NRF5_LIBS MATCHES " nrf-log ")
	check_dependency(nrf-log nrf-cli)
	check_dependency(nrf-cli nrf-queue)
	check_dependency(nrf-utils nrf-strerror)
endif()

if (NRF5_LIBS MATCHES " nrf-fstorage ")
	if (DEFINED NRF5_SOFTDEVICE)
		add_dependency(nrf-fstorage-sd)
	else()
		add_dependency(nrf-fstorage-nvmc)
	endif()
endif()
