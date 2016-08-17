LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Copy in build dir so bootstrap files are generated in build dir
LOCAL_AUTOTOOLS_COPY_TO_BUILD_DIR := 1

LOCAL_MODULE := dfu-programmer
LOCAL_DESCRIPTION := DFU Programmer tool for ATxmega update
LOCAL_LIBRARIES := libusb_1_0
LOCAL_CATEGORY_PATH := utils

define LOCAL_AUTOTOOLS_CMD_POST_UNPACK
	$(Q) cd $(PRIVATE_SRC_DIR) && ./bootstrap.sh
endef

include $(BUILD_AUTOTOOLS)
