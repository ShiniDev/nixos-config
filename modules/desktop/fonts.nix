{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    nerd-fonts.sauce-code-pro
  ];
}
