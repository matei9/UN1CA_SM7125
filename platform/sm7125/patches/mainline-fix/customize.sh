SKIPUNZIP=1

mkdir -p "$APKTOOL_DIR/product"
cp -a --preserve=all "$SRC_DIR/platform/$TARGET_PLATFORM/patches/mainline-fix/product" "$APKTOOL_DIR"
SET_METADATA "product" "overlay/MainlineFix.apk" 0 0 644 "u:object_r:system_file:s0"
