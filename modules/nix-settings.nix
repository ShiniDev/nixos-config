{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    vim
    htop
    wget
    git
    neovim
    nerd-fonts.jetbrains-mono
    fastfetch
    tree
    nixd
    nixfmt
  ];

  services.tuned.enable = true;
}
