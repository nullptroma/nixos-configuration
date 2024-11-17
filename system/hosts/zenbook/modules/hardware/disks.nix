{ config, lib, pkgs, modulesPath, ... }:
with lib;
let
  cfg = config.module.host.disks;
in
{
  options = {
    module.host.disks.enable = mkEnableOption "Enable ZenBook disks";
  };

  config = mkIf cfg.enable {
    fileSystems."/" = { 
      device = "/dev/disk/by-uuid/676332b6-e489-4172-a936-6c1955f42710";
      fsType = "xfs";
    };

    boot.initrd.luks.devices."luks-e8db7ed8-da94-46a3-8e30-f773ed4e561c".device = "/dev/disk/by-uuid/e8db7ed8-da94-46a3-8e30-f773ed4e561c";

    fileSystems."/boot" = { 
      device = "/dev/disk/by-uuid/C4B5-6B41";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  
    swapDevices = [
      {
        device = "/dev/disk/by-partuuid/e4660a5f-38b3-4988-9205-ca68c57f6728";
        randomEncryption.enable = true;
      }
    ];
  };
}
