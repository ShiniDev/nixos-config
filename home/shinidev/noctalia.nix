{ pkgs, inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar.position = "top";
      colorSchemes.predefinedScheme = "Monochrome"; # or "Lavender", etc.
      general.radiusRatio = 0.2;
    };
  };
}
