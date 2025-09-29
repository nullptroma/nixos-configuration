{ lib, ... }:
let
  allowedUnfree = import ./allowed-unfree.nix { inherit lib; };
  allowedInsecure = import ./allowed-insecure.nix { inherit lib; };
in
{
  nixpkgsConfig = allowedUnfree // allowedInsecure;
}
