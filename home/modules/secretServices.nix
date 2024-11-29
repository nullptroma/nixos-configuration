{ lib
, config
, inputs
, pkgs
, self
, ...
}:

with lib;

let
  cfg = config.module.home.secretServices;
in {
  options = {
    module.home.secretServices.enable = mkEnableOption "Enable keyrings";
  };

  config = mkIf cfg.enable {
    services.gnome-keyring.enable = true;
  };
}

