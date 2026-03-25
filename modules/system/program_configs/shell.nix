{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    atuin
  ];
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;

      # Custom Palette Definitions
      palette = "chill_night";
      palettes.chill_night = {
        snow_white = "#e0def4";
        soft_blue = "#9ccfd8";
        deep_sky = "#31748f";
        faded_black = "#191724";
      };

      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status$time\n$username$hostname$directory> ";

      character = {
        success_symbol = "[](bold soft_blue) "; # Swapped green for light blue
        error_symbol = "[✗](bold red) "; # Red kept for functional clarity
      };

      directory = {
        style = "bold soft_blue";
        truncate_to_repo = true;
      };

      username = {
        show_always = true;
        style_user = "white";
        style_root = "red";
        format = "[$user]($style)|";
      };

      hostname = {
        ssh_only = false;
        style = "dimmed white";
        format = "@[$hostname]($style)|";
      };

      git_branch = {
        symbol = " ";
        style = "bold deep_sky";
      };

      time = {
        disabled = false;
        format = "[ $time]($style)";
        style = "snow_white";
        use_12hr = true;
      };

      nix_shell = {
        symbol = " ";
        style = "bold soft_blue";
        format = "via [$symbol$state]($style) ";
      };
    };
  };
  programs = {
    bash = {
      enable = true;
      completion.enable = true;
      blesh.enable = true;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color=auto";
      };
      interactiveShellInit = ''
        # --- Functions ---
        cpr() {
          rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
        }
        mvr() {
          rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
        }
        # --- Tool Integrations ---
        if command -v atuin >/dev/null 2>&1; then
          eval "$(atuin init bash)"
        fi
        if command -v nvim >/dev/null 2>&1; then
          alias vim='nvim'
        fi
        if command -v starship >/dev/null 2>&1; then
          eval "$(starship init bash)"
        fi
        bleopt complete_auto_delay=500
      '';
      promptInit = ''
        # --- Prompt Configuration ---
        sc() {
          echo "\[\e[$1m\]"
        }

        USER_COLOR=34 # blue
        USER_PROMPT="$"

        if [ "$UID" -eq 0 ]; then
          USER_COLOR=31 # red
          USER_PROMPT="#"
        fi

        PS1="$(sc 33)\d \t $(sc 0) [$(sc $USER_COLOR)\u@\h$(sc 0)]\n$(sc 32)\w $(sc $USER_COLOR)$USER_PROMPT $(sc 0) "

        unset -f sc
      '';

    };
  };

}
