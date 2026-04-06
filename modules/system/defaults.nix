{ inputs, self, ... }:
{
  flake.nixosModules.system-defaults =
    { inputs, pkgs, ... }:
    {
      imports = self.consts.systemModulesDefaults ++ [
        self.nixosModules.system-env
        self.nixosModules.system-networking
        self.nixosModules.system-nix-settings
        self.nixosModules.system-packages
        self.nixosModules.system-shell
        self.nixosModules.system-ssh
        self.nixosModules.system-time
        self.nixosModules.system-users
      ];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.systemd-boot.configurationLimit = 20;
      console = {
        font = "ter-v32n";
        keyMap = "us";
        packages = with pkgs; [ terminus_font ];
      };
      i18n.defaultLocale = "en_US.UTF-8";
    };
}
