{ inputs, ... }:
{
  flake.nixosModules.shinidev-home = { ... }: {
    home-manager.users.shinidev = {
      imports = [
        inputs.self.homeModules.core
        inputs.self.homeModules.apps
        inputs.self.homeModules.niri
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
