{
  nixos = {
    zenbook = {
      platform = "x86_64-linux";
      stateVersion = "24.05";
      usersSet = {
        nullptr = {
          isNormalUser = true;
          description = "Roman";
          extraGroups = [ "video" "networkmanager" "wheel" "input" "libvirtd" "i2c" "adbusers" ];
          home-manager = {
            enable = true;
            hyprlandEnable = true;
          };
        };
      };
      gnomeEnable = true;
    };
  };
}

