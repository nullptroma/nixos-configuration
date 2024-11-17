{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.greetd;
in {
  options = {
    module.services.greetd.enable = mkEnableOption "Enable greetd (tuigreet)";
  };

  config = mkIf cfg.enable {
    security.pam.services.greetd = {
      enableGnomeKeyring = true;
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --remember-user-session --time";
          user = "greeter";
        };
      };
    };
  };
}


