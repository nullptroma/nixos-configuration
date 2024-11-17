{ pkgs
, lib
, config
, usersSet
, ... 
}:
with lib;
let 
  cfg = config.module.home.user.packages;
  username = config.module.home.username;
  user = usersSet.${username};
  inherit (user.home-manager) hyprlandEnable;
in
{
  options = {
    module.home.user.packages.enable = mkEnableOption "Enable user packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # custom
      custom.hyprlock-layout

      # cli
      sway-audio-idle-inhibit
      jq
      neofetch
      fastfetch

      # desktop
      vivaldi
      android-studio
      godot_4
      telegram-desktop
      obs-studio
      mpv
      discord
      onlyoffice-bin
      qbittorrent
      blueberry
      github-desktop
      yad
      gnome.nautilus
      gnome.gnome-control-center
      gnome.dconf-editor
      vscode
      nekoray
      #zed-editor

      # tools
      acpi
      ffmpeg
      libnotify
      zip
      unzip
      glib
      foot
      starship
      ydotool

      # theming tools
      gradience

      # hyprland
      # brightnessctl
      cliphist
      fuzzel
      grim
      hyprpicker
      tesseract
      imagemagick
      pavucontrol
      playerctl
      swappy
      swaylock-effects
      swayidle
      slurp
      swww
      wayshot
      wlsunset
      wl-clipboard
      wf-recorder

      # Screenshotting
      grim
      grimblast
      slurp
      swappy

      # langs
      gjs
      bun
      cargo
      go
      gcc
      typescript
    ];
  };
}
