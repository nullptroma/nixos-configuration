{
  exec-once = [
    # Bar, wallpaper
    "swww-daemon --format xrgb"
    "ags &"

    "hypridle"
    "sleep 1 && systemctl --user restart wm-session.target"
    "systemctl --user import-environment XDG_SESSION_TYPE XDG_CURRENT_DESKTOP"
    "dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY"
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
    "bash ~/.config/hypr/bin/set-xdg-portals.sh"
    #sleep 1 && systemctl --user stop graphical-session.target graphical-session-pre.target && sleep 1 && systemctl --user restart wm-session.target
    "ydotoold"
    "sway-audio-idle-inhibit"

    # Clipboard: history
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"

    # Cursor
    #"hyprctl setcursor Bibata-Modern-Classic 20"
  ];
  exec = [
    "gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'"
    "gsettings set org.gnome.desktop.interface cursor-size 20"
  ];
}