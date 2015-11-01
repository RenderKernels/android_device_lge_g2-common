PRODUCT_KERNEL_SOURCE := kernel/lge/msm8974-caf
CROSS_COMPILE := $(ANDROID_BUILD_TOP)/toolchains/arm-eabi-5.2/bin/arm-eabi-
ARCH := arm
ZIP_FILES_DIR := device/lge/g2-common/zip_files
TARGET_REQUIRES_DTB := true
DTB_DIR := arch/arm/boot

include vendor/render/configs/common.mk
