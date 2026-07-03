{
mkdir $WORK_DIR/system/system/system_ext/apex
} || {
echo "apex folder already exists"
}

echo "Applying Legacy stack"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system/apex/com.android.runtime.apex" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system/apex/com.android.i18n.apex" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system/bin/bootstrap" 0 2000 751 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system/bin/linker" 0 2000 755 "u:object_r:system_linker_exec:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system/bin/linker_asan" 0 2000 755 "u:object_r:system_file:s0"

echo "Dirty adding libraries"

MODEL=$(echo -n "$SOURCE_EXTRA_FIRMWARES" | cut -d "/" -f 1)
REGION=$(echo -n "$SOURCE_EXTRA_FIRMWARES" | cut -d "/" -f 2)

# Standard libraries
cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/system/system/lib" "$WORK_DIR/system/system"
cat "$FW_DIR/${MODEL}_${REGION}/fs_config-system" | grep -F "system/lib/" >> "$WORK_DIR/configs/fs_config-system"
cat "$FW_DIR/${MODEL}_${REGION}/file_context-system" | grep -F "system/lib/" >> "$WORK_DIR/configs/file_context-system"

# System_ext libraries
cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/system_ext/lib" "$WORK_DIR/system/system/system_ext"
cp $FW_DIR/${MODEL}_${REGION}/fs_config-system_ext $FW_DIR/${MODEL}_${REGION}/fs_config-system_ext_tmp
cp $FW_DIR/${MODEL}_${REGION}/file_context-system_ext $FW_DIR/${MODEL}_${REGION}/file_context-system_ext_tmp

sed -i -e 's/system_ext/system\/system_ext/g' $FW_DIR/${MODEL}_${REGION}/fs_config-system_ext_tmp
sed -i -e 's/system_ext/system\/system_ext/g' $FW_DIR/${MODEL}_${REGION}/file_context-system_ext_tmp

cat "$FW_DIR/${MODEL}_${REGION}/fs_config-system_ext_tmp" | grep -F "system/system_ext/lib/" >> "$WORK_DIR/configs/fs_config-system"
cat "$FW_DIR/${MODEL}_${REGION}/file_context-system_ext_tmp" | grep -F "system/system_ext/lib/" >> "$WORK_DIR/configs/file_context-system"
echo "system/system_ext/lib 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
echo "/system/system_ext/lib u:object_r:system_lib_file:s0" >> "$WORK_DIR/configs/file_context-system"

echo "Setting ODM props"
SET_PROP "odm" "ro.vendor.product.cpu.abilist" "arm64-v8a"
SET_PROP "odm" "ro.vendor.product.cpu.abilist32" ""
SET_PROP "odm" "ro.vendor.product.cpu.abilist64" "arm64-v8a"
