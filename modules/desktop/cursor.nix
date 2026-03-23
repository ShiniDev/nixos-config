{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
