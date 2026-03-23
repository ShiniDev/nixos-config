{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/_imports.nix
    ../../modules/desktop/_imports.nix
  ];
  system.stateVersion = "25.11"; # DO NOT CHANGE
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "home-station"; # Define your hostname.
  shinidev.networking.role = "desktop";
}
