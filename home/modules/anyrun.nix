{ pkgs
, lib
, config
, inputs
, ... 
}:
with lib;
let 
  cfg = config.module.home.anyrun;
in
{
  options = {
    module.home.anyrun.enable = mkEnableOption "Enable user anyrun";
  };

  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  config = mkIf cfg.enable {
    programs.anyrun = {
      enable = true;
      config = {
        plugins = with inputs.anyrun.packages.${pkgs.system}; [
          applications
          randr
          rink
          shell
          symbols
        ];

        width.fraction = 0.3;
        y.absolute = 15;
        hidePluginInfo = true;
        closeOnClick = true;
      };
    };
  };
}
