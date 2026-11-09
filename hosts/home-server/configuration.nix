{ inputs, self, ... }:
{
  flake.nixosConfigurations.home-server = inputs.nixpkgs.lib.nixosSystem (
    let
      system = "x86_64-linux";
      flakeInputs = [
        inputs.disko.nixosModules.disko
        inputs.agenix.nixosModules.default
        inputs.sops-nix.nixosModules.sops
        { environment.systemPackages = [ inputs.agenix.packages.${system}.default ]; }
      ];
      myModules = with self.nixosModules; [
        home-server
        home-server-hardware
        home-server-disko

        self.nixosModules.system
        boot-loader-systemd
        network
        pretty-shell
        ssh
        sops
        wifi
        users

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
      system.stateVersion = "25.11"; # DO NOT CHANGE
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.kernelParams = [
        "consoleblank=5"
      ];
      networking.hostName = "home-server"; # Define your hostname.
      this.network.allowedTCPPorts = [
        40218
      ];
      time.timeZone = "America/New_York";
    };
}
