{
  ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      # background_opacity = "0.3";
      background_blur = 5;
      term = "xterm-256color";
    };
  };
}
