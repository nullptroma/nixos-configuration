{ pkgs
, lib
, config
, ...
}:

with lib;

let
  cfg = config.module.programs.xdgPortal;
in {
  options = {
    module.programs.xdgPortal.enable = mkEnableOption "Enable xdg-portal";
  };

  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;

      config = {
        common = {
          default = "*";
        };
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-kde
        xdg-desktop-portal-gnome
      ];
    };
  };
}

