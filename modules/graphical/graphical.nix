{ ... }:
{
  flake.nixosModules.graphical =
    { pkgs, ... }:
    {
      # Audio
      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };
      environment.systemPackages = with pkgs; [
        pavucontrol
      ];

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
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.greetd}/bin/agreety --cmd sway";
          };
        };
      };
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
