{ ... }:
{
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 55;
        STOP_CHARGE_THRESH_BAT0 = 60;
      };
    };
    cockpit.enable = true; # Port 9090
    firewalld.enable = true;
  };
  networking.networkmanager.enable = true;
}
