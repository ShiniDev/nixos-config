{ self, ... }: {
  flake.nixosModules.users = { config, ... }: {
    sops.secrets.shinidev_password.neededForUsers = true;
    users.mutableUsers = false;
    users.users.shinidev = {
      uid = 1000;
      group = "shinidev";
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      openssh.authorizedKeys.keys =
        self.keys.ssh.shinidev ++ self.keys.ssh.home-station ++ self.keys.ssh.home-server;
      hashedPasswordFile = config.sops.secrets.shinidev_password.path;
    };
    users.groups.shinidev.gid = 1000;
  };
}
