{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks_root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E9BB-97A3";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/luks_home";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/mapper/luks_swap"; }
  ];

  boot.initrd.luks.devices = {
    "luks_root" = {
      device = "/dev/mapper/vg_machine-lv_root";
      preLVM = false;
    };
    "luks_home" = {
      device = "/dev/mapper/vg_machine-lv_home";
      preLVM = false;
    };
    "luks_swap" = {
      device = "/dev/mapper/vg_machine-lv_swap";
      preLVM = false;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
