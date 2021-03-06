# Min. lang
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Samsung vendor
$(call inherit-product-if-exists, vendor/samsung/smdk5260-common/smdk5260-common-vendor.mk)

# Dalvik VM specific for devices with 2048 MB of RAM
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call Samsung LSI board support package
$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi/exynos5260/exynos5260.mk)

# seloonix hax
SELINUX_IGNORE_NEVERALLOWS := true

# Legacy blobs

TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/audioserver=22 \
    /system/vendor/bin/hw/rild=22

# First Stage Mount
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.universal5260:$(TARGET_COPY_OUT_RAMDISK)/fstab.universal5260 \
    $(LOCAL_PATH)/rootdir/etc/fstab.universal5260:$(TARGET_COPY_OUT_VENDOR)/fstab.universal5260


# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

#Device overlays

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Don't build with Jack
ANDROID_COMPILE_WITH_JACK := false

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/ysound.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.default \
    libaudio-resampler \
    libtinyxml \
    audio.primary.universal5260 \
    libtinyalsa \
    tinymix \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

# Camera
PRODUCT_PACKAGES += \
    camera.universal5260 \
    libshim_camera \
    libexynoscamera \
    libhwjpeg \
    android.hardware.camera.provider@2.4-impl.exynos5260 \
    android.hardware.camera.provider@2.4-service \
    camera.device@1.0-impl.exynos5260

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    cm_charger_res_images

# Filesystem
PRODUCT_PACKAGES += \
    setup_fs \
    make_ext4fs \
    e2fsck

# GPU
PRODUCT_PACKAGES += \
    mali_shim \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.renderscript@1.0-impl \
    gralloc.exynos5 \
    hwcomposer.exynos5 \
    libhwc2on1adapter \
    libion \
    libfimg \

# Health
 PRODUCT_PACKAGES += \
     android.hardware.health@2.0-impl \
     android.hardware.health@2.0-service


# Keymaster
 PRODUCT_PACKAGES += \
    keystore.exynos5 \
    android.hardware.keymaster@3.0-impl

# Gps
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# GPS
PRODUCT_PACKAGES += \
    libdmitry \
   android.hardware.gnss@1.1-impl


# Init scripts
PRODUCT_PACKAGES += \
    init.exynos.cam.sh \
    fstab.universal5260 \
    init.universal5260.usb.rc \
    init.universal5260.rc \
    init.wifi.rc \
    loggy.sh \
    ueventd.universal5260.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.samsung

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# MobiCore setup
 PRODUCT_PACKAGES += \
     mcDriverDaemon \
     libMcClient \
     libMcRegistry

# Stagefright and device specific modules
PRODUCT_PACKAGES += \
    libsamsung_symbols


# Bluetooth HAL
PRODUCT_PACKAGES += \
     android.hardware.bluetooth@1.0-impl \
     libbt-vendor


# IR
 PRODUCT_PACKAGES += \
     android.hardware.ir@1.0-impl \
     consumerir.universal5260


# PERMISSONS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml

# Power
 PRODUCT_PACKAGES += \
    power.universal5260 \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    sensors.exynos5

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/hardware/sensors/_hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/_hals.conf


# Touch features
 PRODUCT_PACKAGES += \
     vendor.lineage.touch@1.0-service.samsung

# Trust HAL
 PRODUCT_PACKAGES += \
     vendor.lineage.trust@1.0-service

# RIL
PRODUCT_PACKAGES += \
     libril \
     libreference-ril \
     rild \
     libxml2 \
     libprotobuf-cpp-full \
     modemloader \
     android.hardware.radio@1.0 \
     android.hardware.radio.deprecated@1.0 \
     libsec-ril_shim

# set default debugging usb configuration despite it kinda not working

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
     ro.secure=0 \
     ro.adb.secure=0 \
     ro.debuggable=1 \
     persist.service.adb.enable=1 \
     persist.service.debuggable=1 \
     persist.sys.usb.config=mtp,adb

# Seccomp Filters
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    Torch

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# USB HAL
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0-service.basic

## WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf
