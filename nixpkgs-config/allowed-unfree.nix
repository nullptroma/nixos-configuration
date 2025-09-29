{ pkgs, lib, ... }:
{
  android_sdk.accept_license = true;
  allowUnfreePredicate =
    pkg:
    (builtins.elem (lib.getName pkg) (
      map lib.getName (
        with pkgs;
        [
          vscode
          jetbrains.rider
        ]
      )
    ))
    || (builtins.any (x: lib.strings.hasPrefix x (lib.getName pkg)) [
      "steam"
      "android-studio"
    ]);
}
