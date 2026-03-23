{ pkgs, lib, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "eDP-1"
      ];
      modules-left = [
        "hyprland/workspaces"
        "hyprland/mode"
        # "wlr/taskbar"
      ];
      modules-center = [
        "hyprland/window"
        # "custom/hello-from-waybar"
      ];
      modules-right = [
        "mpd"
        # "custom/mymodule#with-css-id"
        "clock"
        "temperature"
        "battery"
      ];

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        /*
          format-icons = {
            "1" = "  ";
            "2" = "  ";
            "3" = "  ";
            "4" = "  ";
            "5" = "  ";
            # urgent = "";
            # active = "";
            # default = "";
          };
        */
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

    # programs.waybar.style = lib.readFile ./waybar.css;
    programs.waybar.style = ''
      #workspaces button {
        color: #000000;
      }
    '';
  };
}
