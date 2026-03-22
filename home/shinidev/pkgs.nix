{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    brightnessctl
    firefox
    vesktop
    vscodium
    nixd
    nixfmt
    wl-clipboard
    hyprlauncher
    thunar
    waybar
  ];
}
