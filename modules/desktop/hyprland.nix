{ ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

}
