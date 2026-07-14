LOG_STEP_IN "- Adding Google Hotword Enrollment blobs from a73xqxx"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx6_WIDEBAND_SMALL"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentYGoogleEx6_WIDEBAND_SMALL"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentOKGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentXGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Adding light blobs from source"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
LOG_STEP_OUT

LOG_STEP_IN "- Adding SoundBooster libs from stock"
for f in "$WORK_DIR"/system/system/lib/lib_SAG_EQ_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib/${f##*/}"; done
for f in "$WORK_DIR"/system/system/lib64/lib_SAG_EQ_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib64/${f##*/}"; done

for f in "$WORK_DIR"/system/system/lib/lib_SoundBooster_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib/${f##*/}"; done
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/lib_SoundBooster_ver1050.so"
for f in "$WORK_DIR"/system/system/lib64/lib_SoundBooster_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib64/${f##*/}"; done
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/lib_SoundBooster_ver1050.so"

for f in "$WORK_DIR"/system/system/lib/lib_SoundAlive_play_plus_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib/${f##*/}"; done
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/lib_SoundAlive_play_plus_ver500.so"
for f in "$WORK_DIR"/system/system/lib64/lib_SoundAlive_play_plus_ver*.so; do [ -e "$f" ] && DELETE_FROM_WORK_DIR "system" "system/lib64/${f##*/}"; done
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/lib_SoundAlive_play_plus_ver500.so"

ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/libaudiosaplus_sec_legacy.so"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/libaudiosaplus_sec_legacy.so"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/libsamsungSoundbooster_plus_legacy.so"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/libsamsungSoundbooster_plus_legacy.so"
LOG_STEP_OUT

LOG_STEP_IN "- Adding FM radio blobs from stock"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/permissions/privapp-permissions-com.sec.android.app.fm.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/sysconfig/preinstalled-packages-com.sec.android.app.fm.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/priv-app/HybridRadio/HybridRadio.apk" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/libfmradio_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/libfmradio_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/fm_helium.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/libbeluga.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/libfm-hci.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/vendor.qti.hardware.fm@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/fm_helium.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/libbeluga.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/libfm-hci.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/vendor.qti.hardware.fm@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Adding penguin libs from stock"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/libpenguin.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/libpenguin_impl.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/libpenguin.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/libpenguin_impl.so" 0 0 644 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Fix SEPolicy"
DELETE_FROM_WORK_DIR "system_ext" "etc/selinux/mapping/30.0.cil"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "etc/selinux/mapping/30.0.cil" 0 0 644 "u:object_r:sepolicy_file:s0"
LOG_STEP_OUT

