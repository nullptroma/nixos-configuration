{ pkgs
, lib
, config
, ... 
}:
with lib;
let 
  cfg = config.module.home.gnomeControlCenter;
in
{
  options = {
    module.home.gnomeControlCenter.enable = mkEnableOption "Enable GNOME settings";
  };
  
  config = mkIf cfg.enable {
    xdg.desktopEntries."org.gnome.Settings" = {
      name = "Settings";
      comment = "Gnome Control Center";
      icon = "org.gnome.Settings";
      exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
      categories = [ "X-Preferences" ];
      terminal = false;
    };
  };
}
