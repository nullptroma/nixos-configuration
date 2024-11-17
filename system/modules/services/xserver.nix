{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.xserver;
in {
  options = {
    module.services.xserver.enable = mkEnableOption "Enable xserver service";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    services.xserver.displayManager.lightdm.enable = false;
    hardware.opengl.extraPackages = with pkgs; [
      amdvlk
    ];
  };
}
