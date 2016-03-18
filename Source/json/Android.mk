LOCAL_PATH := $(call my-dir)/jsoncpp-src-0.5.0

include $(CLEAR_VARS)

LOCAL_MODULE    := json

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/src/lib_json/json_reader.cpp \
$(LOCAL_PATH)/src/lib_json/json_value.cpp \
$(LOCAL_PATH)/src/lib_json/json_writer.cpp \

include $(BUILD_STATIC_LIBRARY)
