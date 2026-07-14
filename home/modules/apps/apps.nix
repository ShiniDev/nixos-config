{ ... }:
{
  flake.homeModules.apps =
    { pkgs, ... }:
    {
      # BROWSERS
      programs.chromium = {
        enable = true;
        package = pkgs.google-chrome;
        nativeMessagingHosts = [ pkgs.keepassxc ];
      };

      # TERMINAL
      programs.kitty = {
        enable = true;
        settings = {
          scrollback_lines = 10000;
          enable_audio_bell = false;
          update_check_interval = 0;
          background_blur = 5;
          term = "xterm-256color";
        };
      };

      # DEVELOPMENT
      programs.vscode = {
        enable = true;
        package = pkgs.vscode;
      };

      # GUI & WORKFLOW PACKAGES
      home.packages = with pkgs; [
        prismlauncher
        discord
        thunar
        keepassxc
        evince
        foliate
        telegram-desktop
        (texliveSmall.withPackages (
          ps: with ps; [
            latexmk
            titlesec
            enumitem
            geometry
            fullminipage
            roboto
            latexindent
            marvosym
            hvfloat
            xcolor
            hyperref
            charter
            cmap
            fontaxes
          ]
        ))
      ];
    };
}
