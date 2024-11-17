{ pkgs
, lib
, config
, wm
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
    xdg.icons.enable = true;
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;

      config = {
        common = {
          default = "*";
#          "org.freedesktop.impl.portal.Screencast" = wm;
#          "org.freedesktop.impl.portal.Screenshot" = wm;
        };
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-kde
      ];
    };
  };
}

