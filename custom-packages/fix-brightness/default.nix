{ pkgs, writeShellScriptBin }:
writeShellScriptBin "fix-brightness" ''
        set -euo pipefail

        # Backlight level from systemd's perspective (change if needed)
        SYSTEMD_BACKLIGHT_FILE='/var/lib/systemd/backlight/pci-0000:04:00.0:backlight:amdgpu_bl1'

        # Backlight level from AMDGPU driver
        AMDGPU_BACKLIGHT_FILE='/sys/class/backlight/amdgpu_bl1/brightness'

        # Read current value from the driver and apply it to systemd
        AMDGPU_BACKLIGHT_VALUE=$(cat "$AMDGPU_BACKLIGHT_FILE")
        if [ -w "$(dirname "$SYSTEMD_BACKLIGHT_FILE")" ]; then
            echo "$AMDGPU_BACKLIGHT_VALUE" > "$SYSTEMD_BACKLIGHT_FILE"
        else
            echo "$AMDGPU_BACKLIGHT_VALUE" | sudo tee "$SYSTEMD_BACKLIGHT_FILE" >/dev/null
        fi
''