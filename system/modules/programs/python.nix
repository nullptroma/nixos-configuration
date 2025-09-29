{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.programs.python;
in
{
  options = {
    module.programs.python.enable = mkEnableOption "Enable python with packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (python313.withPackages (
        ps: with ps; [

        ]
      ))
    ];
  };
}
