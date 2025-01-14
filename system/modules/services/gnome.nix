{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.gnome;
in {
  options = {
    module.services.gnome.enable = mkEnableOption "Enable GNOME";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = false;
      desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      gedit # text editor
    ]) ++ (with pkgs; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]);

    environment.systemPackages = with pkgs; [ 
      gnomeExtensions.appindicator
      gnome-tweaks
     ];
    services.gnome.gnome-settings-daemon.enable = true;

    programs.ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
  };
}
