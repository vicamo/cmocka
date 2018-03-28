# Copyright (C) 2018 Link Motion Ltd.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libcmocka

LOCAL_SRC_FILES := \
    src/cmocka.c \
    $(empty)

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
GEN := $(local-generated-sources-dir)/config.h
$(GEN): PRIVATE_PATH := $(LOCAL_PATH)
$(GEN): PRIVATE_CUSTOM_TOOL = cp $< $@
$(GEN): $(LOCAL_PATH)/config.h.android
	$(transform-generated-source)

LOCAL_GENERATED_SOURCES := \
    $(GEN) \
    $(empty)

LOCAL_CFLAGS := \
    -DHAVE_CONFIG_H \
    $(empty)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(empty)

include $(BUILD_SHARED_LIBRARY)
