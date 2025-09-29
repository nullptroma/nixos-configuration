{ lib, ... }:
{
  android_sdk.accept_license = true;
  allowUnfreePredicate = pkg:
    let
      name = lib.getName pkg;
      exact = [
        "discord"
        "vscode"
        "jetbrains.rider"
        "onlyoffice-bin"
      ];
      prefixes = [
        "steam"
        "android-studio"
      ];
    in
    (builtins.elem name exact) || (builtins.any (p: lib.strings.hasPrefix p name) prefixes);
}
