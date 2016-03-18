LOCAL_PATH := $(call my-dir)/sqlite-amalgamation-3080700

include $(CLEAR_VARS)

LOCAL_MODULE    := sqlite

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/shell.c \
$(LOCAL_PATH)/sqlite3.c \

include $(BUILD_STATIC_LIBRARY)
