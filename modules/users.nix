{ USERNAME, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${USERNAME} = {
    uid = 1000;
    group = USERNAME;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  users.groups.${USERNAME}.gid = 1000;
}
