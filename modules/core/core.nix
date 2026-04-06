{ self, ... }:
{
  flake.nixosModules.core =
    { inputs, pkgs, ... }:
    {
      # BOOT
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.systemd-boot.configurationLimit = 20;

      # CONSOLE
      console = {
        font = "ter-v32n";
        keyMap = "us";
        packages = with pkgs; [ terminus_font ];
      };
      i18n.defaultLocale = "en_US.UTF-8";

      # TIME
      time.timeZone = "America/New_York";

      # DEFAULT USER
      users.users.shinidev = {
        uid = 1000;
        group = "shinidev";
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ3+ZgIr4gkofsH5gQYKb60t2Stx5WWsQbhAzmW6Emxm shinidev@home-station
"
        ];
      };
      users.groups.shinidev.gid = 1000;

      # ENVS
      environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      # NIX SETTINGS
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.nixPath = [
        "nixpkgs=${inputs.nixpkgs}"
      ];
      nixpkgs.config = {
        allowUnfree = true;
      };

      # DEFAULT PACKAGES TO INSTALL
      environment.systemPackages = with pkgs; [
        vim
        neovim
        htop
        wget
        git
        neovim
        fastfetch
        curl
        tree
      ];

      # SERVICES
      services.openssh = {
        enable = true;
        ports = [ 40218 ];
        settings = {
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };
}
