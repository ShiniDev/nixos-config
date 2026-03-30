{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "1h";
      };
    };
  };
  services.ssh-agent.enable = true;
}
