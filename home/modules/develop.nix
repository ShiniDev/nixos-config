{ ... }:
{
  flake.homeModules.develop = { pkgs, ... }: {
    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
      bash = {
        enable = true;
      };
    };
    home.packages = with pkgs; [
    ];
  };
}
