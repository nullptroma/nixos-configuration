{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.module.host.fix-brightnessd;
in
{
  options = {
    module.host.fix-brightnessd.enable = mkEnableOption "Enable fix-brightnessd";
  };

  config = mkIf cfg.enable {
    systemd.services = {
      fix-brightnessd = {
        unitConfig = {
          DefaultDependencies = "no";
        };
        #after = [ "systemd-backlight@backlight:amdgpu_bl1.service" ];
        wantedBy = [ "final.target" ];
        after = [ "final.target" ];
        description = "Save brightness value from AMDGPU";

        serviceConfig = {
          Type = "oneshot";
          #RemainAfterExit = "true";
          ExecStart = ''${pkgs.bash}/bin/bash ${pkgs.custom.fix-brightness}/bin/fix-brigtness'';
        };
      };
    };
  };
}
