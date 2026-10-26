{inputs, ...}: {
  imports = [
    ./nvim
    inputs.dotEmacsd.homeModules.emacs
  ];

  programs.emacs-twist.enable = true;
}
