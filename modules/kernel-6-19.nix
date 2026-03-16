{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_6_19;
}
