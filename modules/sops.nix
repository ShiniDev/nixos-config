{ ... }: {
  flake.nixosModules.sops = { ... }: {
    sops.defaultSopsFile = ../secrets/secrets.json;
    sops.age.sshKeyPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
    ];
    sops.secrets.shinidev_password = { };
  };
}
