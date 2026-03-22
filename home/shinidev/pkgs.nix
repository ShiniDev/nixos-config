{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    hyprlauncher
    brightnessctl
  ];
}
