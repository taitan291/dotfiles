{pkgs, ...}: {
  home = {
    stateVersion = "25.11";
    username = "taitan";
    homeDirectory = "/home/taitan";
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "brave";
    };
  };
  imports = [
    ./packages.nix
    ./file.nix
    ./xdg.nix
    ./programs.nix

    ./nvim
    ./emacs
    ./code
    ./waybar
    ./starship
    ./file-manager/yazi.nix
    ./file-manager/thunar.nix
    ./ghostty.nix
    ./git.nix
    ./shell/zsh.nix
    ./shell/utils.nix
    ./hypr
    ./fcitx5
    ./discord.nix
    ./wlogout
    #./firefox
  ];
  programs.home-manager.enable = true;
}
