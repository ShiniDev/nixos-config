{ ... }:
{
  flake.nixosModules.networking =
    { ... }:
    {
      networking.networkmanager.enable = true;
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [
          40218
          50000
          80
          443
        ];
      };
    };
}
