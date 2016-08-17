LOCAL_PATH := $(call my-dir)

###############################################################################
# tree
###############################################################################

include $(CLEAR_VARS)

LOCAL_MODULE := tree
LOCAL_DESCRIPTION := List contents of directories in a tree-like format
LOCAL_CATEGORY_PATH := devel

LOCAL_ARCHIVE_VERSION := 1.6.0
LOCAL_ARCHIVE := $(LOCAL_MODULE)-$(LOCAL_ARCHIVE_VERSION).tgz
LOCAL_ARCHIVE_SUBDIR := $(LOCAL_MODULE)-$(LOCAL_ARCHIVE_VERSION)

tree-src := hash.c \
	tree.c \
	color.c \
	xml.c \
	html.c \
	strverscmp.c \
	unix.c

LOCAL_GENERATED_SRC_FILES := $(addprefix $(LOCAL_ARCHIVE_SUBDIR)/,$(tree-src))

LOCAL_CFLAGS := -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS += -Wno-sign-compare -Wno-format-nonliteral

include $(BUILD_EXECUTABLE)
