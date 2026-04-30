let
  # Call the function to get the flake set.
  inherit ((import ../lib/keys.nix) { }) flake;
  keys = flake.keys;
in
{
  "shinidev-password.age" = {
    publicKeys = keys.ssh.shinidev ++ keys.ssh.home-station ++ keys.ssh.home-server;
    armor = true;
  };
}
