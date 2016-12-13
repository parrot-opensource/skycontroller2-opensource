LOCAL_PATH := $(call my-dir)

###############################################################################
# net-tools
###############################################################################

include $(CLEAR_VARS)

LOCAL_MODULE := net-tools
LOCAL_DESCRIPTION := Network configuration tools, e.g. arp, ifconfig, netstat, \
  rarp, nameif and route
LOCAL_CATEGORY_PATH := network

LOCAL_AUTOTOOLS_VERSION := 1.60
LOCAL_AUTOTOOLS_ARCHIVE := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION).tar.bz2
LOCAL_AUTOTOOLS_SUBDIR := $(LOCAL_MODULE)-$(LOCAL_AUTOTOOLS_VERSION)

LOCAL_AUTOTOOLS_PATCHES := \
	x25_address_undeclared.patch \
	stdlib_break.patch \
	stdlib_ec_hw.patch \
	disable_decnet.patch \
	not_terminated_lines.patch \
	disable_metricom_radio.patch \
	prevent_parallel_build.patch \
	install_only_bin.patch \
	disable_token_ring.patch \
	append_flags.patch

define LOCAL_AUTOTOOLS_CMD_CONFIGURE
	cd $(PRIVATE_OBJ_DIR) && make clean && yes '' | \
		$(AUTOTOOLS_CONFIGURE_ENV) $(PRIVATE_CONFIGURE_ENV) make config
endef

# If both iproute2 and busybox are selected, make certain we win
LOCAL_LIBRARIES = busybox

LOCAL_AUTOTOOLS_MAKE_INSTALL_ENV := \
	$(TARGET_AUTOTOOLS_CONFIGURE_ENV)

LOCAL_AUTOTOOLS_MAKE_BUILD_ENV := \
	$(AUTOTOOLS_CONFIGURE_ENV)

LOCAL_AUTOTOOLS_MAKE_INSTALL_ENV :=  \
	$(AUTOTOOLS_CONFIGURE_ENV) \
	BASEDIR="$(AUTOTOOLS_INSTALL_DESTDIR)"

include $(BUILD_AUTOTOOLS)
