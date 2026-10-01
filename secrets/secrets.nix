let
  # Call the function to get the flake set.
  keys = (import ../lib/keys.nix).flake.keys;
in
{
  "shinidev-password.age" = {
    publicKeys = keys.ssh.shinidev ++ keys.ssh.home-station;
    armor = true;
  };
}
