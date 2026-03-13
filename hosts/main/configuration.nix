{
  config,
  lib,
  pkgs,
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
  ];

  networking.hostName = "shinixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "ter-v32n";
    keyMap = "us";
    packages = with pkgs; [ terminus_font ];
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE
}
