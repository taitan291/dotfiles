{ pkgs, ... }: {
	home = {
    stateVersion = "25.11";
    username = "taitan";
    homeDirectory = "/home/taitan";
	};
  imports = [
    ./packages.nix
    ./file.nix
    ./xdg.nix
    ./programs.nix

    ./nvim
    #./emacs
    ./code
    ./waybar
    ./starship
    ./file-manager/yazi.nix
    ./file-manager/thunar.nix
    ./git.nix
    ./bash.nix
    ./hypr
    ./fcitx5
		./discord.nix
    ./shell-unit.nix
    ./wlogout
		#./firefox
  ];
	programs.home-manager.enable = true;
}
