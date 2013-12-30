# Inherit common stuff
$(call inherit-product, vendor/infiniware/config/common.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/infiniware/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk
