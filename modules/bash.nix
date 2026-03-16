{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    atuin
  ];
  programs.bash = {
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
}
