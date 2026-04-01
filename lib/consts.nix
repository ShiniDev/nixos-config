{ inputs, ... }:
let
  systems = {
    default = "x86_64-linux";
  };
  systemModulesDefaults = [
    inputs.disko.nixosModules.disko
    inputs.stylix.nixosModules.stylix
    inputs.agenix.nixosModules.default
    { environment.systemPackages = [ inputs.agenix.packages.${systems.default}.default ]; }
  ];
  homeManagerDefaults = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
    home-manager.extraSpecialArgs = { inherit inputs; };
  };
in
{
  inherit systemModulesDefaults systems homeManagerDefaults;
  desktopModulesDefaults = systemModulesDefaults ++ [
    inputs.home-manager.nixosModules.home-manager
    homeManagerDefaults
  ];
}
