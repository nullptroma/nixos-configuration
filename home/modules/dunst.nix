{ lib
, config
, ... 
}:
with lib;
let 
  cfg = config.module.home.dunst;
in
{
  options = {
    module.home.dunst.enable = mkEnableOption "Enable user dusnt";
  };
  config = mkIf cfg.enable {
    services.dunst = {
      enable = true;
    };
  };
}
