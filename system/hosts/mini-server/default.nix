{
  config,
  lib,
  ...
}:
{
  # Import hosts.mini-server modules
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
      greetd.enable = true;
      kde6.enable = true;
      xserver.enable = false;
    };

    programs = {
      python.enable = true;
      systemPackages.enable = true;
      java.enable = true;
    };

    virtualisation = {
      enable = true;
      waydroid.enable = false;
    };

    host = {
      programs = {
        simple.enable = true;
        flatpak.enable = true;
      };
      hardware = {
        disks.enable = true;
        impermanence.enable = true;
        extraHardware.enable = true;
        kernel.enable = true;
        bluetooth.enable = true;
      };
    };
  };
}
