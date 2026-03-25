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
