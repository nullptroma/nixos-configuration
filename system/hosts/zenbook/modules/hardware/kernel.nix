{ pkgs
, lib
, config
, ...
}:
with lib;
let
  cfg = config.module.host.kernel;
in
{
  options = {
    module.host.kernel.enable = mkEnableOption "Enable ZenBook kernel";
  };

  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      #kernelModules = [ "kvm-amd" "amdgpu" "iwlmvm" "iwlwifi" "btusb" "btintel" ];
      kernelParams = [ "quiet" ];
      extraModulePackages = [ ];
      initrd = {
        #availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "rtsx_pci_sdmmc" ];
        #kernelModules = [ "amdgpu" ];
      };

      extraModprobeConfig = ''
        options btusb enable_autosuspend=n reset=1
      '';
      #        options iwlwifi 11n_disable=1
    };
  };
}
