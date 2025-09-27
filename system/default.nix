{ lib
, inputs
, self
, platform ? null
, stateVersion ? null
, machineDir
, pkgs
, ...
}:
let
  systemModules = ./. + /modules;
  hostConfigurationPath = ./. + /hosts/${machineDir};
  hostConfigurationPathExist = builtins.pathExists hostConfigurationPath;
in
{ 
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (self + /overlays/nixpkgs)
    systemModules
  ]
  ++ lib.optional hostConfigurationPathExist hostConfigurationPath;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System version
  system = { inherit stateVersion; };
  nixpkgs = {
    hostPlatform = platform;
    config =
      let
        unfreeCfg = import "${self}/shared/allowed-unfree.nix" { inherit lib; };
        insecureCfg = import "${self}/shared/allowed-insecure.nix" { inherit lib; };
      in
        unfreeCfg // insecureCfg;
  };
}

