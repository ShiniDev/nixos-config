{ ... }: {
  flake.nixosModules.vms = { ... }: {
    microvm.autostart = [
      "my-vm"
    ];
    microvm.vms.my-vm = {
      config = {
        # It is highly recommended to share the host's nix-store
        # with the VMs to prevent building huge images.
        microvm.shares = [
          {
            source = "/nix/store";
            mountPoint = "/nix/.ro-store";
            tag = "ro-store";
            proto = "virtiofs";
          }
        ];

        # Any other configuration for your MicroVM
        # [...]
      };
    };
  };
}
