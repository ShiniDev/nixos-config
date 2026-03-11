{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "shinixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "ter-v32n";
    keyMap = "us";
    packages = with pkgs; [ terminus_font ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shinidev = {
    uid = 1000;
    group = "shinidev";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  users.groups.shinidev.gid = 1000;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    wofi
    wl-clipboard
    nixfmt
    neovim
    keepassxc
    waybar
    nixd
    nerd-fonts.jetbrains-mono
    fastfetch
    mako
    tree
    flameshot
    tuned
    discord # Unfree
    google-chrome # Unfree
    vscode # Unfree
  ];

  services.tuned.enable = true;

  programs.sway.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true; # required
  services.displayManager.defaultSession = "aerothemeplasma";

  programs.aeroshell = {
    enable = true; # required
    polkit.enable = true;
    aerothemeplasma = {
      enable = true; # required
      sddm.enable = true;
    };
  };

  system.stateVersion = "25.11"; # DO NOT CHANGE
}
