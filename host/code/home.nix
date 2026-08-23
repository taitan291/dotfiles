_: let
  home = ../../modules;
in {
  home = {
    stateVersion = "26.11";
    username = "codespace";
    homeDirectory = "/home/codespace";
    sessionVariables = {
      EDITOR = "nvim";
      #BROWSER = "brave";
    };
  };
  imports = [
    (home + "/xdg.nix")

    #(home + "/emacs")
    (home + "/nvim")
    (home + "/starship.nix")
    (home + "/file-manager/yazi.nix")
    #(home + "/ghostty.nix")
    (home + "/git.nix")
    (home + "/shell/zsh.nix")
    (home + "/shell/utils.nix")
  ];
  programs.home-manager.enable = true;
}
