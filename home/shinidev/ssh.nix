{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
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
}
