{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.module.host.bluetooth;
in
{
  options = {
    module.host.bluetooth.enable = mkEnableOption "Enable bluetooth";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      package = pkgs.bluez;
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
          KernelExperimental = true;
        };
        Policy = {
          AutoEnable=true;
        };
      };
    };
    #services.blueman.enable = true;
  };
}
