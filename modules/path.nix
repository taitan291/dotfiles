{
  home.sessionVariables.BROWSER = "brave";
  imports = [
    ./common.nix
    ./packages.nix
    ./file.nix
    ./file-manager/thunar.nix
    ./ghostty.nix
    ./hypr
    ./fcitx5
    ./wofi.nix
    ./discord.nix
    ./wlogout
    ./time.nix
    ./claude.nix
    ./nvim
    ./emacs
    ./sunshine.nix

    ./uindows.nix
  ];
}
