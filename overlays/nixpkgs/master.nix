{ inputs, system, self, lib, pkgs }: final: prev:
let
  unfreeCfg = import (self + /shared/allowed-unfree.nix) { inherit lib; };
  insecureCfg = import (self + /shared/allowed-insecure.nix) { inherit lib; };
  master = import inputs.nixpkgs-master {
    inherit system;
    config = unfreeCfg // insecureCfg;
  };
in
{
  master = master;
}
