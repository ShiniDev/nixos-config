{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprlauncher
    brightnessctl
    vesktop
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
    mako
  ];
  programs.starship.enable = true;
  programs.kitty.enable = true;
}
