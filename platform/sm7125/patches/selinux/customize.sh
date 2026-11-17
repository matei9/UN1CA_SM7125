PLAT_SE="$WORK_DIR/system/system/etc/selinux"
if grep -q '^(type ion_device)' "$PLAT_SE/plat_sepolicy.cil"; then
    LOG "- Restoring the legacy ION label and HAL access"
    if ! grep -q '^/dev/ion[[:space:]]' "$PLAT_SE/plat_file_contexts"; then
        printf '/dev/ion\t\tu:object_r:ion_device:s0\n' >> "$PLAT_SE/plat_file_contexts"
    fi
    if ! grep -qE '^\(typeattribute unica_ion_(r|rw)\)' "$PLAT_SE/plat_sepolicy.cil"; then
        ION_R=()
        ION_RW=()
        for DOMAIN in hal_gatekeeper gatekeeperd hal_keymaster hal_keymint_server \
                hal_audio hal_fingerprint fingerprintd hal_face hal_neuralnetworks_server \
                hal_codec2_server hal_codec2_client hal_graphics_allocator hal_graphics_composer \
                gpuservice surfaceflinger system_server zygote mediaserver; do
            if grep -qE "^\((type|typeattribute) $DOMAIN\)" "$PLAT_SE/plat_sepolicy.cil"; then
                ION_R+=("$DOMAIN")
            fi
        done
        for DOMAIN in hal_camera cameraserver hal_drm hal_cas hal_omx_server bootanim; do
            if grep -qE "^\((type|typeattribute) $DOMAIN\)" "$PLAT_SE/plat_sepolicy.cil"; then
                ION_RW+=("$DOMAIN")
            fi
        done
        {
            if [ "${#ION_R[@]}" -ne 0 ]; then
                printf '%s\n' '(typeattribute unica_ion_r)' \
                    "(typeattributeset unica_ion_r (${ION_R[*]}))" \
                    '(allow unica_ion_r ion_device (chr_file (getattr open read ioctl lock map watch watch_reads)))'
            fi
            if [ "${#ION_RW[@]}" -ne 0 ]; then
                printf '%s\n' '(typeattribute unica_ion_rw)' \
                    "(typeattributeset unica_ion_rw (${ION_RW[*]}))" \
                    '(allow unica_ion_rw ion_device (chr_file (getattr open read write append ioctl lock map watch watch_reads)))'
            fi
        } >> "$PLAT_SE/plat_sepolicy.cil"
        unset DOMAIN ION_R ION_RW
    fi
else
    LOGW "ion_device is not declared in plat_sepolicy.cil; skipping ION rules"
fi
unset PLAT_SE
