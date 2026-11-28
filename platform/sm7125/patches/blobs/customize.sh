LOG_STEP_IN "- Adding OK Google Hotword Enrollment blobs"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx4HEXAGON"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx4HEXAGON"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentOKGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "product" "priv-app/HotwordEnrollmentXGoogleEx3HEXAGON" 0 0 755 "u:object_r:system_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Adding 32-bit WFD blobs"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/bin/insthk" 0 2000 755 "u:object_r:insthk_exec:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/bin/remotedisplay" 0 2000 755 "u:object_r:remotedisplay_exec:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libhdcp2.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libremotedisplay_wfd.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libremotedisplayservice.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libsecuibc.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libstagefright_hdcp.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/wfd_log.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib64/libhdcp_client_aidl.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libhdcp2.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libremotedisplay_wfd.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libremotedisplayservice.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libsecuibc.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libstagefright_hdcp.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.security.hdcp.wifidisplay-V2-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/wfd_log.so"
LOG_STEP_OUT

# One UI 9 needs libhwui from the matching source framework.
if [ "$SOURCE_PLATFORM_SDK_VERSION" -lt "37" ]; then
    ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libhwui.so" 0 0 644 "u:object_r:system_lib_file:s0"
    ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib64/libhwui.so" 0 0 644 "u:object_r:system_lib_file:s0"
fi

# One UI 9 uses its own framework face libraries.
if [ "$SOURCE_PLATFORM_SDK_VERSION" -lt "37" ]; then
    LOG_STEP_IN "- Adding HIDL face biometrics libs"
    ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/android.hardware.biometrics.face@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
    ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/vendor.samsung.hardware.biometrics.face@2.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
    LOG_STEP_OUT
fi

LOG_STEP_IN "- Adding keymaster 4.0 libs"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/android.hardware.keymaster@3.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/android.hardware.keymaster@4.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/android.hardware.keymaster@4.1.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib/android.hardware.security.keymint-V1-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib/android.hardware.security.secureclock-V1-ndk.so"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/lib_nativeJni.dk.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libdk_native_keymaster.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib/libdk_native_keymint.so"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libkeymaster4_1support.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib/libkeymaster4support.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib/vendor.samsung.hardware.keymint-V1-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/android.hardware.security.keymint-V1-ndk.so"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib64/lib_nativeJni.dk.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib64/libdk_native_keymint.so"
ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib64/libdk_native_keymaster.so" 0 0 644 "u:object_r:system_lib_file:s0"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.keymint-V1-ndk.so"
LOG_STEP_OUT

LOG_STEP_IN "- Adding FM Radio libs"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib/libfmradio_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/libfmradio_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/fm_helium.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/libfm-hci.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib/vendor.qti.hardware.fm@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/fm_helium.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/libfm-hci.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "lib64/vendor.qti.hardware.fm@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/libsnaplite_native.so" 0 0 644 "u:object_r:same_process_hal_file:s0"

# One UI 9 needs newer face/light HAL blobs and the A36 SystemUI for optical fingerprint support.
if [ "$SOURCE_PLATFORM_SDK_VERSION" -ge "37" ]; then
    # Keep a native face 3.0 service if present.
    if [ -f "$WORK_DIR/vendor/bin/hw/vendor.samsung.hardware.biometrics.face@2.0-service" ] &&
            [ ! -f "$WORK_DIR/vendor/bin/hw/vendor.samsung.hardware.biometrics.face@3.0-service" ]; then
        LOG_STEP_IN "- Updating Samsung face HAL to 3.0"
        ADD_TO_WORK_DIR "a73xqxx" "vendor" "bin/hw/vendor.samsung.hardware.biometrics.face@3.0-service"
        ADD_TO_WORK_DIR "a73xqxx" "vendor" "etc/init/vendor.samsung.hardware.biometrics.face@3.0-service.rc"
        for LIB_DIR in lib lib64; do
            ADD_TO_WORK_DIR "a73xqxx" "vendor" "$LIB_DIR/vendor.samsung.hardware.biometrics.face@2.0.so" 0 0 644 "u:object_r:vendor_file:s0"
            ADD_TO_WORK_DIR "a73xqxx" "vendor" "$LIB_DIR/vendor.samsung.hardware.biometrics.face@3.0.so" 0 0 644 "u:object_r:vendor_file:s0"
        done

        python3 - "$WORK_DIR/vendor/etc/vintf" <<'PY'
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

directory = Path(sys.argv[1])
face = "vendor.samsung.hardware.biometrics.face"
fqname = "@3.0::ISehBiometricsFace/default"

def read_manifest(path):
    parser = ET.XMLParser(target=ET.TreeBuilder(insert_comments=True))
    return ET.parse(path, parser=parser)

def write_manifest(tree, path):
    ET.indent(tree, space="    ")
    tree.write(path, encoding="utf-8")

for path in directory.rglob("*.xml"):
    tree = read_manifest(path)
    if tree.getroot().tag != "manifest":
        continue
    hal = tree.find(f"./hal[@format='hidl'][name='{face}']")
    if hal is not None:
        if hal.find(f"./fqname[.='{fqname}']") is None:
            ET.SubElement(hal, "fqname").text = fqname
            write_manifest(tree, path)
        break
else:
    path = directory / "manifest.xml"
    tree = read_manifest(path)
    hal = ET.SubElement(tree.getroot(), "hal", format="hidl")
    ET.SubElement(hal, "name").text = face
    ET.SubElement(hal, "transport").text = "hwbinder"
    ET.SubElement(hal, "fqname").text = fqname
    write_manifest(tree, path)
PY

        DELETE_FROM_WORK_DIR "vendor" "bin/hw/vendor.samsung.hardware.biometrics.face@2.0-service"
        DELETE_FROM_WORK_DIR "vendor" "etc/init/vendor.samsung.hardware.biometrics.face@2.0-service.rc"
        LOG_STEP_OUT
        unset LIB_DIR
    fi

    # Replace the stock pair even when it exists to use the newer HBM handling.
    LOG_STEP_IN "- Replacing Samsung light HAL with A73 blobs"
    ADD_TO_WORK_DIR "a73xqxx" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
    ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
    LOG_STEP_OUT

    LOG_STEP_IN "- Adding A36 SystemUI for optical fingerprint support"
    ADD_TO_WORK_DIR "a36xqnaxx" "system_ext" "priv-app/SystemUI/SystemUI.apk" 0 0 644 "u:object_r:system_file:s0"
    DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk"
    cp "$MODPATH/rounded.xml" "$APKTOOL_DIR/system_ext/priv-app/SystemUI/SystemUI.apk/res/drawable/rounded.xml"
    LOG_STEP_OUT
fi
