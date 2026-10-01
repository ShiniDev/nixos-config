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
            llvm-vs-code-extensions.vscode-clangd
            xaver.clang-format
            vadimcn.vscode-lldb
            ms-vscode.makefile-tools
            ms-vscode.cmake-tools
            usernamehw.errorlens
            mkhl.direnv
            # v1hz.kdl Don't uncomment, not in pkgs
            redhat.vscode-yaml
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
        obs-studio
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
