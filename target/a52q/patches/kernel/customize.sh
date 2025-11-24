[ ! -f "$WORK_DIR/kernel/boot.img" ] && ABORT "File not found: ${WORK_DIR//$SRC_DIR\//}/kernel/boot.img"

LOG "- Extracting boot.img"

[ -d "$TMP_DIR" ] && EVAL "rm -rf \"$TMP_DIR\""
EVAL "mkdir -p \"$TMP_DIR\""
EVAL "cp -a \"$WORK_DIR/kernel/boot.img\" \"$TMP_DIR/boot.img\""

MKBOOTIMG_ARGS="$(unpack_bootimg --boot_img "$TMP_DIR/boot.img" --out "$TMP_DIR/out" --format mkbootimg 2>&1)"

[ ! -f "$TMP_DIR/out/kernel" ] && ABORT "Failed to extract boot.img\n\n$MKBOOTIMG_ARGS"

GZ_COMPRESSED=false
[[ "$(READ_BYTES_AT "$TMP_DIR/out/kernel" "0" "2")" == "8b1f" ]] && GZ_COMPRESSED=true
if $GZ_COMPRESSED; then
    LOG "- Decompressing kernel image"
    EVAL "cat \"$TMP_DIR/out/kernel\" | gzip -d > \"$TMP_DIR/out/tmp\" && mv -f \"$TMP_DIR/out/tmp\" \"$TMP_DIR/out/kernel\""
fi

if [[ "$(LC_ALL=C file -b "$TMP_DIR/out/kernel")" != "Linux kernel ARM64"* ]]; then
    ABORT "Kernel image not valid\n\n$(LC_ALL=C file -b "$TMP_DIR/out/kernel")"
fi

PATCHED=false
KERNEL_ZIP="https://github.com/matei9/kernel_build_sm7125/releases/download/ksu/valeryn-a52q-ksu-susfs-20251123-2228.zip"

if [ -f "$TMP_DIR/out/kernel" ]; then
    LOG "- Replacing kernel image"
    curl -L -s -o "$TMP_DIR/kernel.zip" "$KERNEL_ZIP"
    unzip -q -j "$TMP_DIR/kernel.zip" "Image.gz" -d "$TMP_DIR/out"
    cat "$TMP_DIR/out/Image.gz" | gzip -d > "$TMP_DIR/out/tmp" && mv -f "$TMP_DIR/out/tmp" "$TMP_DIR/out/kernel"
    rm "$TMP_DIR/kernel.zip"
    PATCHED=true
fi

if ! $PATCHED; then
    LOG "\033[0;33m! Nothing to do\033[0m"
    EVAL "rm -rf \"$TMP_DIR\""
    unset MKBOOTIMG_ARGS GZ_COMPRESSED PATCHED
    return 0
fi

if $GZ_COMPRESSED; then
    LOG "- Compressing kernel image"
    EVAL "cat \"$TMP_DIR/out/kernel\" | gzip -n -f -9 > \"$TMP_DIR/out/tmp\" && mv -f \"$TMP_DIR/out/tmp\" \"$TMP_DIR/out/kernel\""
fi

LOG "- Repacking boot.img"

EVAL "mkbootimg $MKBOOTIMG_ARGS -o \"$TMP_DIR/new-boot.img\""
echo -n "SEANDROIDENFORCE" >> "$TMP_DIR/new-boot.img"
EVAL "mv -f \"$TMP_DIR/new-boot.img\" \"$WORK_DIR/kernel/boot.img\""

EVAL "rm -rf \"$TMP_DIR\""

unset MKBOOTIMG_ARGS GZ_COMPRESSED PATCHED
