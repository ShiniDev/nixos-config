{ ... }:
{
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  networking.networkmanager.appendNameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];
}
