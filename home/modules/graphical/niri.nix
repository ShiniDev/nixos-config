{ inputs, ... }: {
  flake.homeModules.niri = { pkgs, ... }: {
    wayland.windowManager.niri = {
      enable = true;
      systemd.enable = true;
      xwaylandSatellitePackage = pkgs.xwayland-satellite;
    };
    # I might just add a symlink from this project to the niri config directory
    # that way I can change stuffs without rebuilding nix.
    # xdg.configFile."niri/config.kdl".source = ../.config/config.kdl;
    programs.waybar.enable = true;
    programs.alacritty.enable = true; # Super+T in the default setting (terminal)
    programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
    programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    services.mako.enable = true; # notification daemon
    services.swayidle.enable = true; # idle management daemon
    services.polkit-gnome.enable = true; # polkit
    home.packages = with pkgs; [
      swaybg # wallpaper
      pavucontrol
      nerd-fonts.jetbrains-mono
      brightnessctl
    ];
    # PKGS to be able to screen share.
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
  };
}
