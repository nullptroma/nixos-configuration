{
  usersSet,
  lib,
  ...
}:
let
  user = usersSet.nullptr;
in
{
  # Import users.nullptr modules
  imports = [ ./modules/default.nix ];

  module.home = {
    user = {
      packages.enable = true;
    };
  };
}
