{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.module.host.programs.simple;
in
{
  options = {
    module.host.programs.simple.enable = mkEnableOption "Enable some programs";
  };

  config = mkIf cfg.enable {
    programs = with pkgs; {
      steam.enable = true;
    };
  };
}
