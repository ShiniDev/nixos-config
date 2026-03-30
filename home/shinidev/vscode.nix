{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;

    # 1. Declare your extensions
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      asvetliakov.vscode-neovim
      dracula-theme.theme-dracula
    ];

    # 2. Configure Settings
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Dracula Theme";
      "editor.formatOnSave" = true;
      "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/shinidev/nixos\").nixosConfigurations.home-station.options";
            };
            "home-manager" = {
              "expr" =
                "(builtins.getFlake \"/home/shinidev/nixos\").nixosConfigurations.home-station.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
    };
  };
}
