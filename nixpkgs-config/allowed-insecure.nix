{ pkgs, lib, ... }:
{
  allowInsecurePredicate =
    pkg:
    (builtins.elem (lib.getName pkg) (
      map lib.getName [
      ]
    ))
    || (builtins.any (x: lib.strings.hasPrefix x (lib.getName pkg)) [

    ]);
}
