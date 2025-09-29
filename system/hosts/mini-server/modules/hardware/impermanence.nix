{ pkgs
, lib
, config
, ...
}:
with lib;
let
  cfg = config.module.host.hardware.impermanence;
  persistRoot = "/nix/persist";
  pEtc = "${persistRoot}/etc";
  pShadow = "${pEtc}/shadow";
in
{
  options = {
    module.host.hardware.impermanence.enable = mkEnableOption "Enable mini-server impermanence";
  };

  config = mkIf cfg.enable {
    #  Reset root subvolume on boot
  boot.initrd.postResumeCommands = lib.mkAfter ''
      mkdir /btrfs_tmp
      mount /dev/disk/by-uuid/5f88ca43-3895-4361-9132-b1885181a7ce /btrfs_tmp
      if [[ -e /btrfs_tmp/root ]]; then
          mkdir -p /btrfs_tmp/old_roots
          timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
          mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
      fi

      delete_subvolume_recursively() {
          IFS=$'\n'
          for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
              delete_subvolume_recursively "/btrfs_tmp/$i"
          done
          btrfs subvolume delete "$1"
      }

      for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
          delete_subvolume_recursively "$i"
      done

      btrfs subvolume create /btrfs_tmp/root
      umount /btrfs_tmp
    '';

    system.activationScripts = {
      etc_shadow = ''
        [ -f "/etc/shadow" ] && cp /etc/shadow "${pShadow}"
        [ -f "${pShadow}" ] && cp "${pShadow}" /etc/shadow
      '';

      users.deps = [ "etc_shadow" ];
    };

    systemd.services."etc_shadow_persistence" = {
      enable = true;
      description = "Persist /etc/shadow on shutdown.";
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.util-linux ];
      unitConfig.defaultDependencies = true;
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = pkgs.writeShellScript "persist_etc_shadow" ''
          mkdir --parents "${pEtc}"
          cp /etc/shadow "${pShadow}"
        '';
      };
    };

    environment.persistence."/nix/persist" = {
      hideMounts = true;
      directories = [
        "/var/spool"
        "/etc/ssh"
        "/etc/NetworkManager/system-connections"
      ];
      files = [
        "/etc/machine-id"
      ];
    };
  };
}
