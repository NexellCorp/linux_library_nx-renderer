LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#########################################################################
#									#
#			Shared Library Build				#
#									#
#########################################################################

ANDROID_VERSION_STR := $(PLATFORM_VERSION)
ANDROID_VERSION := $(firstword $(ANDROID_VERSION_STR))
ifeq ($(ANDROID_VERSION), 9)
LOCAL_VENDOR_MODULE := true
endif

LOCAL_SRC_FILES := \
	dp_buffer.c \
	dp_crtc.c \
	dp_device.c \
	dp_framebuffer.c \
	dp_plane.c \
	dp_screen.c \
	dp_util.c \
	format.c \
	kms.c \
	pattern.c \

LOCAL_C_INCLUDES := \
	external/libdrm \
	$(LOCAL_PATH)/./include \
	$(LOCAL_PATH)/../../include \
	$(LOCAL_PATH)/../../include/drm \
	$(LOCAL_PATH)

LOCAL_C_INCLUDES += \
	hardware/nexell/s5pxx18/gralloc

LOCAL_MODULE := libnx_renderer

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARD_LIBRARY)

#########################################################################
#									#
#			Static Library Build				#
#									#
#########################################################################
LOCAL_SRC_FILES := \
	dp_buffer.c \
	dp_crtc.c \
	dp_device.c \
	dp_framebuffer.c \
	dp_plane.c \
	dp_screen.c \
	dp_util.c \
	format.c \
	kms.c \
	pattern.c \

LOCAL_C_INCLUDES := \
	external/libdrm \
	$(LOCAL_PATH)/./include \
	$(LOCAL_PATH)/../../include \
	$(LOCAL_PATH)/../../include/drm \
	$(LOCAL_PATH)

LOCAL_C_INCLUDES += \
	hardware/nexell/s5pxx18/gralloc

LOCAL_MODULE := libnx_renderer

LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_LIBRARY)
#########################################################################
