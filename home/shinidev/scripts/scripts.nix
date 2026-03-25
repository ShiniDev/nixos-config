{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "screenshot-menu" (builtins.readFile ./screenshot-menu.sh))
  ];
}
