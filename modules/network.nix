{ ... }:
{
  flake.nixosModules.network =
    { ... }:
    {
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [
          40218
          50000
          80
          443
          8080
        ];
        allowedUDPPorts = [
          27015
        ];
      };
      systemd.services = {
        NetworkManager-wait-online.enable = false;
      };
    };
}
