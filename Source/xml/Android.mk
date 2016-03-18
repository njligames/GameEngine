LOCAL_PATH := $(call my-dir)/tinyxml

include $(CLEAR_VARS)

LOCAL_MODULE    := xml

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/tinystr.cpp \
$(LOCAL_PATH)/tinyxml.cpp \
$(LOCAL_PATH)/tinyxmlerror.cpp \
$(LOCAL_PATH)/tinyxmlparser.cpp \
$(LOCAL_PATH)/xmltest.cpp \

include $(BUILD_STATIC_LIBRARY)
