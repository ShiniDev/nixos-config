{ ... }:
{
  flake.nixosModules.sandbox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        p7zip
        unzip
        tmux
      ];
    };
}
