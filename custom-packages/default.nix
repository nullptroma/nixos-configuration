{ callPackage }:
{
  hyprlock-layout = callPackage ./hyprlock-layout { };
  adb-wifi = callPackage ./adb-wifi { };
  fix-brightness = callPackage ./fix-brightness { };
}
