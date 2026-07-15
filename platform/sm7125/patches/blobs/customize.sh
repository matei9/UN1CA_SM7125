LOG_STEP_IN "- Adding Google Hotword Enrollment blobs from a73xqxx"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx4HEXAGON"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx4HEXAGON"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentOKGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentXGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Adding light blobs from source"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
ADD_TO_WORK_DIR "$SOURCE_FIRMWARE" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
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

LOG_STEP_IN "- Hex-patch libmeminfo.so to prevent abort on GPU BPF map mismatch"
# abortOnMismatch calls __libcpp_verbose_abort which kills system_server
# Replace all 5 abort calls (bl -> ret) in abortOnMismatch function
# Workaround getGpuTotalUsageKb() abort on missing GPU BPF maps (from a36q).
HEX_PATCH "$WORK_DIR/system/system/lib64/libmeminfo.so" "bf2303d5c0035fd63227009431270094" "bf2303d5c0035fd6c0035fd6c0035fd6"
HEX_PATCH "$WORK_DIR/system/system/lib64/libmeminfo.so" "e80b8052080000b92d270094e2250094" "e80b8052080000b9c0035fd6e2250094"
HEX_PATCH "$WORK_DIR/system/system/lib64/libmeminfo.so" "e80b8052080000b929270094de250094" "e80b8052080000b9c0035fd6de250094"
HEX_PATCH "$WORK_DIR/system/system/lib64/libmeminfo.so" "e80b8052080000b9252700943f2303d5" "e80b8052080000b9c0035fd63f2303d5"
LOG_STEP_OUT

LOG_STEP_IN "- Hex-patch libandroid_runtime.so to bypass GPU BPF stats"
# getGpuTotalUsageKb -> ReadProcessGpuUsageKb -> opens BPF map -> fdsan abort
# Replace getGpuTotalUsageKb with: mov x0, #0; ret (return 0, skip GPU stats)
HEX_PATCH "$WORK_DIR/system/system/lib64/libandroid_runtime.so" "ff8300d1fd7b01a9fd430091e0230091ff0700f951fe0394" "000080d2c0035fd6fd430091e0230091ff0700f951fe0394"
LOG_STEP_OUT

