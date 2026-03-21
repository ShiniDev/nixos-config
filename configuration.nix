{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/console.nix
    ./modules/system/locale.nix
    ./modules/system/networking.nix
    ./modules/system/nix-features.nix
    ./modules/system/pkgs.nix
    ./modules/system/time.nix
    ./modules/system/users.nix
    ./modules/system/program_configs/bash.nix
    ./modules/system/services/ssh.nix
  ];
  system.stateVersion = "25.11"; # DO NOT CHANGE
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "home-station"; # Define your hostname.
  shinidev.networking.role = "desktop";
}
