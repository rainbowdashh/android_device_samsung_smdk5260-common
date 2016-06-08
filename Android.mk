LOCAL_PATH := $(call my-dir)

ifneq ($(filter hl3g hllte m2alte, $(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
