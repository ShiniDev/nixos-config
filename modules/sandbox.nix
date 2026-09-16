{ ... }:
{
  flake.nixosModules.sandbox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
      ];
      services.cockpit = {
        enable = true;
      };
    };
}
