PRODUCT_KERNEL_SOURCE := kernel/lge/msm8974-caf
CROSS_COMPILE := $(ANDROID_BUILD_TOP)/toolchains/arm-eabi-5.2/bin/arm-eabi-
ARCH := arm
ZIMAGE := arch/arm/boot/zImage
ZIP_FILES_DIR := device/lge/g2-common/zip_files

include vendor/render/configs/common.mk

#-- Override for dtb creation
.PHONY: kernel
kernel:
	@echo "\033[32m Starting build \033[0m"
	make -j$(CORE_COUNT) -C $(PRODUCT_KERNEL_SOURCE) KBUILD_BUILD_USER=$(KBUILD_BUILD_USER) KBUILD_BUILD_HOST=$(KBUILD_BUILD_HOST) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) $(PRODUCT_DEFCONFIG) > /dev/null
	make -j$(CORE_COUNT) -C $(PRODUCT_KERNEL_SOURCE) KBUILD_BUILD_USER=$(KBUILD_BUILD_USER) KBUILD_BUILD_HOST=$(KBUILD_BUILD_HOST) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
	$(mv-modules)
	$(make_dtb)
	@cp $(PRODUCT_KERNEL_SOURCE)/$(ZIMAGE) $(OUT_DIR)/$(RENDER_PRODUCT)

#-- Create a new definition for dtb creation
define make_dtb
		./$(ZIP_FILES_DIR)/tools/dtbToolCM -2 -o $(OUT_DIR)/$(RENDER_PRODUCT)/dtb -s 2048 -p $(PRODUCT_KERNEL_SOURCE)/scripts/dtc/ $(PRODUCT_KERNEL_SOURCE)/arch/arm/boot/;
endef
