{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 40218 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
