{ config
, lib
, ...
}:
{
  # Import hosts.zenbook modules
  imports = [ ./modules ];

  module = {
    boot.enable = true;
    environment.enable = true;
    fonts.enable = true;
    groups.enable = true;
    locales.enable = true;
    network.enable = true;
    sound.enable = true;
    timedate.enable = true;
    users.enable = true;
    zram.enable = true;

    services = {
      adb-wifid.enable = true;
      base.enable = true;
      gnomePolkit.enable = true;
      greetd.enable = true;
      kde6.enable = true;
      xserver.enable = false;
    };

    programs = {
      xdgPortal.enable = true;
      python.enable = true;
      systemPackages.enable = true;
      java.enable = true;
      hyprland.enable = true;
      qtct.enable = false;
    };

    virtualisation = {
      enable = true;
      waydroid.enable = false;
    };

    host = {
      disks.enable = true;
      extraHardware.enable = true;
      kernel.enable = true;
      bluetooth.enable = true;
      fix-brightnessd.enable = true;
      programs = {
        simple.enable = true;
        flatpak.enable = true;
      };
    };
  };
}

