{ inputs, pkgs, ... }:
{
  environment.systemPackages = [ inputs.agenix.packages.${pkgs.system}.default ];
}
