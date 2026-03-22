{ pkgs, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "eDP-1"
        "HDMI-A-1"
      ];
      modules-left = [
        "hyprland/workspaces"
        "hyprland/mode"
        "wlr/taskbar"
      ];
      modules-center = [
        "hyprland/window"
        "custom/hello-from-waybar"
      ];
      modules-right = [
        "mpd"
        "custom/mymodule#with-css-id"
        "temperature"
      ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
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
  };

  programs.waybar.style = "* {\n  border: none;\n  border-radius: 0;\n  font-family: Source Code Pro;\n}\nwindow#waybar {\n  background: #16191C;\n  color: #AAB2BF;\n}\n#workspaces button {\n  padding: 0 5px;\n}\n";
}
