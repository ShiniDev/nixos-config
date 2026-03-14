{ ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shinidev = {
    uid = 1000;
    group = "shinidev";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  users.groups.shinidev.gid = 1000;
}
