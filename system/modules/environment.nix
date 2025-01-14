{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.environment;
in {
  options = {
    module.environment.enable = mkEnableOption "Enable environment variables";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      EDITOR = "nano";
      GSETTINGS_BACKEND = "keyfile";
    };
    environment.sessionVariables = {
      XDG_DATA_DIRS = [ (pkgs.glib.getSchemaDataDirPath pkgs.gsettings-desktop-schemas) ];
      NIXOS_OZONE_WL = "1";
      DOTNET_ROOT = "${pkgs.dotnet-sdk.unwrapped}/share/dotnet/";
    };
  };
}
