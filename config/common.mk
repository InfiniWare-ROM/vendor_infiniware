PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/infiniware/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/infiniware/prebuilt/common/bin/50-infiniware.sh:system/addon.d/50-infiniware.sh \
    vendor/infiniware/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/infiniware/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# InfiniWare-specific init file
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/init.local.rc:root/init.infiniware.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/infiniware/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/infiniware/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/infiniware/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/infiniware/prebuilt/common/bin/sysinit:system/bin/sysinit

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra Optional packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt \
    DashClock

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/infiniware/overlay/common

# Version System
PRODUCT_VERSION_MAJOR = 0
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE = 0

BUILD_VERSION = $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.modversion=InfiniWare ROM-$(BUILD_VERSION) \
    ro.romversion=$(BUILD_VERSION) \
    ro.goo.developerid=infini \
    ro.goo.rom=InfiniWare \
    ro.goo.version=$(shell date +%s)
