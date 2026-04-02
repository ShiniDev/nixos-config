{ ... }:
{
  flake.nixosModules.system-packages =
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
    };
}
