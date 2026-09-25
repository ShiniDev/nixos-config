{ inputs, self, ... }:
{
  flake.nixosConfigurations.home-station = inputs.nixpkgs.lib.nixosSystem (
    let
      system = "x86_64-linux";
      flakeInputs = with inputs; [
        microvm.nixosModules.host
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          environment.systemPackages = [ agenix.packages.${system}.default ];
        }
      ];
      myModules = with self.nixosModules; [
        home-station-hardware
        home-station

        self.nixosModules.system
        boot-loader-systemd
        network
        ssh
        pretty-shell
        vms

        audio
        display-manager
        shinidev-home
        game-launchers
      ];
    in
    {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = flakeInputs ++ myModules;
    }
  );

  flake.nixosModules.home-station =
    { config, pkgs, ... }:
    {
      system.stateVersion = "25.11"; # DO NOT CHANGE
      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.hostName = "home-station"; # Define your hostname.
      time.timeZone = "America/New_York";

      age.secrets.shinidev-password.file = ../../secrets/shinidev-password.age;
      users.mutableUsers = false;
      users.users.shinidev = {
        uid = 1000;
        group = "shinidev";
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = self.keys.ssh.shinidev ++ self.keys.ssh.home-station;
        hashedPasswordFile = config.age.secrets.shinidev-password.path;
      };
      users.groups.shinidev.gid = 1000;

      hardware.graphics.enable = true;
      services.xserver.videoDriver = [ "nvidia" ];
      hardware.nvidia.prime = {
        nvidiaBusId = "PCI:1@0:0:0";
        amdgpuBusId = "PCI:5@0:0:0";
      };

      # Makes our flake accessible via system-flake
      nix.registry.system-flake.to = {
        type = "path";
        path = "/home/shinidev/nixos";
      };

      environment.systemPackages = with pkgs; [
        vulkan-headers
      ];

    };
}
