{
  home.sessionVariables.BROWSER = "brave";
  imports = [
    ./common.nix
    ./packages.nix
    ./file.nix
    ./emacs
    ./file-manager/thunar.nix
    ./ghostty.nix
    ./hypr
    ./fcitx5
    ./wofi.nix
    ./discord.nix
    ./wlogout
    ./time.nix

    ./uindows.nix
    ./ui_roid.nix
  ];
}
