{
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = {
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";
      monitor = "eDP-1,1920x1080@120.21300,0x0,1.25";
      input = {
        touchpad = {
          natural_scroll = true;
        };
      };
      bind = [
        "SUPER, Return, exec, $terminal"
        "SUPER, D, exec, $menu"
        "SUPER Shift, Q, killactive"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER Shift, 1, movetoworkspace, 1"
        "SUPER Shift, 2, movetoworkspace, 2"
        "SUPER Shift, 3, movetoworkspace, 3"
        "SUPER Shift, 4, movetoworkspace, 4"
        "SUPER Shift, 5, movetoworkspace, 5"
        "SUPER Shift, 6, movetoworkspace, 6"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
    };
  };
  /*
    TODO After experiencing it.
    How do I make Hyprland draw as little power as possible on my laptop?
    Useful Optimizations:

    decoration:blur:enabled = false and decoration:shadow:enabled = false to disable fancy but battery hungry effects.

    misc:vfr = true, since it’ll lower the amount of sent frames when nothing is happening on-screen.
  */

}
