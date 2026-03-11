{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    wofi
    wl-clipboard
    nixfmt
    neovim
    keepassxc
    waybar
    nixd
    nerd-fonts.jetbrains-mono
    fastfetch
    mako
    tree
    flameshot
    tuned
    discord # Unfree
    google-chrome # Unfree
    vscode # Unfree
  ];

  services.tuned.enable = true;
}
