{ pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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
    safeeyes
  ];

  programs.git.enable = true;
  programs.git.userName = "ShiniDev";
  programs.git.userEmail = "markjoefreylaurente@gmail.com";

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    shin_nix_rebuild = "sudo nixos-rebuild switch --show-trace --log-format bar-with-logs --flake /etc/nixos#shinixos";
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
