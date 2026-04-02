{ inputs, self, ... }:
{
  flake.nixosModules.system-time =
    {
      ...
    }:
    {
      time.timeZone = "America/New_York";
    };
}
