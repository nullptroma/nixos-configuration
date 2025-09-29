{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.module.host.hardware.kernel;
in
{
  options = {
    module.host.hardware.kernel.enable = mkEnableOption "Enable mini-server kernel";
  };

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      #kernelModules = [ "kvm-amd" "amdgpu"];
      kernelParams = [ "quiet" ];
      extraModulePackages = [ ];
      initrd = {
        #availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "rtsx_pci_sdmmc" ];
        #kernelModules = [ "amdgpu" ];
      };

      extraModprobeConfig = '''';
    };
  };
}
