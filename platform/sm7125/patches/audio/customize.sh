LOG "- Adding deep-buffer playback PCM ID to audio_platform_info_intcodec.xml"

AUDIO_PLATFORM_INFO="$WORK_DIR/vendor/etc/audio_platform_info_intcodec.xml"

if [ -f "$AUDIO_PLATFORM_INFO" ]; then
    if ! grep -q "USECASE_AUDIO_PLAYBACK_DEEP_BUFFER" "$AUDIO_PLATFORM_INFO"; then
        EVAL "sed -i '/<pcm_ids>/a\        <usecase name=\"USECASE_AUDIO_PLAYBACK_DEEP_BUFFER\" type=\"out\" id=\"0\"/>' \"$AUDIO_PLATFORM_INFO\""
        LOG "- Added USECASE_AUDIO_PLAYBACK_DEEP_BUFFER with PCM ID 0 (MultiMedia1)"
    else
        LOG "- USECASE_AUDIO_PLAYBACK_DEEP_BUFFER already present, skipping"
    fi
else
    LOGE "- $AUDIO_PLATFORM_INFO not found"
fi

LOG "- Forcing deep_buffer format to 16-bit in audio_policy_configuration_base.xml"

AUDIO_POLICY_BASE="$WORK_DIR/vendor/etc/audio_policy_configuration_base.xml"

if [ -f "$AUDIO_POLICY_BASE" ]; then
    if grep -q "AUDIO_FORMAT_PCM_8_24_BIT" "$AUDIO_POLICY_BASE"; then
        EVAL "sed -i '/<mixPort name=\"deep_buffer\"/,/<\/mixPort>/s/AUDIO_FORMAT_PCM_8_24_BIT/AUDIO_FORMAT_PCM_16_BIT/' \"$AUDIO_POLICY_BASE\""
        LOG "- Changed deep_buffer format from PCM_8_24_BIT to PCM_16_BIT"
    else
        LOG "- deep_buffer format is already PCM_16_BIT or not found"
    fi
else
    LOGE "- $AUDIO_POLICY_BASE not found"
fi

LOG "- Removing UHQ/sUHQ sub-sections from media output in stage_policy.conf"

STAGE_POLICY="$WORK_DIR/system/system/etc/stage_policy.conf"

if [ -f "$STAGE_POLICY" ]; then
    if grep -q "AUDIO_OUTPUT_FLAG_DEEP_BUFFER" "$STAGE_POLICY"; then
        EVAL "awk '
        BEGIN { in_media=0; in_block=0; depth=0; remove=0 }
        /^media \{/ { in_media=1 }
        in_media && !in_block && /^            uhq \{/ { in_block=1; depth=1; remove=1; next }
        in_media && !in_block && /^            suhq \{/ { in_block=1; depth=1; remove=1; next }
        in_block {
            for(i=1;i<=length(\$0);i++) {
                c=substr(\$0,i,1)
                if(c==\"{\") depth++
                if(c==\"}\") depth--
            }
            if(depth==0) { in_block=0; remove=0; next }
            if(remove) next
        }
        in_media && !in_block && /^\}/ { in_media=0 }
        !in_block { print }
        ' \"$STAGE_POLICY\" > \"${STAGE_POLICY}.tmp\" && mv \"${STAGE_POLICY}.tmp\" \"$STAGE_POLICY\""
        LOG "- Removed uhq and suhq sub-sections from media output"
    else
        LOG "- AUDIO_OUTPUT_FLAG_DEEP_BUFFER not found in stage_policy.conf"
    fi
else
    LOGE "- $STAGE_POLICY not found"
fi

LOG "- Removing DEEP_BUFFER flag from primary-out in audio_policy_configuration.xml"

AUDIO_POLICY="$WORK_DIR/vendor/etc/audio_policy_configuration.xml"

if [ -f "$AUDIO_POLICY" ]; then
    if grep -q "AUDIO_OUTPUT_FLAG_PRIMARY|AUDIO_OUTPUT_FLAG_DEEP_BUFFER" "$AUDIO_POLICY"; then
        EVAL "sed -i 's/AUDIO_OUTPUT_FLAG_PRIMARY|AUDIO_OUTPUT_FLAG_DEEP_BUFFER/AUDIO_OUTPUT_FLAG_PRIMARY/' \"$AUDIO_POLICY\""
        LOG "- Removed AUDIO_OUTPUT_FLAG_DEEP_BUFFER from primary-out mixPort"
    else
        LOG "- DEEP_BUFFER flag not found in primary-out, skipping"
    fi
else
    LOGE "- $AUDIO_POLICY not found"
fi

LOG "- Removing DEEP_BUFFER flag from audio_policy_configuration_base.xml"

AUDIO_POLICY_BASE="$WORK_DIR/vendor/etc/audio_policy_configuration_base.xml"

if [ -f "$AUDIO_POLICY_BASE" ]; then
    if grep -q "AUDIO_OUTPUT_FLAG_DEEP_BUFFER" "$AUDIO_POLICY_BASE"; then
        EVAL "sed -i 's/AUDIO_OUTPUT_FLAG_DEEP_BUFFER/AUDIO_OUTPUT_FLAG_PRIMARY/' \"$AUDIO_POLICY_BASE\""
        LOG "- Changed DEEP_BUFFER flag to PRIMARY in base config"
    else
        LOG "- DEEP_BUFFER flag not found in base config, skipping"
    fi
else
    LOGE "- $AUDIO_POLICY_BASE not found"
fi
