{ lib, config, ... }:
{
  options.shinidev.networking = {
    role = lib.mkOption {
      type = lib.types.enum [
        "desktop"
        "server"
      ];
      default = "server";
      description = "Networking role of this machine.";
    };
  };
  config = {
    networking.networkmanager.enable = true;
    networking.firewall = {
      enable = true;
      allowedTCPPorts = lib.mkMerge [
        # Default Ports
        [ 40218 ]
        # Server Ports
        (lib.mkIf (config.shinidev.networking.role == "server") [
          80
          443
        ])
      ];
    };
  };
}
