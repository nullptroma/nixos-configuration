{ callPackage }:
{
  adb-wifi = callPackage ./adb-wifi { };
  fix-brightness = callPackage ./fix-brightness { };
}
