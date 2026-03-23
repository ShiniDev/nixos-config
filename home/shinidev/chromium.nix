{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;

    nativeMessagingHosts = [
      pkgs.keepassxc
    ];

    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return YouTube Dislike
      { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; } # Enhancer for YouTube
      { id = "oboonakemofpalcgghocfoadofidjkkk"; } # KeePassXC-Browser
    ];

    commandLineArgs = [
      # Privacy
      "--disable-features=MediaRouter"
      "--no-pings"
      "--disable-sync"
      "--disable-breakpad"

      # Performance
      "--enable-gpu-rasterization"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
      "--enable-hardware-overlays"
    ];
  };
}
