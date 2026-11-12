# The SM7125 platform module already installs the same 32-bit WFD stack.
if ! command -v patchelf > /dev/null; then
    ABORT "patchelf is required to patch the SM7125 Smart View libraries"
    return 1
fi

WFD_LIB="$WORK_DIR/system/system/lib/libremotedisplay_wfd.so"
# Fix the IGraphicBufferProducer vtable slot for getConsumerUsage in One UI 9.
HEX_PATCH "$WFD_LIB" "224643f0c2e8e26f" "2246083400bfe26f"
patchelf --replace-needed \
    libclang_rt.ubsan_standalone-arm-android.so \
    libwfd_audiotrack_shim.so \
    "$WFD_LIB"
unset WFD_LIB
