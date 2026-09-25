{ ... }:
{
  flake.nixosModules.audio =
    { ... }:
    {
      services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
      };
    };
}
