{ lib
, config
, pkgs
, ...
}:

with lib;

let
  cfg = config.module.services.adb-wifid;
in {
  options = {
    module.services.adb-wifid.enable = mkEnableOption "Enable adb-wifid";
  };

  config = mkIf cfg.enable {
    programs.adb.enable = true;
    systemd.services = {
      adb-wifid = {
        after = [ "network.target" ];
        wantedBy = [ "default.target" ];
        description = "Automatic scan network for adb devices";
        serviceConfig = {
          Restart = "always";
          Type = "simple";
          ExecStart = ''${pkgs.custom.adb-wifi}/bin/adb-wifi'';
        };
      };
    };
  };
}
