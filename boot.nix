{ config, lib, pkgs, ... }:

{
	boot.initrd.luks.devices."luks_root" = {
		device = "/dev/mapper/vg_machine-lv_root";
		preLVM = false;
	};
	boot.initrd.luks.devices."luks_home" = {
		device = "/dev/mapper/vg_machine-lv_home";
		preLVM = false;
	};
	boot.initrd.luks.devices."luks_swap" = {
		device = "/dev/mapper/vg_machine-lv_swap";
		preLVM = false;
	};
}
