{ ... }: {
  flake.nixosModules.display-manager = { pkgs, ... }: {
    services.displayManager.regreet = {
      enable = true;
    };
    # Had to add this to make greetd detect niri session.
    programs.niri.enable = true;
  };
}
