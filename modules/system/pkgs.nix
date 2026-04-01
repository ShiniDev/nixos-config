{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    htop
    wget
    git
    neovim
    fastfetch
    curl
    tree
  ];
}
