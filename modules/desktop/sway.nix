{ pkgs, ... }:
{
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
}
