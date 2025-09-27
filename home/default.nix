{ self
, pkgs
, lib
, inputs
, hostname
, platform
, usersSet
, stateVersion
, isWorkstation ? false
, ...
}:

let
  homeModules = ./. + /modules;
  # isRoot                     = username == "root";
  # homeDirectory              = if isRoot then "/root" else "/home/${username}";
  # userConfigurationPath      = ./. + /users/${username};
  # userConfigurationPathExist = builtins.pathExists userConfigurationPath;
in {
  home-manager = {
    useGlobalPkgs   = true;
    useUserPackages = true;
    #backupFileExtension = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";

    extraSpecialArgs  = {
      inherit 
        inputs 
        self 
        hostname
        usersSet 
        platform 
        stateVersion 
        homeModules 
        isWorkstation;
    };

    users = builtins.mapAttrs (username: 
      { ... }: 
      let
        isRoot                     = username == "root";
        homeDirectory              = if isRoot then "/root" else "/home/${username}";
        userConfigurationPath      = ./. + /users/${username};
        userConfigurationPathExist = builtins.pathExists userConfigurationPath;
      in
      {
        options = {
          # Pass current username to modules
          module.home.username = lib.mkOption {
             type = lib.types.str;
             default = username;
             readOnly = true; 
          };
        };

        imports = [
          homeModules
        ] ++ lib.optional userConfigurationPathExist userConfigurationPath;

        config.home = {
          inherit username;
          inherit stateVersion;
          inherit homeDirectory;
        };
      }
    ) (lib.filterAttrs (_: user: 
      user.isNormalUser == true 
      && user ? home-manager
      && user.home-manager ? enable
      && user.home-manager.enable == true) usersSet);
  };
}

