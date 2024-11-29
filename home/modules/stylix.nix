{ lib
, config
, inputs
, pkgs
, self
, ...
}:

with lib;

let
  cfg = config.module.home.stylix;
  gtk-theme = "adw-gtk3-dark";

  moreWaita = pkgs.stdenv.mkDerivation {
    name = "MoreWaita";
    src = inputs.more-waita;
    installPhase = ''
      mkdir -p $out/share/icons
      mv * $out/share/icons
    '';
  };

  nerdfonts = (pkgs.nerdfonts.override {
    fonts = [
      "Ubuntu"
      "UbuntuMono"
      "CascadiaCode"
      "FantasqueSansMono"
      "JetBrainsMono"
      "FiraCode"
      "Mononoki"
      "SpaceMono"
    ];
  });
  google-fonts = (pkgs.google-fonts.override {
    fonts = [
      # Sans
      "Gabarito" "Lexend"
      # Serif
      "Chakra Petch" "Crimson Text"
    ];
  });

  cursor-theme = "Bibata-Modern-Classic";
  cursor-package = pkgs.bibata-cursors;
in {
  options = {
    module.home.stylix.enable = mkEnableOption "Enable Stylix";
  };

  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      image = "${self}/assets/wallpaper.png";

      # fonts.packages = with pkgs; [
      #   material-symbols
      #   nerdfonts
      #   noto-fonts
      #   noto-fonts-cjk-sans
      #   google-fonts
      # ];

      cursor = {
        package = cursor-package;
        name = cursor-theme;
        size = 20;
      };
    };
  };
}

