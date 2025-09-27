{
  description = "My system configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      libx = import ./lib { inherit self inputs; };
      hosts = import ./hosts.nix; 
    in {

    nixosConfigurations = libx.genNixos hosts.nixos;
  };
}
