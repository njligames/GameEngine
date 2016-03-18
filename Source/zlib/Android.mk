LOCAL_PATH := $(call my-dir)/zlib-1.2.8

include $(CLEAR_VARS)

LOCAL_MODULE    := zlib

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/adler32.c \
$(LOCAL_PATH)/compress.c \
$(LOCAL_PATH)/crc32.c \
$(LOCAL_PATH)/deflate.c \
$(LOCAL_PATH)/gzclose.c \
$(LOCAL_PATH)/gzlib.c \
$(LOCAL_PATH)/gzread.c \
$(LOCAL_PATH)/gzwrite.c \
$(LOCAL_PATH)/infback.c \
$(LOCAL_PATH)/inffast.c \
$(LOCAL_PATH)/inflate.c \
$(LOCAL_PATH)/inftrees.c \
$(LOCAL_PATH)/test/example.c \
$(LOCAL_PATH)/test/infcover.c \
$(LOCAL_PATH)/test/minigzip.c \
$(LOCAL_PATH)/trees.c \
$(LOCAL_PATH)/uncompr.c \
$(LOCAL_PATH)/zutil.c

include $(BUILD_STATIC_LIBRARY)
