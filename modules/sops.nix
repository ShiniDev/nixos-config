{ ... }: {
  flake.nixosModules.sops =
    { ... }:
    {
      sops.defaultSopsFile = ../secrets/secrets.yaml;
      sops.age.sshKeyPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];
      sops.secrets.shinidev_password = { };
      sops.secrets.home-wifi-5G_password = { };
    };
}
