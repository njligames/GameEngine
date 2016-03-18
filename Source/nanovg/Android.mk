LOCAL_PATH := $(call my-dir)/nanovg

include $(CLEAR_VARS)

LOCAL_MODULE    := nanovg

LOCAL_EXPORT_C_INCLUDES := \
$(MY_NANOVG_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/src/nanovg.c

include $(BUILD_STATIC_LIBRARY)
