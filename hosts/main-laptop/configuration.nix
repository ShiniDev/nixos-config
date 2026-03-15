{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/desktop.nix
    ../../modules/networking.nix
    ../../modules/nix-settings.nix
    ../../modules/users.nix
    ../../modules/console.nix
    ../../modules/time.nix
  ];
  networking.hostName = "shinixos"; # Define your hostname.
  system.stateVersion = "25.11"; # DO NOT CHANGE

  services.cockpit.enable = true;
}
