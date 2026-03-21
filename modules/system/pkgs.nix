{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    htop
    wget
    git
    neovim
    fastfetch
    curl
  ];
}
