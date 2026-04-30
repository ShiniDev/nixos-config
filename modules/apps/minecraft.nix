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
        servers.tensura-custom-modpack = {
          enable = true;
          package = pkgs.neoforgeServers.neoforge-1_21_1;
          serverProperties = {
            server-port = 50000;
            difficulty = "hard";
            gamemode = "survival";
            max-players = 5;
            motd = "NixOS Tensura Minecraft server!";
            sync-chunk-writes = false;
            simulation-distance = 6;
            view-distance = 10;
            online-mode = false;
          };
          jvmOpts = "-Xms10G -Xmx10G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true";
        };
      };
    };
}
