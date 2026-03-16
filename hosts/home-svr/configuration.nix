{
  ...
}:
{
  imports = [
    ../../modules/bash.nix
    ../../modules/console.nix
    ../../modules/nix-settings.nix
    ../../modules/system-packages.nix
    ../../modules/system-services.nix
    ../../modules/time.nix
    ../../modules/users.nix
    ../../modules/kernel-latest.nix
  ];
  networking.hostName = "home-svr";
  system.stateVersion = "25.11";
}
