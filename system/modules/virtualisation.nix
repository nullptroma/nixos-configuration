{
  lib,
  config,
  usersSet,
  ...
}:

with lib;

let
  cfg = config.module.virtualisation;
in
{
  options = {
    module.virtualisation.enable = mkEnableOption "Enable virtualisation";
    module.virtualisation.waydroid.enable = mkEnableOption "Enable waydroid";
  };

  config = mkIf cfg.enable {
    virtualisation.waydroid.enable = cfg.waydroid.enable;
  };
}
