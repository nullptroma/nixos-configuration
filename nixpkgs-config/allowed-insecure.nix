{ lib, ... }:
{
  allowInsecurePredicate = pkg:
    let
      name = lib.getName pkg;
      exact = [ ];
      prefixes = [ ];
    in
    (builtins.elem name exact) || (builtins.any (p: lib.strings.hasPrefix p name) prefixes);
}
