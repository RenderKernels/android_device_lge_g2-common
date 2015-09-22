PRODUCT_KERNEL_SOURCE := kernel/lge/msm8974-caf
CROSS_COMPILE := $(ANDROID_BUILD_TOP)/toolchains/arm-eabi-5.2/bin/arm-eabi-
ARCH := arm
ZIMAGE := arch/arm/boot/zImage

include vendor/render/configs/common.mk
