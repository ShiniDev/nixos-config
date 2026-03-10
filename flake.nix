{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.shinixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/main/configuration.nix ];
      };
    };
}
