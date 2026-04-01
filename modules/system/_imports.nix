{ ... }:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./env.nix
    ./locale.nix
    ./networking.nix
    ./nix-settings.nix
    ./pkgs.nix
    ./time.nix
    ./users.nix
    ./program_configs/shell.nix
    ./services/ssh.nix
  ];
}
