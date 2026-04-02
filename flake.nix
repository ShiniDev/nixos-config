{
  description = "My system setup flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
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

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  /*
    outputs =
    {
      ...
    }@inputs:
    let
      consts = import ./lib/consts.nix {
        inherit inputs;
      };
    in
    {
      nixosConfigurations.home-station = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs consts; };
        system = consts.systems.default;
        modules = consts.desktopModulesDefaults ++ [
          ./hosts/home-station/configuration.nix
          { home-manager.users.shinidev = ./home/shinidev/home.nix; }
        ];
      };
      nixosConfigurations.home-server = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs consts; };
        system = consts.systems.default;
        modules = consts.systemModulesDefaults ++ [
          ./hosts/home-server/configuration.nix
        ];
      };
    };
  */
}
