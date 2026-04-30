{ inputs, self, ... }:
{
  flake.nixosConfigurations.home-server = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
    modules =
      self.consts.systemModulesDefaults
      ++ (with self.nixosModules; [
        home-server
        home-server-hardware
        core
        apps
        networking
        minecraft
      ]);
  };

  flake.nixosModules.home-server =
    { pkgs, ... }:
    {
      imports = [
      ];
      system.stateVersion = "25.11"; # DO NOT CHANGE
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.kernelParams = [
        "consoleblank=5"
      ];
      networking.hostName = "home-server"; # Define your hostname.
    };
}
