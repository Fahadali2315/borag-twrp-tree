FOX_MANIFEST_ROOT=$(gettop)
if [ -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox_defaults.go -a -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox.mk ]; then
    if [ -z "$TW_DEFAULT_LANGUAGE" ]; then
        unset TW_DEFAULT_LANGUAGE
        export TW_DEFAULT_LANGUAGE="en"
    fi

    # Build
    export LC_ALL="C"
    export FOX_VERSION=$(date +%y.%m.%d)
    export ALLOW_MISSING_DEPENDENCIES=true
    export TARGET_DEVICE_ALT="borag"
    export OF_VIRTUAL_AB_DEVICE=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_MAINTAINER="Fahadali2315"

    # Magiskboot
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_PATCH_VBMETA_FLAG=1

    # Magisk
    export FOX_USE_SPECIFIC_MAGISK_ZIP="$FOX_MANIFEST_ROOT/device/motorola/borag/Magisk/Magisk-v26.1.zip"

    # Binaries
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_ZIP_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_XZ_UTILS=1
    export FOX_REPLACE_BUSYBOX_PS=1
    export OF_ENABLE_LPTOOLS=1

    # Decryption
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_NO_RELOAD_AFTER_DECRYPTION=1

    # Screen
    export OF_SCREEN_H=2400
    export OF_STATUS_H=50
    export OF_STATUS_INDENT_LEFT=85
    export OF_STATUS_INDENT_RIGHT=85
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=0

    # Backup
    export OF_QUICK_BACKUP_LIST="/boot;/vendor_boot;/data;"

    # OTA
    export OF_PATCH_AVB20=1
    # export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

    # Others
    export OF_USE_GREEN_LED=0
    export OF_FLASHLIGHT_ENABLE=0
    

    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX" >>$FOX_BUILD_LOG_FILE
        export | grep "OF_" >>$FOX_BUILD_LOG_FILE
        export | grep "TARGET_" >>$FOX_BUILD_LOG_FILE
        export | grep "TW_" >>$FOX_BUILD_LOG_FILE
    fi
fi
