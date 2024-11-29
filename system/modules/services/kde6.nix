{ lib
, config
, ...
}:

with lib;

let
  cfg = config.module.services.kde6;
in {
  options = {
    module.services.kde6.enable = mkEnableOption "Enable KDE Plasma 6";
  };

  config = mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
