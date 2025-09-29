{ lib
, pkgs
, config
, ...
}:
with lib;
let
  cfg = config.module.host.extraHardware;
in
{
  options = {
    module.host.extraHardware.enable = mkEnableOption "Enable mini-server extra-hardware";
  };

  config = mkIf cfg.enable {
    # Extra drivers settings
    hardware = {
      #enableAllFirmware = true;
      enableRedistributableFirmware = true;
      cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
      };
      brillo.enable = true;
      firmware = with pkgs; [
        linux-firmware
      ];
    };
  };
}

