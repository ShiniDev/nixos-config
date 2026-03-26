{ ... }:
{
  imports = [
    ./pkgs.nix
    ./tex-editing-pkgs.nix
    ./env.nix
    ./browsers.nix
    ./bash.nix
    ./kitty.nix
    ./noctalia.nix
    ./sway.nix
    ./ssh.nix
    ./scripts/scripts.nix
    # ./hyprland.nix
  ];
}
