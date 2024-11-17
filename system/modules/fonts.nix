{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.fonts;
in {
  options = {
    module.fonts.enable = mkEnableOption "Enable fonts packages";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
