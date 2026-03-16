{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/desktop.nix
    ../../modules/nix-settings.nix
    ../../modules/users.nix
    ../../modules/console.nix
    ../../modules/time.nix
    ../../modules/bash.nix
    ../../modules/system-packages.nix
    ../../modules/system-services.nix
    ../../modules/kernel-latest.nix
    ../../modules/networking.nix
  ];
  networking.hostName = "home-station"; # Define your hostname.
  system.stateVersion = "25.11"; # DO NOT CHANGE

  services = {
    cockpit.enable = true; # Port 9090
  };
}
