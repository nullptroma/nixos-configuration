{ usersSet
, lib
, ...
}:
let
  user = usersSet.nullptr;
  inherit (user.home-manager) hyprlandEnable;
in {
  # Import users.nullptr modules
  imports = [ ./modules/default.nix ];

  module.home = {
    ags.enable = true;
    anyrun.enable = true;
    dunst.enable = true;
    gnomeControlCenter.enable = true;
    mimelist.enable = true;
    stylix.enable = false;
    secretServices.enable = true;

    user = {
      packages.enable = true;
      theme.enable = true;
      hyprland.enable = true;
    };
  };
}