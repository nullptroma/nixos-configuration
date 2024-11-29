{ pkgs
, lib
, config
, inputs
, ... 
}:
with lib;
let 
  cfg = config.module.home.user.theme;
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
in
{
  options = {
    module.home.user.theme.enable = mkEnableOption "Enable user theme";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # themes
        adwaita-qt6
        adw-gtk3
        material-symbols
        nerdfonts
        noto-fonts
        noto-fonts-cjk-sans
        google-fonts
        moreWaita
        bibata-cursors
        morewaita-icon-theme
        papirus-icon-theme
        qogir-icon-theme
        whitesur-icon-theme
        colloid-icon-theme
        qogir-theme
        yaru-theme
        whitesur-gtk-theme
        orchis-theme
        gnome.adwaita-icon-theme
        icon-library
        libappindicator-gtk3
        libappindicator
      ];
      sessionVariables = {
        XCURSOR_THEME = cursor-theme;
        XCURSOR_SIZE = "20";
      };
      pointerCursor = {
        package = cursor-package;
        name = cursor-theme;
        size = 20;
        x11.defaultCursor = cursor-theme;
        x11.enable = true;
        gtk.enable = true;
      };
      file = {
        ".local/share/fonts" = {
          recursive = true;
          source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
        };
        ".fonts" = {
          recursive = true;
          source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
        };
        # ".config/gtk-4.0/gtk.css" = {
        #   text = ''
        #     window.messagedialog .response-area > button,
        #     window.dialog.message .dialog-action-area > button,
        #     .background.csd{
        #       border-radius: 0;
        #     }
        #   '';
        # };
        ".local/share/icons/MoreWaita" = {
          source = "${moreWaita}/share/icons";
        };
      };
    };

    gtk = {
      enable = false;
      font.name = "Rubik";
      theme.name = gtk-theme;
      cursorTheme = {
        name = cursor-theme;
        package = cursor-package;
      };
      iconTheme.name = moreWaita.name;
      gtk3.extraCss = ''
        headerbar, .titlebar,
        .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
          border-radius: 0;
        }
      '';
    };

    # qt = {
    #   enable = true;
    #   platformTheme.name = "qt6ct";
    # };
  };
}
