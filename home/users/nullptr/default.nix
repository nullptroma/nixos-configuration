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
    ags.enable = hyprlandEnable;
    anyrun.enable = hyprlandEnable;
    dunst.enable = true;
    gnomeControlCenter.enable = true;
    mimelist.enable = true;
    secretServices.enable = true;

    user = {
      packages.enable = true;
      theme.enable = true;
      hyprland.enable = hyprlandEnable;
    };
  };
}