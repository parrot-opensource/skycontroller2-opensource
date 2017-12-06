
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := evtest
LOCAL_DESCRIPTION :=  Input Event Monitor
LOCAL_CATEGORY_PATH := devel
LOCAL_CFLAGS := -Wno-override-init -Wno-sign-compare -Wno-unused-result
LOCAL_SRC_FILES := \
	evtest.c

include $(BUILD_EXECUTABLE)

