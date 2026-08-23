{inputs, ...}: {
  home = {
    stateVersion = "26.11";
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
    ./starship.nix
    ./file-manager/yazi.nix
    ./file-manager/thunar.nix
    ./ghostty.nix
    ./git.nix
    ./shell/zsh.nix
    ./shell/utils.nix
    ./hypr/hyprlang
    # ./hypr/lua
    ./fcitx5
    ./wofi.nix
    ./discord.nix
    ./wlogout
    ./time.nix
    # inputs.private-themes.homeManagerModules.wallpaper
    # ./waybar
    ./uindows.nix
  ];
  programs.home-manager.enable = true;
}
