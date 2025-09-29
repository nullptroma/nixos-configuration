{
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.base;
in
{
  options = {
    module.services.base.enable = mkEnableOption "Enable base services";
  };

  config = mkIf cfg.enable {
    services = {
      upower.enable = true;
      gvfs.enable = true;
      fstrim.enable = true;
    };
  };
}
