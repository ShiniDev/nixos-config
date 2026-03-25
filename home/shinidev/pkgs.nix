{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    brightnessctl
    vesktop
    # vscodium
    vscode
    nixd
    nixfmt
    wl-clipboard
    thunar
    keepassxc
    evince
    foliate
    telegram-desktop
    bibata-cursors
    grim
    slurp
    wofi
  ];
}
