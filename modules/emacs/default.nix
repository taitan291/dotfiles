{
  pkgs,
  ...
}: let
  dotfilesPath = "/home/taitan/.config/nixos";
in {
  programs.emacs = {
    enable = true;
    extraPackages = emacsPackages: with emacsPackages; [
      catppuccin-theme
    ];
  };
	xdg.configFile = {
    "emacs/conf".source = ./conf;
    "emacs/init.el".source = ./init.el;
  };
  home = {
    # packages = with pkgs; [
    #   #typst
    #   typst
    #   tinymist
    #   typstyle
    #
    #   cmake
    #   libtool
    #   libvterm-neovim
    # ];
  };
}
