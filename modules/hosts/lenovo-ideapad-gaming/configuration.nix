{ inputs, self, ... }:
{
  flake.nixosConfigurations.lenovo-ideapad-gaming = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
    modules = [
      self.nixosModules.lenovo-ideapad-gaming-hardware
      self.nixosModules.lenovo-ideapad-gaming
      self.nixosModules.system-defaults
      self.nixosModules.desktop-defaults
    ];
  };

  flake.nixosModules.lenovo-ideapad-gaming =
    { pkgs, ... }:
    {
      system.stateVersion = "25.11"; # DO NOT CHANGE
      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.hostName = "lenovo-ideapad-gaming"; # Define your hostname.
      shinidev.networking.role = "desktop";
    };
}
