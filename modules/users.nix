{ self, ... }: {
  flake.nixosModules.users = { config, ... }: {
    age.secrets.shinidev-password.file = ../secrets/shinidev-password.age;
    users.mutableUsers = false;
    users.users.shinidev = {
      uid = 1000;
      group = "shinidev";
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      openssh.authorizedKeys.keys = self.keys.ssh.shinidev ++ self.keys.ssh.home-station;
      hashedPasswordFile = config.age.secrets.shinidev-password.path;
    };
    users.groups.shinidev.gid = 1000;
  };
}
