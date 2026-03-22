{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		firefox
		vesktop
		vscodium
	];
}
