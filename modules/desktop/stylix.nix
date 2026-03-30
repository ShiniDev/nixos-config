{ config, pkgs, ... }:

{
  stylix.enable = true;
  stylix.autoEnable = false;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
  stylix.opacity.terminal = 0.5;
  stylix.opacity.applications = 0.8;
  stylix.opacity.desktop = 0.8;
  stylix.opacity.popups = 0.8;
  stylix.targets.chromium.enable = true;
  stylix.targets.console.enable = true;
}
