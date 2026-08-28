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
        imagemagick
        ghostscript
        llama-cpp # Added to try to run local llms
        gcc
      ];

      services.cockpit = {
        enable = true;
      };

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
