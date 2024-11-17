{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.home.foot;
in {
  options = {
    module.home.foot.enable = mkEnableOption "Enable Foot";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.foot ];
  };
}

