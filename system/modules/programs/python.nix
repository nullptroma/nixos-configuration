{ lib
, config
, inputs
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.programs.python;
in {
  options = {
    module.programs.python.enable = mkEnableOption "Enable python with packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (python312.withPackages (ps: with ps; [
        requests
        material-color-utilities
        pywayland
        materialyoucolor
      ]))
    ];
  };
}