LOG_STEP_IN "- Uprev radio HAL to 1.5"
sed -i "s/1.4::IRadio/1.5::IRadio/g" "$WORK_DIR/vendor/etc/vintf/manifest.xml"
LOG_STEP_OUT

LOG_STEP_IN "- Misc fixes"
SET_PROP "product" "traced.relay_producer_port" ""
SET_PROP "vendor" "ro.zygote" "zygote64"
SET_PROP "vendor" "ro.vendor.product.cpu.abilist" "arm64-v8a"
SET_PROP "vendor" "ro.vendor.product.cpu.abilist32" ""
SET_PROP "vendor" "ro.vendor.product.cpu.abilist64" "arm64-v8a"

