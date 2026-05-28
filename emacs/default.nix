{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable-pgtk;
    extraPackages = epkgs:
      with epkgs; [
        vterm
        multi-vterm
        doom-themes
        neotree
        projectile
        browse-kill-ring
        # undo履歴
        undo-tree
      ];
  };
  home = {
    file = {
      ".emacs.d/conf".source = ./conf;
      ".emacs.d/init.el".source = ./init.el;
    };
    packages = with pkgs; [
      #typst
      typst
      tinymist
      typstyle

      cmake
      libtool
      libvterm-neovim
    ];
  };
}
