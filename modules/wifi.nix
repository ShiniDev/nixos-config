{ ... }: {
  flake.nixosModules.wifi =
    { config, ... }:
    let
      homeWifi = "home-wifi-5G";
      homeWifiPassword = config.sops.placeholder.home-wifi-5G_password;
    in
    {
      sops.templates = {
        "${homeWifi}.nmconnection" = {
          path = "/etc/NetworkManager/system-connections/${homeWifi}.nmconnection";
          mode = "0400";
          content = ''
            [connection]
            id=${homeWifi}
            autoconnect-priority=100
            type=wifi

            [wifi]
            mode=infrastructure
            ssid=${homeWifi}

            [wifi-security]
            auth-alg=open
            key-mgmt=wpa-psk
            psk=${homeWifiPassword}

            [ipv4]
            method=auto

            [ipv6]
            addr-gen-mode=default
            method=auto

            [proxy]
          '';
        };
      };
    };
}
