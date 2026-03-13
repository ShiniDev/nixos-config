{ inputs, ... }:
{
  flake = {
    nixosConfigurations = {
      # shinixos host
      shinixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ../hosts/main/configuration.nix
          inputs.aerothemeplasma-nix.nixosModules.aerothemeplasma-nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.shinidev = ../home/shinidev;
          }
        ];
      };
    };
  };
}
