SDHMS="system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"

if [ "$SOURCE_PLATFORM_SDK_VERSION" -ge "37" ]; then
    SMALI_PATCH "system" "$SDHMS" "smali/c4/c.smali" "replace" '<clinit>()V' 'SM6375' 'SM7125'
    SMALI_PATCH "system" "$SDHMS" "smali/n5/i0.smali" "replace" '<clinit>()V' 'SM6375' 'SM7125'
else
    APPLY_PATCH "system" "$SDHMS" "$MODPATH/0001-Restore-SM7125-TABoostController.patch"
fi

unset SDHMS
