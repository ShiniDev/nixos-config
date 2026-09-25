{ inputs, self, ... }:
{
  flake.nixosConfigurations.home-server = inputs.nixpkgs.lib.nixosSystem (
    let
      system = "x86_64-linux";
      flakeInputs = [
        inputs.disko.nixosModules.disko
        inputs.agenix.nixosModules.default
        { environment.systemPackages = [ inputs.agenix.packages.${system}.default ]; }
      ];
      myModules = with self.nixosModules; [
        home-server
        home-server-hardware

        self.nixosModules.system
        boot-loader-systemd
        users
        network
        pretty-shell
        ssh
      ];
    in
    {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = flakeInputs ++ myModules;
    }
  );

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
      time.timeZone = "America/New_York";
    };
}
