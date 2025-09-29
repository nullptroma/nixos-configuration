{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.programs.java;
in
{
  options = {
    module.programs.java.enable = mkEnableOption "Enable Java";
  };

  config = mkIf cfg.enable {
    programs.java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
