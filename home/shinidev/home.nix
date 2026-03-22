{
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./pkgs.nix
  ];
  home.username = "shinidev";
  home.homeDirectory = "/home/shinidev";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
