UEVENTD="$WORK_DIR/system/system/etc/ueventd.rc"
if [ -f "$WORK_DIR/vendor/ueventd.rc" ] && [ -f "$UEVENTD" ] &&
        ! grep -qE '^[[:space:]]*import[[:space:]]+/vendor/ueventd\.rc([[:space:]]|$)' "$UEVENTD"; then
    LOG "- Restoring the stock vendor ueventd rules"
    sed -i '1i import /vendor/ueventd.rc' "$UEVENTD"
fi
unset UEVENTD
