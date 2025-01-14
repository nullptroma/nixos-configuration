{ lib
, pkgs
, config
, modulesPath
, ...
}:
with lib;
let
  cfg = config.module.host.extraHardware;
in
{
  options = {
    module.host.extraHardware.enable = mkEnableOption "Enable ZenBook extra-hardware";
  };

  # imports = [ 
  #   (modulesPath + "/installer/scan/not-detected.nix")
  # ];

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

