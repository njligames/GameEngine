LOCAL_PATH := $(call my-dir)/lpng1612

include $(CLEAR_VARS)

LOCAL_MODULE    := png

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/example.c \
$(LOCAL_PATH)/png.c \
$(LOCAL_PATH)/pngerror.c \
$(LOCAL_PATH)/pngget.c \
$(LOCAL_PATH)/pngmem.c \
$(LOCAL_PATH)/pngpread.c \
$(LOCAL_PATH)/pngread.c \
$(LOCAL_PATH)/pngrio.c \
$(LOCAL_PATH)/pngrtran.c \
$(LOCAL_PATH)/pngrutil.c \
$(LOCAL_PATH)/pngset.c \
$(LOCAL_PATH)/pngtest.c \
$(LOCAL_PATH)/pngtrans.c \
$(LOCAL_PATH)/pngwio.c \
$(LOCAL_PATH)/pngwrite.c \
$(LOCAL_PATH)/pngwtran.c \
$(LOCAL_PATH)/pngwutil.c

include $(BUILD_STATIC_LIBRARY)
