{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.secretServices;
in {
  options = {
    module.services.secretServices.enable = mkEnableOption "Enable keyrings";
  };

  config = mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;
  };
}
