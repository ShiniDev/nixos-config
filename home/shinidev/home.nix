{
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./pkgs.nix
    ./tex-editing-pkgs.nix
    ./env.nix
    ./browsers.nix
    ./bash.nix
    ./kitty.nix
    ./noctalia.nix
  ];
  home.username = "shinidev";
  home.homeDirectory = "/home/shinidev";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
