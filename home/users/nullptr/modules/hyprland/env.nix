{
  env = [
    "ELM_DISPLAY,wl"
    "SDL_VIDEODRIVER,wayland"
    "QT_QPA_PLATFORM, wayland;xcb"
    "QT_QPA_PLATFORMTHEME, kde"
    "XCURSOR_THEME, Bibata-Modern-Classic"
    "XCURSOR_SIZE, 20"
    "HYPRCURSOR_THEME, Bibata-Modern-Classic"
    "HYPRCURSOR_SIZE, 20"
    "YDOTOOL_SOCKET, $XDG_RUNTIME_DIR/.ydotool_socket"
    "STEAM_FORCE_DESKTOPUI_SCALING,1.75"
    "WLR_NO_HARDWARE_CURSORS, 1"
  ];
}