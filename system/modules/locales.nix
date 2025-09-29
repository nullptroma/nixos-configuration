{
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.locales;
in
{
  options = {
    module.locales.enable = mkEnableOption "Enable locales";
  };

  config = mkIf cfg.enable {
    # Locale settings
    i18n = {
      defaultLocale = "en_US.UTF-8";
      supportedLocales = [ "all" ];
    };
  };
}
