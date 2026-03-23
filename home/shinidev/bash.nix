{ ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      nixos-rebuild-switch() {
        local host="''\${"1:?Usage:" nixos-rebuild-switch <host>}"

        sudo nixos-rebuild switch \
          --log-format bar-with-logs \
          --show-trace \
          --flake ".#''\${host}"
      }
    '';
  };
}
