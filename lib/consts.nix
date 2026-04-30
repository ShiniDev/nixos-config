{ inputs, ... }:
{
  flake.consts = rec {
    systems = {
      default = "x86_64-linux";
    };
    systemModulesDefaults = [
      inputs.disko.nixosModules.disko
      inputs.stylix.nixosModules.stylix
      inputs.agenix.nixosModules.default
      inputs.nix-minecraft.nixosModules.minecraft-servers
      { environment.systemPackages = [ inputs.agenix.packages.${systems.default}.default ]; }
      {
        nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      }
    ];
    homeManagerDefaults = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.extraSpecialArgs = { inherit inputs; };
    };
    desktopModulesDefaults = systemModulesDefaults ++ [
      inputs.home-manager.nixosModules.home-manager
      homeManagerDefaults
    ];
  };
}
