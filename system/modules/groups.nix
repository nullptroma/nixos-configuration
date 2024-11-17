{ lib
, config
, groupsSet
, ...
}:

with lib;

let
  cfg = config.module.groups;
  mapGroup = name: 
    { gid ? null }: {
      gid = mkIf (gid!=null) gid;
    };
in {
  options = {
    module.groups.enable = mkEnableOption "Enable groups";
  };

  config = mkIf cfg.enable {
    users.groups = builtins.mapAttrs mapGroup groupsSet;
  };
}

