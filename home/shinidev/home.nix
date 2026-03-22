{
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./pkgs.nix
    ./tex-editing-pkgs.nix
  ];
  home.username = "shinidev";
  home.homeDirectory = "/home/shinidev";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
