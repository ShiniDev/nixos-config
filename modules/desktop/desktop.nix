{ lib, config, ... }:
{
  options.shinidev.desktop = {
    windowManager = lib.mkOption {
      type = lib.types.enum [
        "sway"
        "hyprland"
      ];
      default = "hyprland";
      description = "The window manager config to use.";
    };
  };
  config = lib.mkMerge [
    (lib.mkIf (config.shinidev.desktop.windowManager == "sway") {

    })
    (lib.mkIf (config.shinidev.desktop.windowManager == "hyprland") {
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
      };
    })
  ];
}
