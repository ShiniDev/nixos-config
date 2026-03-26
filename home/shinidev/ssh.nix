{ ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "1h";
  };
  services.ssh-agent.enable = true;
}
