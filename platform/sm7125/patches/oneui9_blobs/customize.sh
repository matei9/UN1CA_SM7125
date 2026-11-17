if [ "$SOURCE_PLATFORM_SDK_VERSION" -lt "37" ]; then
    return 0
fi

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

if [ ! -f "$WORK_DIR/vendor/bin/hw/vendor.samsung.hardware.light-service" ]; then
    ADD_TO_WORK_DIR "a73xqxx" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
    ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
fi

LOG_STEP_IN "- Adding a36xqnaxx SystemUI for optical fingerprint support"
ADD_TO_WORK_DIR "a36xqnaxx" "system_ext" "priv-app/SystemUI/SystemUI.apk" 0 0 644 "u:object_r:system_file:s0"
DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk"
cp "$MODPATH/rounded.xml" "$APKTOOL_DIR/system_ext/priv-app/SystemUI/SystemUI.apk/res/drawable/rounded.xml"
LOG_STEP_OUT
