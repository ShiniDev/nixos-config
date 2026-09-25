{ ... }: {
  flake.nixosModules.system = { inputs, pkgs, ... }: {
    console = {
      font = "ter-v32n";
      keyMap = "us";
      packages = with pkgs; [ terminus_font ];
    };
    i18n.defaultLocale = "en_US.UTF-8";
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nix.nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
    security.sudo.extraConfig = ''
      Defaults    timestamp_timeout=30
    '';
    environment.variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
    environment.systemPackages = with pkgs; [
      vim
      git
      fastfetch
      curl
    ];
    networking.networkmanager.enable = true;
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "all --keep 5 --keep-since 7d --optimise";
    };
  };
}
