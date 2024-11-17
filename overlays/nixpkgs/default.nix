{ config, pkgs, inputs, platform, self, lib, ... }:
{
  nixpkgs.overlays = [
    (import ./custom-packages.nix { inherit self; })
    (import ./unstable.nix { inherit inputs lib self pkgs; system = platform;})
    (import ./attributes-overrides.nix)
    (import ./specificVersions.nix { inherit inputs lib self pkgs; system = platform;})
  ];
}
