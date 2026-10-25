{inputs, ...}: {
  imports = [
    inputs.dotNixvim.homeModules.nvim
    inputs.dotEmacsd.homeModules.emacs
  ];

  programs.emacs-twist.enable = true;
}
