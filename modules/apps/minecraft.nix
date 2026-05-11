{ ... }:
{
  flake.nixosModules.minecraft =
    { pkgs, ... }:
    {
      # I'm just gonna copy the server config and mods manually, as it is too much of a hassle to create a online modpack for it.
      services.minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;
        servers.tensura-custom-modpack =
          let
            modpack = pkgs.fetchPackwizModpack {
              url = "https://raw.githubusercontent.com/ShiniDev/minecraft-tensura-packwiz/refs/heads/main/pack.toml";
              packHash = "";
            };
          in
          {
            enable = true;
            package = pkgs.neoforgeServers.neoforge-1_21_1;
            symlinks = {
              "mods" = "${modpack}/mods";
            };
            files = {
              "config" = "${modpack}/config";
            };
            serverProperties = {
              allow-flight = true;
              server-port = 50000;
              level-seed = "101694099717";
              difficulty = "hard";
              gamemode = "survival";
              max-players = 5;
              max-tick-time = -1;
              motd = "NixOS Tensura Minecraft server!";
              sync-chunk-writes = false;
              simulation-distance = 6;
              view-distance = 10;
              online-mode = false;
            };
            jvmOpts = "-Xms8G -Xmx8G -XX:+UseZGC -XX:+ZGenerational -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+PerfDisableSharedMem";
          };
      };
    };
}
