{ self, ... }:
{
  flake.nixosModules.desktop-defaults =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.desktop-stylix
        self.nixosModules.desktop-sway
      ];
      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };
      environment.systemPackages = with pkgs; [
        pavucontrol
      ];
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];
    };
}
