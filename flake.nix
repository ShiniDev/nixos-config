{
  description = "My system setup flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    aerothemeplasma-nix = {
      url = "github:nyakase/aerothemeplasma-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      aerothemeplasma-nix,
      home-manager,
      ...
    }@inputs:
    let
      USERNAME = "shinidev";
    in
    {
      nixosConfigurations.shinixos = nixpkgs.lib.nixosSystem {
        extraArgs = [ USERNAME ];
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.shinidev = ./home.nix;
          }
        ];
      };
    };
}
