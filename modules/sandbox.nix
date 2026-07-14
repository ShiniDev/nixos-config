{ ... }:
{
  flake.nixosModules.sandbox =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        p7zip
        unzip
        tmux
        packwiz
      ];
      services.nginx = {
        enable = true;
        virtualHosts = {
          localhost = {
            root = "/srv/nginx";
            locations = {
              "/" = {
                extraConfig = "autoindex on;";
              };
            };
          };
        };
      };
    };
}
