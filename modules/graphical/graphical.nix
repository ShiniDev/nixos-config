{ ... }:
{
  flake.nixosModules.graphical =
    { pkgs, ... }:
    let
      swayConfig = pkgs.writeText "greetd-sway-config" ''
        # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
        exec "${pkgs.gtkgreet}/bin/gtkgreet -l; swaymsg exit"
        bindsym Mod4+shift+e exec swaynag \
          -t warning \
          -m 'What do you want to do?' \
          -b 'Poweroff' 'systemctl poweroff' \
          -b 'Reboot' 'systemctl reboot'
      '';
    in
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
        ];
        wlr.enable = true;
      };
      # Fonts
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      # Window Manager
      programs.sway = {
        enable = true;
        package = pkgs.swayfx;
        wrapperFeatures.gtk = true;
        xwayland.enable = true;
        extraPackages = with pkgs; [
          brightnessctl
        ];
      };

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
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
          };
        };
      };

      environment.etc."greetd/environments".text = ''
        sway
        bash
      '';
      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;

      # THEMING
      stylix.enable = true;
      stylix.autoEnable = false;
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
      stylix.opacity.terminal = 0.5;
      stylix.opacity.applications = 0.8;
      stylix.opacity.desktop = 0.8;
      stylix.opacity.popups = 0.8;
      stylix.targets.chromium.enable = true;
      stylix.targets.console.enable = true;
    };
}
