{ lib
, config
, ...
}:

with lib;

let
  cfg = config.module.boot;
in {
  options = {
    module.boot.enable = mkEnableOption "Enable Bootloader";
  };

  config = mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}

