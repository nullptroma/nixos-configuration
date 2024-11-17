{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.gnomePolkit;
in {
  options = {
    module.services.gnomePolkit.enable = mkEnableOption "Enable polkit-gnome-authentication-agent-1";
  };

  config = mkIf cfg.enable {
    security.polkit.enable = true;
    systemd.user = {
      services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

      units."wm-session.target" = {
        name = "wm-session.target";
        enable = true;
        text = ''
          [Unit]
          Description=A window manager session
          Documentation=man:systemd.special
          BindsTo=graphical-session.target
          Wants=graphical-session-pre.target
          After=graphical-session-pre.target
        '';
      };
    };
  };
}
