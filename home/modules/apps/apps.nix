{ ... }:
{
  flake.homeModules.apps =
    { pkgs, ... }:
    {
      # BROWSERS
      programs.firefox = {
        enable = true;
        nativeMessagingHosts = [ pkgs.keepassxc ];
      };
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
        package = pkgs.vscodium;
        mutableExtensionsDir = false;

        profiles.default.extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          asvetliakov.vscode-neovim
          dracula-theme.theme-dracula
        ];

        profiles.default.userSettings = {
          "workbench.colorTheme" = "Dracula Theme";
          "editor.formatOnSave" = true;
          "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings" = {
            "nixd" = {
              "nixpkgs" = {
                "expr" = "import (builtins.getFlake (builtins.toString /home/shinidev/nixos)).inputs.nixpkgs {}";
              };
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
              "options" = {
                "nixos" = {
                  "expr" =
                    "(builtins.getFlake (builtins.toString /home/shinidev/nixos)).nixosConfigurations.home-station.options";
                };
                "home-manager" = {
                  "expr" =
                    "(builtins.getFlake (builtins.toString /home/shinidev/nixos)).nixosConfigurations.home-station.options.home-manager.users.type.getSubOptions []";
                };
              };
            };
          };
          "extensions.experimental.affinity" = {
            "asvetliakov.vscode-neovim" = 1;
          };
        };
      };

      # COMMUNICATION
      programs.vesktop = {
        enable = true;
        settings = {
          appBadge = false;
          arRPC = true;
          checkUpdates = false;
          customTitleBar = false;
          disableMinSize = true;
          minimizeToTray = false;
          tray = false;
          splashBackground = "#000000";
          splashColor = "#ffffff";
          splashTheming = true;
          staticTitle = true;
          hardwareAcceleration = true;
          discordBranch = "stable";
        };
      };

      # GUI & WORKFLOW PACKAGES
      home.packages = with pkgs; [
        prismlauncher
        graalvmPackages.graalvm-ce
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
