{ inputs, system, self, lib, pkgs }: final: prev:
let
  nixpkgs-config = import (self + /nixpkgs-config) { inherit lib; };
  unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config = nixpkgs-config.nixpkgsConfig;
  };
in
{
  unstable = unstable;
}
