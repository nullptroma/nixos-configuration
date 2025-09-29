{ pkgs
, lib
, config
, ...
}:
with lib;
let
  cfg = config.module.host.disks;
in
{
  options = {
    module.host.disks.enable = mkEnableOption "Enable mini-server disks";
  };

  config = mkIf cfg.enable {
    fileSystems."/" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/nix/persist" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=nix/persist" ];
      neededForBoot = true;
    };

  fileSystems."/var/lib" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=var/lib" ];
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce";
      fsType = "btrfs";
      options = [ "subvol=var/log" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AD61-FF3B";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0327c13a-ed22-4c3c-96ec-bbd9b4927ef8"; }
    ];
  };
}
