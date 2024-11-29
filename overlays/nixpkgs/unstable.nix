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
  python312 = unstable.python312;
  #telegram-desktop = unstable.telegram-desktop;

  #xdg-desktop-portal-gkt = unstable.xdg-desktop-portal-gtk;
  #xdg-desktop-portal-hyprland = unstable.xdg-desktop-portal-hyprland;

  android-studio = unstable.android-studio;
  qbittorrent = unstable.qbittorrent;
}
