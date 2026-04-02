{ ... }:
{
  flake.nixosModules.system-users =
    { ... }:
    {
      users.users.shinidev = {
        uid = 1000;
        group = "shinidev";
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ3+ZgIr4gkofsH5gQYKb60t2Stx5WWsQbhAzmW6Emxm shinidev@home-station
"
        ];
      };
      users.groups.shinidev.gid = 1000;
    };
}
