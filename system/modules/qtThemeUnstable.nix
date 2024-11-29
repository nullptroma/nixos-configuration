{ lib
, config
, inputs
, platform
, ...
}:

with lib;

let
  cfg = config.module.qtThemeUnstable;
  unstable = import inputs.nixpkgs-unstable {
    system = platform;
    config = {
      inherit (final.callPackage "${self}/shared/allowed-unfree.nix" { }) allowUnfreePredicate android_sdk;
      inherit (final.callPackage "${self}/shared/allowed-insecure.nix" { }) allowInsecurePredicate;
    };
  };
in {
  options = {
    module.qtThemeUnstable.enable = mkEnableOption "Enable unstable qt themes support";
  };

  config = mkIf cfg.enable {
    environment.variables.QT_PLUGIN_PATH = with unstable; lib.forEach [
      kdePackages.plasma-integration
      kdePackages.qtwayland
      kdePackages.qtsvg
      kdePackages.qtimageformats
      kdePackages.kimageformats
    ] (pkg: "${pkg}/${kdePackages.qtbase.qtPluginPrefix}");
  };
} 