{ lib
, config
, hostname
, ...
}:

with lib;

let
  cfg = config.module.zram;
in {
  options = {
    module.zram.enable = mkEnableOption "Enable ZRAM";
  };

  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 100;
    };
  };
}
