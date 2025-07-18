
MAKE_CMD = $(FMOD_API_ROOT)/external/tools/make/make.exe -C $(FMOD_API_ROOT)/core_api/platforms/android CONFIG=$(FMOD_CONFIG) LINKAGE=Dynamic ABI=$(TARGET_ARCH_ABI)

LOCAL_PATH := $(call my-dir)

#
# FMOD Shared Library
#
include $(CLEAR_VARS)

LOCAL_MODULE            := fmod
LOCAL_SRC_FILES         := $(FMOD_API_ROOT)/core/lib/$(TARGET_ARCH_ABI)/libfmod$(FMOD_LIB_SUFFIX).so
LOCAL_EXPORT_C_INCLUDES := $(FMOD_API_ROOT)/core/inc


include $(PREBUILT_SHARED_LIBRARY)

#
# Example Library
#
include $(CLEAR_VARS)

LOCAL_MODULE            := example
LOCAL_SRC_FILES         := src/main/cpp/common_platform.cpp src/main/cpp/common.cpp src/main/cpp/granular_synth.cpp
LOCAL_C_INCLUDES        := src/main/cpp
LOCAL_SHARED_LIBRARIES  := fmod


include $(BUILD_SHARED_LIBRARY)

