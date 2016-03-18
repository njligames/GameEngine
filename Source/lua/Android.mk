LOCAL_PATH := $(call my-dir)/lua-5.2.3/src

include $(CLEAR_VARS)

LOCAL_MODULE    := lua

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/bit.c \
$(LOCAL_PATH)/lapi.c \
$(LOCAL_PATH)/lauxlib.c \
$(LOCAL_PATH)/lbaselib.c \
$(LOCAL_PATH)/lbitlib.c \
$(LOCAL_PATH)/lcode.c \
$(LOCAL_PATH)/lcorolib.c \
$(LOCAL_PATH)/lctype.c \
$(LOCAL_PATH)/ldblib.c \
$(LOCAL_PATH)/ldebug.c \
$(LOCAL_PATH)/ldo.c \
$(LOCAL_PATH)/ldump.c \
$(LOCAL_PATH)/lfunc.c \
$(LOCAL_PATH)/lgc.c \
$(LOCAL_PATH)/linit.c \
$(LOCAL_PATH)/liolib.c \
$(LOCAL_PATH)/llex.c \
$(LOCAL_PATH)/lmathlib.c \
$(LOCAL_PATH)/lmem.c \
$(LOCAL_PATH)/loadlib.c \
$(LOCAL_PATH)/lobject.c \
$(LOCAL_PATH)/lopcodes.c \
$(LOCAL_PATH)/loslib.c \
$(LOCAL_PATH)/lparser.c \
$(LOCAL_PATH)/lstate.c \
$(LOCAL_PATH)/lstring.c \
$(LOCAL_PATH)/lstrlib.c \
$(LOCAL_PATH)/ltable.c \
$(LOCAL_PATH)/ltablib.c \
$(LOCAL_PATH)/ltm.c \
$(LOCAL_PATH)/lua.c \
$(LOCAL_PATH)/luac.c \
$(LOCAL_PATH)/lundump.c \
$(LOCAL_PATH)/lvm.c \
$(LOCAL_PATH)/lzio.c \

include $(BUILD_STATIC_LIBRARY)
