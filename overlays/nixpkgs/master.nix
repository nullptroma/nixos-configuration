{ inputs, system, self, lib, pkgs }: final: prev:
let
  master = import inputs.nixpkgs-master {
    inherit system;
    config = {
      inherit (final.callPackage "${self}/shared/allowed-unfree.nix" { }) allowUnfreePredicate android_sdk;
      inherit (final.callPackage "${self}/shared/allowed-insecure.nix" { }) allowInsecurePredicate;
    };
  };
in
{
}
