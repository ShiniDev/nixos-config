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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    microvm = {
      url = "github:microvm-nix/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      inputs.import-tree [
        ./modules
        ./lib
        ./hosts
        ./home
        ./dev-shells
        ./flake-parts.nix
      ]
    );
}
