{ config, pkgs, ... }:
let
	dotfilesPath = "${config.home.homeDirectory}/nixos";
in
{
  programs.wezterm = {
		enable = true;
	/*
		extraPackages = with pkgs;[
	
		];
	*/
	};

  xdg.configFile."wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink ".${dotfilesPath}/wezterm/wezterm.lua";
	
	/*
	home ={
		packages = with pkgs; [

		];
	};
	*/
}
