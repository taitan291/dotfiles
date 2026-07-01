{...}: {
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

    ./nvim
    ./emacs
    ./waybar
    ./starship.nix
    ./file-manager/yazi.nix
    ./file-manager/thunar.nix
    ./ghostty.nix
    ./git.nix
    ./shell/zsh.nix
    ./shell/utils.nix
    ./hypr
    ./fcitx5
    ./wofi.nix
    ./discord.nix
    ./wlogout
    #./firefox
  ];
  programs.home-manager.enable = true;
}
