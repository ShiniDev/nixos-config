{ ... }: {
  flake.nixosModules.game-launchers = { pkgs, ... }: {
    programs = {
      steam = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      lutris
    ];
  };
}
