{ config, pkgs, inputs, platform, self, lib, ... }:
{
  nixpkgs.overlays = [
    (import ./custom-packages.nix { inherit self; })
    #(import ./next.nix { inherit inputs lib self pkgs; system = platform;})
    (import ./unstable.nix { inherit inputs lib self pkgs; system = platform;})
    (import ./master.nix { inherit inputs lib self pkgs; system = platform;})
    (import ./specificVersions.nix { inherit inputs lib self pkgs; system = platform;})
    (import ./attributes-overrides.nix)
  ];
}
