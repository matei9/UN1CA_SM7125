SKIPUNZIP=1

I18N_LOCALES="$TMP_DIR/i18n_locales"
mkdir -p "$I18N_LOCALES"

ADD_EUX_LOCALES()
{
    local PARTITION="$1"
    local FILE="$2"

    local WORK_APK="$WORK_DIR/$PARTITION/$FILE"
    if [ ! -f "$WORK_APK" ]; then
        return 0
    fi

    local REL_PATH="${FILE//system\//}"
    local LOCALE_SOURCE_BASE="$I18N_LOCALES/system/$REL_PATH"
    if [ ! -d "$LOCALE_SOURCE_BASE" ]; then
        return 0
    fi

    local EUX_LOCALES
    EUX_LOCALES="$(ls "$LOCALE_SOURCE_BASE" 2>/dev/null | grep "^values-" | sed 's/^values-//' | sort)"
    if [ -z "$EUX_LOCALES" ]; then
        return 0
    fi

    local TARGET_CONFIGS
    TARGET_CONFIGS="$(aapt dump configurations "$WORK_APK" 2>/dev/null | sort)"

    local MISSING
    MISSING="$(comm -23 <(echo "$EUX_LOCALES") <(echo "$TARGET_CONFIGS") | wc -l)"
    if [ "$MISSING" -lt 2 ]; then
        return 0
    fi

    DECODE_APK "$PARTITION" "$FILE"

    local DECODED_PATH="$APKTOOL_DIR/$PARTITION/$REL_PATH/res"

    local COUNT=0
    for LOCALE_DIR in "$LOCALE_SOURCE_BASE/values-"*; do
        [ -d "$LOCALE_DIR" ] || continue
        local LOCALE
        LOCALE="$(basename "$LOCALE_DIR")"
        local TARGET_DIR="$DECODED_PATH/$LOCALE"
        if [ ! -d "$TARGET_DIR" ]; then
            EVAL "cp -a \"$LOCALE_DIR\" \"$TARGET_DIR\""
            COUNT=$((COUNT + 1))
        fi
    done

    if [ "$COUNT" -gt 0 ]; then
        local APK_NAME
        APK_NAME="$(basename "$FILE" .apk)"
        LOG "- Added $COUNT missing locale dirs to $APK_NAME"
    fi
}

LOG_STEP_IN "- Merging EUX locales"

EVAL "cat $MODPATH/locales.tar.gz.part.* | tar xzf - -C \"$I18N_LOCALES\""

# Core framework
ADD_EUX_LOCALES "system" "system/framework/framework-res.apk"

# Settings (already decoded by settings mod — cheap to process)
ADD_EUX_LOCALES "system" "system/priv-app/SecSettings/SecSettings.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SettingsProvider/SettingsProvider.apk"

# Samsung core apps
ADD_EUX_LOCALES "system" "system/priv-app/SamsungDialer/SamsungDialer.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungContacts/SamsungContacts.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungCamera/SamsungCamera.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungGallery2018/SamsungGallery2018.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SecMyFiles2020/SecMyFiles2020.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungCalendarProvider/SamsungCalendarProvider.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SecSoundPicker/SecSoundPicker.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungInCallUI/SamsungInCallUI.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungVideoPlayer/SamsungVideoPlayer.apk"

# Samsung services
ADD_EUX_LOCALES "system" "system/priv-app/ThemeStore/ThemeStore.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungAccount/SamsungAccount.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungCloudClient/SamsungCloudClient.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungBilling/SamsungBilling.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungExperienceService/SamsungExperienceService.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SamsungSeAgent/SamsungSeAgent.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk"

# Samsung AI/features
ADD_EUX_LOCALES "system" "system/priv-app/SamsungSmartSuggestions/SamsungSmartSuggestions.apk"
ADD_EUX_LOCALES "system" "system/priv-app/Bixby/Bixby.apk"
ADD_EUX_LOCALES "system" "system/priv-app/BixbyInterpreter/BixbyInterpreter.apk"
ADD_EUX_LOCALES "system" "system/priv-app/BixbyVisionFramework3.5/BixbyVisionFramework3.5.apk"
ADD_EUX_LOCALES "system" "system/priv-app/AREmoji/AREmoji.apk"
ADD_EUX_LOCALES "system" "system/priv-app/PhotoRemasterService/PhotoRemasterService.apk"
ADD_EUX_LOCALES "system" "system/priv-app/PhotoEditor_AIFull/PhotoEditor_AIFull.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SingleTakeService/SingleTakeService.apk"
ADD_EUX_LOCALES "system" "system/priv-app/StickerFaceARAvatar/StickerFaceARAvatar.apk"

# Samsung system utilities
ADD_EUX_LOCALES "system" "system/priv-app/SamsungContactsProvider/SamsungContactsProvider.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SCPMAgent/SCPMAgent.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SendHelpMessage/SendHelpMessage.apk"
ADD_EUX_LOCALES "system" "system/priv-app/BlueLightFilter/BlueLightFilter.apk"
ADD_EUX_LOCALES "system" "system/priv-app/DigitalWellbeing/DigitalWellbeing.apk"
ADD_EUX_LOCALES "system" "system/priv-app/SmartThingsKit/SmartThingsKit.apk"
ADD_EUX_LOCALES "system" "system/priv-app/Routines/Routines.apk"
ADD_EUX_LOCALES "system" "system/priv-app/PrivacyDashboard/PrivacyDashboard.apk"
ADD_EUX_LOCALES "system" "system/priv-app/DynamicLockscreen/DynamicLockscreen.apk"
ADD_EUX_LOCALES "system" "system/priv-app/PeopleStripe/PeopleStripe.apk"
ADD_EUX_LOCALES "system" "system/priv-app/MultiControl/MultiControl.apk"

# Samsung apps in app/ partition
ADD_EUX_LOCALES "system" "system/app/SamsungWeather/SamsungWeather.apk"
ADD_EUX_LOCALES "system" "system/app/SmartSwitchAgent/SmartSwitchAgent.apk"
ADD_EUX_LOCALES "system" "system/app/EmergencyLauncher/EmergencyLauncher.apk"
ADD_EUX_LOCALES "system" "system/app/SamsungTTS/SamsungTTS.apk"
ADD_EUX_LOCALES "system" "system/app/SketchBook/SketchBook.apk"
ADD_EUX_LOCALES "system" "system/app/VisionIntelligence3.7/VisionIntelligence3.7.apk"
ADD_EUX_LOCALES "system" "system/app/HoneyBoard/HoneyBoard.apk"
ADD_EUX_LOCALES "system" "system/app/MyDevice/MyDevice.apk"
ADD_EUX_LOCALES "system" "system/app/SmartManager_v6_DeviceSecurity/SmartManager_v6_DeviceSecurity.apk"
ADD_EUX_LOCALES "system" "system/app/SmartCapture/SmartCapture.apk"
ADD_EUX_LOCALES "system" "system/app/ClipboardEdge/ClipboardEdge.apk"
ADD_EUX_LOCALES "system" "system/app/SamsungOne/SamsungOne.apk"
ADD_EUX_LOCALES "system" "system/app/Personalization/Personalization.apk"
ADD_EUX_LOCALES "system" "system/app/Fast/Fast.apk"
ADD_EUX_LOCALES "system" "system/app/SafetyInformation/SafetyInformation.apk"

# SystemUI (in system_ext)
ADD_EUX_LOCALES "system_ext" "system_ext/priv-app/SystemUI/SystemUI.apk"

rm -rf "$I18N_LOCALES"

LOG_STEP_OUT
