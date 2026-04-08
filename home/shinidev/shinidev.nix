# ./shinidev.nix
{ inputs, ... }:
{
  flake.nixosModules.shinidev-home = {
    home-manager.users.shinidev = {
      imports = [
        inputs.self.homeModules.shinidev-core
        inputs.self.homeModules.shinidev-graphical
        inputs.self.homeModules.shinidev-apps
      ];
    };
  };
}
