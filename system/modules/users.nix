{ lib
, config
, usersSet
, ...
}:

with lib;

let
  cfg = config.module.users;
  mapUser = name: 
    { isNormalUser
    , extraGroups ? []
    , description ? null
    , group ? null
    , ...
    }: {
      group = mkIf (group!=null) group;
      description = mkIf (description!=null) description;
      isSystemUser = !isNormalUser;
      inherit isNormalUser extraGroups;
    };
in {
  options = {
    module.users.enable = mkEnableOption "Enable users";
  };

  config = mkIf cfg.enable {
    users.users = builtins.mapAttrs mapUser usersSet;
  };
}

