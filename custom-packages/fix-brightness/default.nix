{ pkgs, writeShellScriptBin }: 
writeShellScriptBin "fix-brigtness" ''
    # Backlight level from systemd's perspective (change if needed)
    SYSTEMD_BACKLIGHT_FILE='/var/lib/systemd/backlight/pci-0000:04:00.0:backlight:amdgpu_bl1'

    # Backlight level from AMDGPU driver
    AMDGPU_BACKLIGHT_FILE='/sys/class/backlight/amdgpu_bl1/brightness'

    # Read current value from the driver and apply it to systemd
    AMDGPU_BACKLIGHT_VALUE=$(cat "$AMDGPU_BACKLIGHT_FILE")
    echo "$AMDGPU_BACKLIGHT_VALUE" > "$SYSTEMD_BACKLIGHT_FILE"
''