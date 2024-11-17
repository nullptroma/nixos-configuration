{ lib
, config
, inputs
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.programs.systemPackages;
in {
  options = {
    module.programs.systemPackages.enable = mkEnableOption "Enable systemwide packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # Desktop apps
      kdePackages.partitionmanager
      jstest-gtk
      kdenlive
      gparted
      kitty
      firefox
      xdg-user-dirs

      # Coding stuff
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
      bluez
      bluez-tools
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
      wl-clipboard
      cliphist

      # WMs and stuff
      hypridle
      hyprlock
      seatd
      waybar

      # Sound
      pipewire
      pulseaudio
      pamixer

      # GPU stuff 
      amdvlk
      glaxnimate

      # Other
      home-manager
      greetd.greetd
      greetd.tuigreet
    ];
  };
} 