{ ... }:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./locale.nix
    ./networking.nix
    ./nix-features.nix
    ./pkgs.nix
    ./time.nix
    ./users.nix
    ./program_configs/shell.nix
    ./services/ssh.nix
  ];
}
