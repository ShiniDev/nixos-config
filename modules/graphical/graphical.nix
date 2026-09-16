{ ... }:
{
  flake.nixosModules.graphical =
    { pkgs, ... }:
    {
      # Audio
      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
      };

      environment.systemPackages = with pkgs; [
        pavucontrol
        slurp
        wofi
        rofi
      ];

      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
        ];
        wlr.enable = true;
      };
      # Fonts
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      services.pipewire.extraConfig.pipewire."10-obs-virtual-audio" = {
        "context.objects" = [
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "OBS_Virtual_Audio";
              "node.description" = "OBS Virtual Audio";
              "media.class" = "Audio/Source/Virtual";
              "audio.position" = [
                "FL"
                "FR"
              ];
            };
          }
        ];
      };
      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
    };
}
