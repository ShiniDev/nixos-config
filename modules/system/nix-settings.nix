{ ... }:
{
  flake.nixosModules.system-nix-settings =
    { inputs, ... }:
    {
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
    };

}
