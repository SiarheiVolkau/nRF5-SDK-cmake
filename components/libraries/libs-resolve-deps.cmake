#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-balloc-name "Nordic Block Allocator library")
set(nrf-bsp-name "Nordic BSP library")
set(nrf-bsp-simple-name "Nordic Simplified BSP library")
set(nrf-bsp-btn-name "Nordic BSP for BLE/ANT buttons library")
set(nrf-button-name "Nordic Buttons library")
set(nrf-cli-name "Nordic Commandline Interface library")
set(nrf-cli-ble-uart-name "Nordic CLI UART over BLE backend")
set(nrf-cli-cdc-acm-name "Nordic CLI CDC ACM (USB) backend")
set(nrf-cli-rtt-name "Nordic CLI over Segger RTT backend")
set(nrf-cli-uart-name "Nordic CLI over UART backend")
set(nrf-memobj-name "Nordic Memory object module")
set(nrf-queue-name "Nordic Queue module")
set(nrf-pwr-mgmt-name "Nordic Power Management module")
set(nrf-ringbuf-name "Nordic Ring buffer module")
set(nrf-scheduler-name "Nordic Scheduler library")
set(nrf-section-vars-name "Nordic Section Variables library")
set(nrf-timer-name "Nordic Timer library")
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
	nrf-balloc
	nrf-bsp
	nrf-bsp-simple
	nrf-bsp-btn
	nrf-button
	nrf-cli
	nrf-cli-ble-uart
	nrf-cli-cdc-acm
	nrf-cli-rtt
	nrf-cli-uart
	nrf-memobj
	nrf-queue
	nrf-pwr-mgmt
	nrf-ringbuf
	nrf-scheduler
	nrf-section-vars
	nrf-timer
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
check_dependency(nrf-memobj nrf-balloc)
check_dependency(nrf-pwr-mgmt nrf-drv-power)
check_dependency(nrf-usbd-class-audio nrf-usbd)
check_dependency(nrf-usbd-class-cdc nrf-usbd)
check_dependency(nrf-usbd-class-hid-generic nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid-kbd nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid-mouse nrf-usbd-class-hid)
check_dependency(nrf-usbd-class-hid nrf-usbd)
check_dependency(nrf-usbd-class-msc nrf-usbd)
check_dependency(nrf-usbd nrf-drv-usbd)
