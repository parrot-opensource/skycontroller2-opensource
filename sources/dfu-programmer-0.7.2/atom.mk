LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := dfu-programmer
LOCAL_DESCRIPTION := DFU Programmer tool for ATxmega update
LOCAL_LIBRARIES := libusb_1_0
LOCAL_CATEGORY_PATH := utils

include $(BUILD_AUTOTOOLS)
