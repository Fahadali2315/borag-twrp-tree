#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_borag.mk

COMMON_LUNCH_CHOICES := \
    twrp_borag-user \
    twrp_borag-userdebug \
    twrp_borag-eng
