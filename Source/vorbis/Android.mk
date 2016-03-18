LOCAL_PATH := $(call my-dir)/libvorbis-1.3.3

include $(CLEAR_VARS)

LOCAL_MODULE    := vorbis

LOCAL_EXPORT_C_INCLUDES := \
$(LOCAL_PATH) \
$(LOCAL_PATH)/examples \
$(LOCAL_PATH)/test \
$(LOCAL_PATH)/include \
$(LOCAL_PATH)/lib \

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_SRC_FILES := \
$(LOCAL_PATH)/examples/chaining_example.c \
$(LOCAL_PATH)/examples/decoder_example.c \
$(LOCAL_PATH)/examples/encoder_example.c \
$(LOCAL_PATH)/examples/seeking_example.c \
$(LOCAL_PATH)/examples/vorbisfile_example.c \
$(LOCAL_PATH)/lib/analysis.c \
$(LOCAL_PATH)/lib/bitrate.c \
$(LOCAL_PATH)/lib/block.c \
$(LOCAL_PATH)/lib/codebook.c \
$(LOCAL_PATH)/lib/envelope.c \
$(LOCAL_PATH)/lib/floor0.c \
$(LOCAL_PATH)/lib/floor1.c \
$(LOCAL_PATH)/lib/info.c \
$(LOCAL_PATH)/lib/lookup.c \
$(LOCAL_PATH)/lib/lpc.c \
$(LOCAL_PATH)/lib/lsp.c \
$(LOCAL_PATH)/lib/mapping0.c \
$(LOCAL_PATH)/lib/mdct.c \
$(LOCAL_PATH)/lib/psy.c \
$(LOCAL_PATH)/lib/registry.c \
$(LOCAL_PATH)/lib/res0.c \
$(LOCAL_PATH)/lib/smallft.c \
$(LOCAL_PATH)/lib/synthesis.c \
$(LOCAL_PATH)/lib/tone.c \
$(LOCAL_PATH)/lib/vorbisenc.c \
$(LOCAL_PATH)/lib/vorbisfile.c \
$(LOCAL_PATH)/lib/window.c \
$(LOCAL_PATH)/test/test.c \
$(LOCAL_PATH)/test/util.c \
$(LOCAL_PATH)/test/write_read.c #\
\
$(LOCAL_PATH)/lib/barkmel.c \
$(LOCAL_PATH)/lib/psytune.c \
$(LOCAL_PATH)/lib/sharedbook.c \

include $(BUILD_STATIC_LIBRARY)
