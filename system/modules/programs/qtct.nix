{ lib
, config
, inputs
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.programs.qtct;
in {
  options = {
    module.programs.qtct.enable = mkEnableOption "Enable qtct";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # qt
      libsForQt5.qtstyleplugin-kvantum
      kdePackages.qt6ct
      libsForQt5.qtstyleplugins
      libsForQt5.qt5ct
    ];
    qt = {
      enable = true;
      platformTheme = "qt5ct"; 
    };
  };
} 