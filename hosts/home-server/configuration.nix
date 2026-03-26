{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ../../modules/system/_imports.nix
  ];
  system.stateVersion = "25.11"; # DO NOT CHANGE
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "home-server"; # Define your hostname.
  shinidev.networking.role = "server";
}
