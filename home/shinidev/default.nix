{ pkgs, ... }:
{
  imports = [
    ./services.nix
  ];
  home.username = "shinidev";
  home.homeDirectory = "/home/shinidev";
  home.packages = with pkgs; [
    discord # Unfree
    google-chrome # Unfree
    vscode # Unfree
    mako
    wofi
    wl-clipboard
    keepassxc
    waybar
    nerd-fonts.jetbrains-mono
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "ShiniDev";
          email = "markjoefreylaurente@gmail.com";
        };
      };
    };
    bash = {
      enable = true;
      shellAliases = {
        shin_nix_rebuild = "sudo nixos-rebuild switch --show-trace --log-format bar-with-logs --flake /etc/nixos#home-station";
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
