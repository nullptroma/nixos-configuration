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
    }:
    (
      {
        isSystemUser = !isNormalUser;
        inherit isNormalUser extraGroups;
      }
      // (optionalAttrs (group != null) { inherit group; })
      // (optionalAttrs (description != null) { inherit description; })
    );
in {
  options = {
    module.users.enable = mkEnableOption "Enable users";
  };

  config = mkIf cfg.enable {
    users.users = builtins.mapAttrs mapUser usersSet;
  };
}

