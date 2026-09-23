{ inputs, ... }:
{
  flake.nixosModules.shinidev-home = { ... }: {
    home-manager.users.shinidev =
      let
        my = inputs.self.homeModules;
      in
      {
        imports = [
          my.core
          my.apps
          my.niri
          my.develop
        ];
        home.username = "shinidev";
        home.homeDirectory = "/home/shinidev";
        home.stateVersion = "25.11";
      };
    users.users.shinidev.extraGroups = [ "input" ];
    programs.nh.flake = "/home/shinidev/nixos";
    nixpkgs.config.allowUnfree = true; # Just for obsidian
  };
}
