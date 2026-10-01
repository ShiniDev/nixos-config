{ ... }:
{
  flake.nixosModules.network =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.this.network;
    in
    {
      options.this.network = {
        allowedTCPPorts = lib.mkOption {
          type = lib.types.listOf lib.types.int;
          default = [ ];
        };
        allowedUDPPorts = lib.mkOption {
          type = lib.types.listOf lib.types.int;
          default = [ ];
        };
      };
      config = {
        networking.firewall = {
          enable = true;
          allowedTCPPorts = cfg.allowedTCPPorts;
          allowedUDPPorts = cfg.allowedUDPPorts;
        };
        systemd.services = {
          NetworkManager-wait-online.enable = false;
        };
        environment.systemPackages = with pkgs; [
          wireguard-tools
        ];
        networking.wireguard.enable = true;
      };
    };
}
