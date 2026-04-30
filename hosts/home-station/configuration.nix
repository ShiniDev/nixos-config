{ inputs, self, ... }:
{
  flake.nixosConfigurations.home-station = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
    modules =
      self.consts.desktopModulesDefaults
      ++ (with self.nixosModules; [
        home-station-hardware
        home-station
        core
        apps
        graphical
        networking
        shinidev-home
        sandbox
      ]);
  };

  flake.nixosModules.home-station =
    { pkgs, ... }:
    {
      system.stateVersion = "25.11"; # DO NOT CHANGE
      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.hostName = "home-station"; # Define your hostname.
    };
}
