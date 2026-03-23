{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    brightnessctl
    vesktop
    vscodium
    nixd
    nixfmt
    wl-clipboard
    hyprlauncher
    thunar
    keepassxc
    evince
    foliate
    telegram-desktop
    bibata-cursors
  ];
}
