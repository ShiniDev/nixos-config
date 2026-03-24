{ config, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      assigns = {
        "1" = [ { app_id = "kitty"; } ];
        "2" = [
          { app_id = "google-chrome"; }
        ];
        "3" = [
          { app_id = "codium"; }
        ];
        "4" = [
          { app_id = "org.gnome.Evince"; }
          { app_id = "com.github.johnfactotum.Foliate"; }
        ];
        "5" = [
          { app_id = "org.telegram.desktop"; }
          { app_id = "vesktop"; }
        ];
      };
      bars = [ ];
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+Shift+r" = "reload";
        };
      input = {
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
          tap_button_map = "lrm";
        };
      };
      startup = [
        { command = "noctalia-shell"; }
      ];
    };
  };
}
