{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.develop;
in
{
  options = {
    module.develop.enable = mkEnableOption "Enable environment variables";
  };

  config = mkIf cfg.enable {

  };
}
