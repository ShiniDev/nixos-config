{ ... }:
{
  flake.nixosModules.system-env =
    { ... }:
    {
      environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };
}
