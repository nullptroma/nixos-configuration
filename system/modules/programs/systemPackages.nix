{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.programs.systemPackages;
in
{
  options = {
    module.programs.systemPackages.enable = mkEnableOption "Enable systemwide packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # Desktop apps
      telegram-desktop
      kdePackages.partitionmanager
      gparted
      firefox
      xdg-user-dirs

      # Coding stuff
      dotnet-sdk
      gnumake
      gcc

      # CLI utils
      lshw
      usbutils
      wirelesstools
      pciutils
      file
      tree
      wget
      git
      htop
      unzip
      ffmpeg
      zip
      ntfs3g
      yt-dlp
      brightnessctl
      swww
      openssl
      inxi
      killall
      bc
      upower
      android-tools

      # GUI utils
      kdiskmark

      # Xorg stuff
      xsettingsd
      xorg.xrdb

      # Wayland stuff
      xwayland

      # WMs and stuff
      seatd

      # Sound
      pipewire
      pulseaudio
      pamixer

      # GPU stuff
      amdvlk

      # Other
      home-manager
      greetd.greetd
      greetd.tuigreet
    ];
  };
}
