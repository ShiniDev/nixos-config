{ ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true; # required
  services.displayManager.defaultSession = "aerothemeplasma";

  programs.aeroshell = {
    enable = true; # required
    polkit.enable = true;
    aerothemeplasma = {
      enable = true; # required
      sddm.enable = true;
    };
  };
}
