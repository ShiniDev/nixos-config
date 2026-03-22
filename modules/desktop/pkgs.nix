{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    vesktop
    vscodium
    nixd
    nixfmt
    wl-clipboard
    hyprlauncher
    thunar
  ];
}
