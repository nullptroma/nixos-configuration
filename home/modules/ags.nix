{ pkgs
, lib
, config
, inputs
, ... 
}:
with lib;
let 
  cfg = config.module.home.ags;
in
{
  options = {
    module.home.ags.enable = mkEnableOption "Enable user ags";
  };

  imports = [ 
    inputs.ags.homeManagerModules.default 
  ];

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ollama
      pywal
      sassc
      dart-sass
      ddcutil
    ];

    programs.ags = {
      enable = true;
      # null or path, leave as null if you don't want hm to manage the config
      #configDir = ../ags;

      # additional packages to add to gjs's runtime
      extraPackages = with pkgs; [
        
        gtksourceview
        gtksourceview4
        ollama
        pywal
        sassc
        webkitgtk
        webp-pixbuf-loader
      ];
    };
  };
}
