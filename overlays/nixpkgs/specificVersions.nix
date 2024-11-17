{ inputs, system, self, lib, pkgs }: final: prev:
let
  pkgs-bluez = import inputs.nixpkgs-bluez {
    inherit system;
  };
in
{
  #bluez = pkgs-bluez.bluez;
}
