{ ... }:
{
  flake.homeModules.apps =
    { pkgs, ... }:
    {
      # BROWSERS
      programs.chromium = {
        enable = true;
        package = pkgs.chromium;
      };

      # DEVELOPMENT
      programs.vscodium = {
        enable = true;
        package = pkgs.vscodium-fhs;
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            vscodevim.vim
            # v1hz.kdl Don't uncomment, not in pkgs
          ];
        };
      };

      # GUI & WORKFLOW PACKAGES
      home.packages = with pkgs; [
        prismlauncher
        vesktop
        obsidian
        qpwgraph
        keepassxc
        evince
        foliate
        telegram-desktop
        vlc
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
