PRODUCT_KERNEL_SOURCE := kernel/lge/msm8974-caf
CROSS_COMPILE := $(ANDROID_BUILD_TOP)/toolchains/arm-eabi-5.2/bin/arm-eabi-
ZIP_FILES_DIR := device/lge/g2-common/zip_files
TARGET_REQUIRES_DTB := true

include vendor/render/configs/common.mk
