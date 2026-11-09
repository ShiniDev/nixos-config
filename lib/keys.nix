{
  flake = {
    keys = {
      ssh = {
        shinidev = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ3+ZgIr4gkofsH5gQYKb60t2Stx5WWsQbhAzmW6Emxm shinidev@home-station
"
        ];
        home-station = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKns1cmatslfrLqtYGzcso0yBijYpAS4rT/4JfBdgKm9 root@home-station
"
        ];
        home-server = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJS7GXbaLjjaq4ZeuUTVEdtSoj8AWRZ80uGFb8vibIC2 root@home-server
"
        ];
      };
    };
  };
}
