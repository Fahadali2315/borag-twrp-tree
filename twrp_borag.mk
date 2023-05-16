#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit from borag device
$(call inherit-product, device/motorola/borag/device.mk)

PRODUCT_DEVICE := borag
PRODUCT_NAME := twrp_borag
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto e22
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="borag-user 12 SOVS32.121-21-4 9e5f7 release-keys"

BUILD_FINGERPRINT := motorola/borag_retail/borag:12/SOVS32.121-21-4/9e5f7:user/release-keys

# Hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true
