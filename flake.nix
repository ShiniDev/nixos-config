{
  description = "My system setup flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      disko,
      stylix,
      agenix,
      ...
    }@inputs:
    let
      systems = {
        default = "x86_64-linux";
      };
      homeManagerDefaults = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.extraSpecialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations.home-station = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = systems.default;
        modules = [
          ./hosts/home-station/configuration.nix
          disko.nixosModules.disko
          stylix.nixosModules.stylix
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          homeManagerDefaults
          { home-manager.users.shinidev = ./home/shinidev/home.nix; }
        ];
      };
      nixosConfigurations.home-server = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = systems.default;
        modules = [
          disko.nixosModules.disko
          agenix.nixosModules.default
          stylix.nixosModules.stylix
          ./hosts/home-server/configuration.nix
        ];
      };
    };
}
