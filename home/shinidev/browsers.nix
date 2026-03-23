{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];
  };
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];
  };
}
