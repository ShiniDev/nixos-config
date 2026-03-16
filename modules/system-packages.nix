{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    htop
    wget
    git
    neovim
    fastfetch
    tree
    nixd
    nixfmt
    php85
  ];
}
