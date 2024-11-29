{ lib
, config
, inputs
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.home.user.hyprland;
in {
  options.module.home.user.hyprland = {
    enable = mkEnableOption "Enable hyprland";
  };
  
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
        variables = ["--all"];
      };
      xwayland.enable = true;

      settings = {

      } // (import ./general.nix)
        // (import ./env.nix)
        // (import ./execs.nix)
        // (import ./rules.nix)
        // (import ./keybinds.nix);

      extraConfig = ''
        source=~/.config/hypr/hyprland/colors.conf
      '';
    };
  };
}