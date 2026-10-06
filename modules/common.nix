{host, ...}: let
  username =
    if host == "code"
    then "codespace"
    else "taitan";
in {
  home = {
    stateVersion = "26.11";
    inherit username;
    homeDirectory = "/home/${username}";
    sessionVariables.EDITOR = "nvim";
  };

  imports = [
    ./xdg.nix
    ./nvim
    ./starship.nix
    ./file-manager/yazi.nix
    ./git.nix
    ./shell/zsh.nix
    ./shell/utils.nix
  ];

  programs.home-manager.enable = true;
}
