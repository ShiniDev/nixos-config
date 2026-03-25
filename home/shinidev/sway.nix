{ config, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    extraConfig = ''
      hide_edge_borders --i3 smart
      smart_borders on
      corner_radius 20
      blur enable
      blur_passes 2
      shadows enable
      default_dim_inactive 0.2
    '';
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      workspaceLayout = "default";
      output = {
        "eDP-1" = {
          scale = "1";
        };
      };
      gaps = {
        outer = 10;
        inner = 5;
      };
      window = {
        titlebar = false;
        border = 0;

        commands = [
          {
            criteria = {
              workspace = "1";
            };
            command = "layout splitv";
          }
        ];
      };
      assigns = {
        "1" = [ { app_id = "kitty"; } ];
        "2" = [
          { app_id = "google-chrome"; }
        ];
        "3" = [
          { app_id = "codium"; }
          { app_id = "code"; }
        ];
        "4" = [
          { app_id = "org.gnome.Evince"; }
          { app_id = "com.github.johnfactotum.Foliate"; }
          { app_id = "org.keepassxc.KeePassXC"; }
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
          "${modifier}+d" = "exec noctalia-shell ipc call launcher toggle";
          "Print" = "exec screenshot-menu";

          # Media Controls (Audio)
          "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          # Media Controls (Playback)
          "--locked XF86AudioNext" = "exec playerctl next";
          "--locked XF86AudioPause" = "exec playerctl play-pause";
          "--locked XF86AudioPlay" = "exec playerctl play-pause";
          "--locked XF86AudioPrev" = "exec playerctl previous";

          # Brightness Controls
          "XF86MonBrightnessUp" = "exec brightnessctl -e4 -n2 set 5%+";
          "XF86MonBrightnessDown" = "exec brightnessctl -e4 -n2 set 5%-";
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
        { command = "kitty"; }
        { command = "google-chrome"; }
      ];
    };
  };
}
