LOCAL_PATH := $(call my-dir)

###############################################################################
# usbutils
###############################################################################

include $(CLEAR_VARS)

LOCAL_MODULE := usbutils
LOCAL_DESCRIPTION := Various utilities for usb, including lsusb
LOCAL_CATEGORY_PATH := devel

USBUTILS_BUILD_DIR := $(call local-get-build-dir)

LOCAL_LIBRARIES := libusb_1_0

LOCAL_AUTOTOOLS_VERSION := 006
LOCAL_AUTOTOOLS_ARCHIVE := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION).tar.bz2
LOCAL_AUTOTOOLS_SUBDIR := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION)

LOCAL_AUTOTOOLS_CONFIGURE_ARGS := \
	--disable-zlib

include $(BUILD_AUTOTOOLS)
