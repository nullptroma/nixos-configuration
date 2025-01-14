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
      skypeforlinux
      haruna
      jetbrains.rider
      qbittorrent
      teams-for-linux
      blueberry
      android-studio
      godot_4
      obs-studio
      mpv
      discord
      onlyoffice-bin
      github-desktop
      yad
      nautilus
      gnome-control-center
      dconf-editor
      vscode
      nekoray

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
