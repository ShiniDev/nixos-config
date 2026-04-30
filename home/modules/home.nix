{ ... }:
{
  flake.homeModules.core =
    { pkgs, ... }:
    {
      programs.home-manager.enable = true;

      # ENV
      home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        XCURSOR_THEME = "Bibata-Modern-Classic";
        XCURSOR_SIZE = "24";
      };

      # BASH
      programs.bash = {
        enable = true;
        initExtra = ''
          nixos-rebuild-switch() {
            local host="''\${1:?Usage: nixos-rebuild-switch <host>}"

            sudo nixos-rebuild switch \
              --log-format bar-with-logs \
              --show-trace \
              --flake ".#''\${host}"
          }
        '';
      };

      # SSH
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks = {
          "github.com" = {
            identityFile = "~/.ssh/id_ed25519_home-stn-01";
          };
          "*" = {
            compression = true;
            addKeysToAgent = "1h";
          };
          "home-server" = {
            hostname = "192.168.0.10";
            user = "shinidev";
            port = 40218;
          };
        };
      };
      services.ssh-agent.enable = true;

      # CONSOLE & SCRIPTS
      programs.starship.enable = true;
      home.packages = with pkgs; [
        nixd
        nixfmt
        wl-clipboard
        grim
        slurp
        (writeShellScriptBin "screenshot-menu" (builtins.readFile ./.scripts/screenshot-menu.sh))
      ];
    };
}
