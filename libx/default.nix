{ self
, inputs
, ...
}:

let
  homeConfiguration   = self + /home;
  systemConfiguration = self + /system;

  # Helper function for generating host configs
  mkHost = machineDir:
    { usersSet ? { }
    , groupsSet ? { }
    , stateVersion
    , platform ? "x86_64-linux" 
    , hostname ? machineDir
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit 
          inputs
          self
          hostname
          usersSet
          groupsSet
          stateVersion
          platform
          machineDir;
      };

      modules = [
        systemConfiguration
        homeConfiguration
      ];
    };
in {
  genNixos = builtins.mapAttrs mkHost;
}

