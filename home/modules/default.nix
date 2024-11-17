{ lib
, ... 
}:
{
  imports = builtins.filter (module: module != (./. + /default.nix)) (
    map (module: ./. + /${module}) (builtins.attrNames (builtins.readDir ./.))
  );
}