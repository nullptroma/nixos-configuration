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
in
{
  options = {
    module.home.user.packages.enable = mkEnableOption "Enable user packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # custom

      # cli
      jq
      fastfetch

      # desktop
      haruna
      jetbrains.rider
      qbittorrent
      godot_4
      obs-studio
      onlyoffice-bin
      vscode

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
