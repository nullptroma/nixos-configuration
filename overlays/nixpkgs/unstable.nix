{ inputs, system, self, lib, pkgs }: final: prev:
let
  unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config = {
      inherit (final.callPackage "${self}/shared/allowed-unfree.nix" { }) allowUnfreePredicate android_sdk;
      inherit (final.callPackage "${self}/shared/allowed-insecure.nix" { }) allowInsecurePredicate;
    };
  };
in
{
  unstable = {
  };
}
