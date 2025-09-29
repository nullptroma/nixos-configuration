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
    inputs.impermanence.nixosModules.impermanence
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
        nixpkgs-config = import (self + /nixpkgs-config) { inherit lib; };
      in
        nixpkgs-config.nixpkgsConfig;
  };
}

