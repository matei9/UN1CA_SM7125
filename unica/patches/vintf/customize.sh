_LOG() { if $DEBUG; then LOGW "$1"; else ABORT "$1"; fi }

if [ -f "$SRC_DIR/target/$TARGET_CODENAME/vintf/compatibility_matrix.device.xml" ]; then
    LOG "- Adding /system/system/etc/vintf/compatibility_matrix.device.xml"
    EVAL "cp -a \"$SRC_DIR/target/$TARGET_CODENAME/vintf/compatibility_matrix.device.xml\" \"$WORK_DIR/system/system/etc/vintf/compatibility_matrix.device.xml\""
elif [[ "$SOURCE_PLATFORM_SDK_VERSION" == "$TARGET_PLATFORM_SDK_VERSION" ]]; then
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/vintf/compatibility_matrix.device.xml"
else
    _LOG "File not found: $SRC_DIR/target/$TARGET_CODENAME/vintf/compatibility_matrix.device.xml"
fi

if [ -f "$SRC_DIR/target/$TARGET_CODENAME/vintf/manifest.xml" ]; then
    LOG "- Adding /system/system/etc/vintf/manifest.xml"
    EVAL "cp -a \"$SRC_DIR/target/$TARGET_CODENAME/vintf/manifest.xml\" \"$WORK_DIR/system/system/etc/vintf/manifest.xml\""
elif [[ "$SOURCE_PLATFORM_SDK_VERSION" == "$TARGET_PLATFORM_SDK_VERSION" ]]; then
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/vintf/manifest.xml"
fi

python3 - "$WORK_DIR/system/system/etc/vintf/compatibility_matrix.device.xml" <<'PY'
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

path = Path(sys.argv[1])
xml = path.read_text()
root = ET.fromstring(xml)
keymaster = root.findall("./hal[@format='hidl'][name='android.hardware.keymaster']")
if not any("4.0" in [version.text for version in hal.findall("version")] and
           hal.find("./interface[name='IKeymasterDevice'][instance='strongbox']") is not None
           for hal in keymaster):
    entry = """    <hal format="hidl">
        <name>android.hardware.keymaster</name>
        <version>4.0</version>
        <interface>
            <name>IKeymasterDevice</name>
            <instance>strongbox</instance>
        </interface>
    </hal>
"""
    start, end = xml.rsplit("</compatibility-matrix>", 1)
    path.write_text(f"{start.rstrip()}\n{entry}</compatibility-matrix>{end}")
PY

unset -f _LOG
