{ inputs, ... }:
{
  flake.nixosModules.home-shinidev-graphical =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      # THEME INTEGRATIONS
      stylix.targets.kitty.enable = true;
      stylix.targets.starship.enable = true;
      stylix.targets.sway.enable = true;
      stylix.targets.mako.enable = true;
      stylix.targets.wofi.enable = true;

      # SHELL & BARS
      programs.noctalia-shell = {
        enable = true;
        settings = (builtins.fromJSON (builtins.readFile ../.config/noctalia.json)).settings;
      };

      programs.waybar.enable = true;
      programs.waybar.settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [ "eDP-1" ];
          modules-left = [
            "hyprland/workspaces"
            "hyprland/mode"
          ];
          modules-center = [ "hyprland/window" ];
          modules-right = [
            "mpd"
            "clock"
            "temperature"
            "battery"
          ];

          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            sort-by-number = true;
          };
          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };

        programs.waybar.style = ''
          #workspaces button {
            color: #000000;
          }
        '';
      };

      # WAYLAND COMPOSITOR: SWAY
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
            "2" = [ { app_id = "google-chrome"; } ];
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
              "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
              "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
              "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
              "--locked XF86AudioNext" = "exec playerctl next";
              "--locked XF86AudioPause" = "exec playerctl play-pause";
              "--locked XF86AudioPlay" = "exec playerctl play-pause";
              "--locked XF86AudioPrev" = "exec playerctl previous";
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
            { command = "mako"; }
            { command = "kitty"; }
            { command = "google-chrome"; }
          ];
        };
      };

      # WAYLAND COMPOSITOR: HYPRLAND
      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        systemd.variables = [ "NIXOS_OZONE_WL" ];
        settings = {
          monitor = ",preferred,auto,1.20";
          "$terminal" = "kitty";
          "$fileManager" = "thunar";
          "$menu" = "hyprlauncher";
          "$mainMod" = "SUPER";
          env = [
            "XCURSOR_SIZE,24"
            "HYPRCURSOR_SIZE,24"
          ];
          general = {
            gaps_in = 5;
            gaps_out = 5;
            border_size = 2;
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };
          decoration = {
            rounding = 10;
            rounding_power = 2;
            active_opacity = 1.0;
            inactive_opacity = 1.0;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };
          animations = {
            enabled = "yes, please :)";
            bezier = [
              "easeOutQuint,   0.23, 1,    0.32, 1"
              "easeInOutCubic, 0.65, 0.05, 0.36, 1"
              "linear,         0,    0,    1,    1"
              "almostLinear,   0.5,  0.5,  0.75, 1"
              "quick,          0.15, 0,    0.1,  1"
            ];
            animation = [
              "global,        1, 10,  default"
              "border,        1, 5,   easeOutQuint"
              "windows,       1, 5,   easeOutQuint"
              "windowsIn,     1, 4,   easeOutQuint, popin 87%"
              "windowsOut,    1, 1,   linear,       popin 87%"
              "fadeIn,        1, 2,   almostLinear"
              "fadeOut,       1, 1,   almostLinear"
              "fade,          1, 3,   quick"
              "layers,        1, 4,   easeOutQuint"
              "layersIn,      1, 4,   easeOutQuint, fade"
              "layersOut,     1, 2,   linear,       fade"
              "fadeLayersIn,  1, 2,   almostLinear"
              "fadeLayersOut, 1, 1,   almostLinear"
              "workspaces,    1, 2,   almostLinear, fade"
              "workspacesIn,  1, 1,   almostLinear, fade"
              "workspacesOut, 1, 2,   almostLinear, fade"
              "zoomFactor,    1, 7,   quick"
            ];
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };
          master = {
            new_status = "master";
          };
          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
          };
          input = {
            kb_layout = "us";
            follow_mouse = 1;
            sensitivity = 0.15;
            touchpad = {
              natural_scroll = true;
            };
          };
          gesture = "3, horizontal, workspace";
          device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
          };
          bind = [
            "$mainMod, Return, exec, $terminal"
            "$mainMod Shift, Q, killactive,"
            "$mainMod Shift, E, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
            "$mainMod, F, exec, $fileManager"
            "$mainMod, V, togglefloating,"
            "$mainMod, D, exec, $menu"
            "$mainMod, P, pseudo,"
            "$mainMod, J, layoutmsg, togglesplit"
            "$mainMod, left,  movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up,    movefocus, u"
            "$mainMod, down,  movefocus, d"
            "$mainMod Shift, left, movewindow, l"
            "$mainMod Shift, right, movewindow, r"
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"
            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up,   workspace, e-1"
          ];
          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
            "$mainMod ALT, mouse:272, resizewindow"
          ];
          bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
            ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
          ];
          bindl = [
            ", XF86AudioNext,  exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay,  exec, playerctl play-pause"
            ", XF86AudioPrev,  exec, playerctl previous"
          ];
          windowrule = [
            {
              name = "suppress-maximize-events";
              "match:class" = ".*";
              suppress_event = "maximize";
            }
            {
              name = "fix-xwayland-drags";
              "match:class" = "^$";
              "match:title" = "^$";
              "match:xwayland" = true;
              "match:float" = true;
              "match:fullscreen" = false;
              "match:pin" = false;
              no_focus = true;
            }
            {
              name = "move-hyprland-run";
              "match:class" = "hyprland-run";
              move = "20 monitor_h-120";
              float = true;
            }
            "workspace 1 silent, match:class kitty"
            "workspace 2 silent, match:class firefox"
            "workspace 2 silent, match:class google-chrome"
            "workspace 3 silent, match:class codium"
            "workspace 5 silent, match:class thunar"
            "workspace 5 silent, match:class vesktop"
            "workspace 4 silent, match:class org.keepassxc.KeePassXC"
            "workspace 4 silent, match:class com.github.johnfactotum.Foliate"
            "workspace 4 silent, match:class org.gnome.Evince"
            "workspace 5 silent, match:class org.telegram.desktop"
          ];
          exec-once = [
            "noctalia-shell"
            "kitty"
            "google-chrome"
          ];
        };
      };

      # GRAPHICAL PACKAGES
      home.packages = with pkgs; [
        hyprlauncher
        brightnessctl
        bibata-cursors
        wofi
        mako
      ];
    };
}
