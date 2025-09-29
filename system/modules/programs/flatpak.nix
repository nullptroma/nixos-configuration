{
  lib,
  config,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.programs.flatpak;
in
{
  options = {
    module.programs.flatpak.enable = mkEnableOption "Enable flatpak applications";
  };

  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  config = mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      packages = [
        "com.github.tchx84.Flatseal"
        "org.gaphor.Gaphor"
      ];
      overrides = {
        "org.gaphor.Gaphor" = {
          Environment = {
            LANG = "ru_RU.UTF-8";
          };
        };
      };
    };
  };

}
