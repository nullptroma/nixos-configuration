{
  description = "My system configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    
    nixpkgs-bluez.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    ags.url = "github:aylur/ags/v1";

    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
    
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      libx = import ./lib { inherit self inputs; };
      hosts = import ./hosts.nix; 
    in {

    nixosConfigurations = libx.genNixos hosts.nixos;
  };
}
