_: let
  home = ../../modules;
in {
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
    (home + "/xdg.nix")

    (home + "/emacs")
    (home + "/nvim")
    (home + "/starship.nix")
    (home + "/file-manager/yazi.nix")
    (home + "/ghostty.nix")
    (home + "/git.nix")
    (home + "/shell/zsh.nix")
    (home + "/shell/utils.nix")
    (home + "/fcitx5")
  ];
  programs.home-manager.enable = true;
}
