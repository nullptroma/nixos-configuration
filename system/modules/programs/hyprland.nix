{ lib
, config
, inputs
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.programs.hyprland;
in {
  options = {
    module.programs.hyprland.enable = mkEnableOption "Enable hyprland";
    module.programs.hyprland.fixedDesktop.enable = mkEnableOption "Enable hyprland desktop file";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
    };
  };
}