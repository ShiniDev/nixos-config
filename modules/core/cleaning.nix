{ ... }:
{
  flake.nixosModules.cleaning = { ... }: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "all --keep 5 --keep-since 7d --optimise";
    };
  };
}
