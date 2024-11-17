{ lib
, config
, hostname
, ...
}:

with lib;

let
  cfg = config.module.network;
in {
  options = {
    module.network.enable = mkEnableOption "Enable network";
  };
  config = mkIf cfg.enable {
    networking.networkmanager.enable = true;
    networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
    networking.hostName = hostname;
    networking.networkmanager.wifi.powersave = false;
  };
}
