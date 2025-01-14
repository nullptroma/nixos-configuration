{ lib
, config
, ...
}:

with lib;

let
  cfg = config.module.sound;
in {
  options = {
    module.sound.enable = mkEnableOption "Enable sound";
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = false;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
